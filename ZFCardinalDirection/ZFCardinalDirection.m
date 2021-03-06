//
//  ZFCardinalDirection
//
//  Copyright © 2012 Steve Foster <foster@flightblog.org>
//
//  Permission is hereby granted, free of charge, to any person obtaining
//  a copy of this software and associated documentation files (the “Software”),
//  to deal in the Software without restriction, including without limitation the
//  rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is furnished
//  to do so, subject to the following conditions:

//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.

//  THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
//  INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
//  PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
//  HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
//  CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
//  OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#import "ZFCardinalDirection.h"


@implementation ZFCardinalDirection

- (instancetype) init {
    return [self initWithCompassHeadingInDegrees:@0.00];
}

- (instancetype) initWithCompassHeadingInDegrees:(NSNumber *)compassHeadingInDegrees {
    if (self = [super init]) {
        _compassHeadingInDegrees = compassHeadingInDegrees;
    }
    return self;
}

- (instancetype) initWithCompassHeadingAbbreviation:(NSString *)headingAbbreviation {
    if (self = [super init]) {
        _compassHeadingInDegrees = [self degreesFromHeadingAbbreviation:headingAbbreviation];
    }
    return self;
}


#pragma mark Find Headings

- (BOOL) validateDegrees {

    NSNumber *zero = @0.00;
    NSNumber *threeSixty = @360.00;

    NSComparisonResult testForZero = [zero compare:_compassHeadingInDegrees];
    NSComparisonResult testForThreeSixty = [threeSixty compare:_compassHeadingInDegrees];

    if ((testForZero == NSOrderedSame || testForZero == NSOrderedAscending) && (testForThreeSixty == NSOrderedSame || testForThreeSixty == NSOrderedDescending)){
        return 1;
    }
    return 0;
}

- (NSArray *)findHeadingFromFileWithName:(NSString *)fileName {
    NSString *filePath = [[NSBundle bundleForClass:[ZFCardinalDirection class]] pathForResource:fileName ofType:@"plist"];

    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        NSArray *matchedPoint = [[NSArray alloc] initWithContentsOfFile:filePath];
        NSPredicate *p = [NSPredicate predicateWithFormat:@"(degreeLow <= %@) and (degreeHigh => %@) ", _compassHeadingInDegrees, _compassHeadingInDegrees];
        NSArray *compassRoseResults = [matchedPoint filteredArrayUsingPredicate:p];

        return compassRoseResults;
    }

    return nil;
}

- (NSArray *)findHeading {
    return [self findHeadingFromFileWithName:@"compassPoint"];
}

- (NSArray *)findSixteenPointHeading {
    return [self findHeadingFromFileWithName:@"sixteenPointCompass"];
}

- (NSArray *)findEightPointHeading {
    return [self findHeadingFromFileWithName:@"eightPointCompass"];
}

- (NSNumber *)degreesFromHeadingAbbreviation:(NSString *)headingAbbreviation {

    NSString *filePath = [[NSBundle bundleForClass:[ZFCardinalDirection class]] pathForResource:@"compassPoint" ofType:@"plist"];;
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {

        NSArray *matchedPoint = [[NSArray alloc] initWithContentsOfFile:filePath];
        NSPredicate *p = [NSPredicate predicateWithFormat:@"(abbreviation == %@)", headingAbbreviation];
        NSArray *compassRoseResults = [matchedPoint filteredArrayUsingPredicate:p];

        if ([compassRoseResults count]) {
            NSNumber *degreeLow = [compassRoseResults[0] valueForKey:@"degreeLow"];
            NSNumber *degreeHigh = [compassRoseResults[0] valueForKey:@"degreeHigh"];
            return @(([degreeLow doubleValue]+[degreeHigh doubleValue])/2.0);
        }
        return nil;
    }

    return nil;
}


#pragma mark Return Methods for Compass Points

/** Each return method validates degrees to insure is falls between 0 and 360. */

- (NSNumber *) headingPoint {

    if ([self validateDegrees]) {
        return [[self findHeading][0] valueForKey:@"block"];
    }
    return nil;
}

- (NSString *) headingInEnglish {

    if ([self validateDegrees]) {
        return [[self findHeading][0] valueForKey:@"point"];
    }
    return nil;
}

- (NSString *)eightPointHeadingInEnglish {

    if ([self validateDegrees]) {
        return [[self findEightPointHeading][0] valueForKey:@"point"];
    }
    return nil;
}

- (NSString *)sixteenPointHeadingAbbreviation {

    if ([self validateDegrees]) {
        return [[self findSixteenPointHeading][0] valueForKey:@"abbreviation"];
    }

    return nil;
}

- (NSString *)headingAbbreviation {

    if ([self validateDegrees]) {
        return [[self findHeading][0] valueForKey:@"abbreviation"];
    }
    return nil;
}


- (NSString *) headingTraditionalWindPoint {

    if ([self validateDegrees]) {
        return [[self findHeading][0] valueForKey:@"traditionalWind"];
    }
    return nil;
}

@end

