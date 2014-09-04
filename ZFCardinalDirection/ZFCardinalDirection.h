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

#import <Foundation/Foundation.h>


@interface ZFCardinalDirection : NSObject

/*!
 Compass heading in degrees
 */
@property (nonatomic, readwrite) NSNumber *compassHeadingInDegrees;


/*! Initializer for setting degrees
 @param compass heading in degrees. Must be a value equal to or greater then 0 and equal to or less then 360.
 */
- (instancetype) initWithCompassHeadingInDegrees:(NSNumber *)compassHeadingInDegrees;


/*! Initializer for setting abbreviation
 @param compass heading abbreviation.  E.g. NE, N, SSW etc.
 */
- (instancetype) initWithCompassHeadingAbbreviation:(NSString *)headingAbbreviation;



/*! The 32 compass point names.
 @return compass point (1 to 32)
 */
- (NSNumber *) headingPoint;


/*!
 @return cardinal headings & sub-headings (example South by Southwest, North, Northwest West)
 */
- (NSString *) headingInEnglish;


/*!
 @return 8 point cardinal headings (north, northeast, east, southeast, south, southwest, west, northwest)
 */
- (NSString *) eightPointHeadingInEnglish;


/*!
 @return abbreviation of headingInEnglish (example N, SbSW)
 */
- (NSString *) headingAbbreviation;


/*!
 @return traditional seafarers names
 */
- (NSString *) headingTraditionalWindPoint;

@end
