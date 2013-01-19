# ZFCardinalDirection #

Boxing the Compass - Cardinal and ordinal compass directions derived from compass degrees implemented in 
Objective-C.

### From Wikipedia.org ###
Boxing the compass is the action of naming all thirty-two clockwise points of the compass in order. Such names are 
formed by the initials of the cardinal directions and their intermediate ordinal directions, and are very handy to 
refer to a heading (or course or azimuth) in a general or colloquial fashion, without having to resort to computing 
or recalling degrees. 

http://en.wikipedia.org/wiki/Boxing_the_compass

### Usage ###

    ZFCardinalDirection *heading = [[ZFCardinalDirection alloc] init];
    [heading setCompassHeadingInDegress:[NSNumber numberWithDouble:209]];
    NSLog(@"Block:'%@' Heading:'%@' Abb:'%@' Triditional Wind:'%@'", [heading headingPoint], [heading headingInEnglish], [heading headingAbbreviation],[heading headingTraditionalWindPoint]);
    */    

    ZFCardinalDirection *heading = [[ZFCardinalDirection alloc] initWithCompassHeadingInDegrees:[NSNumber numberWithFloat:360]];
    
    [heading headingPoint];
    [heading headingInEnglish];
    [heading headingAbbreviation];
    [heading headingTraditionalWindPoint];

    NSLog(@"Block:'%@' Heading:'%@' Abb:'%@' Triditional Wind:'%@'", [heading headingPoint], [heading headingInEnglish],[heading headingAbbreviation],[heading headingTraditionalWindPoint]);
 
    //Testing of all degrees 0 to 360
    ZFBoxingCompass *heading;
    double degrees = 0;
    
    while ( degrees < 360.01 )
    {

        NSNumber *testDegree = [NSNumber numberWithDouble:degrees];
        
        heading = [[ZFBoxingCompass alloc] initWithCompassHeadingInDegrees:testDegree];
    
        NSLog(@"%@\u00B0 -> Block:'%@' Heading:'%@' Abb:'%@' Triditional Wind:'%@'", testDegree, [heading headingPoint], [heading headingInEnglish],[heading headingAbbreviation],[heading headingTraditionalWindPoint]);
        degrees = degrees + 0.1;
    }


### TODO:

* Create a cocoapod.

## Contact

Steve Foster [@flightblog](http://twitter.com/flightblog)

## License

The MIT License (MIT)
Copyright © 2013 Steve Foster <foster@flightblog.org>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

