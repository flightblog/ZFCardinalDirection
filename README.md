# ZFCardinalDirection #

Boxing the Compass - Cardinal and ordinal compass directions derived from compass degrees implemented in 
Objective-C.

### From Wikipedia.org ###
Boxing the compass is the action of naming all thirty-two clockwise points of the compass in order. Such names are 
formed by the initials of the cardinal directions and their intermediate ordinal directions, and are very handy to 
refer to a heading (or course or azimuth) in a general or colloquial fashion, without having to resort to computing 
or recalling degrees. 

http://en.wikipedia.org/wiki/Boxing_the_compass

 #	Compass point       Abbr.	Traditional wind point          Lowest	Middle	Highest
 
 1	North               N       Tramontana                               0.00°	 5.62°
 2	North by east       NbE     Qto Tramontana verso Greco      5.63°	11.25°	16.87°
 3	North-northeast     NNE     Greco-Tramontana                16.88°	22.50°	28.12°
 4	Northeast by north	NEbN	Qto Greco verso Tramontana      28.13°	33.75°	39.37°
 5	Northeast           NE      Greco                           39.38°	45.00°	50.62°
 6	Northeast by east	NEbE	Qto Greco verso Levante         50.63°	56.25°	61.87°
 7	East-northeast      ENE     Greco-Levante                   61.88°	67.50°	73.12°
 8	East by north       EbN     Qto Levante verso Greco         73.13°	78.75°	84.37°
 
 9	East                E       Levante                         84.38°	90.00°	95.62°
 10	East by south       EbS     Qto Levante verso Scirocco      95.63°	101.25°	106.87°
 11	East-southeast      ESE     Levante-Scirocco                106.88°	112.50°	118.12°
 12	Southeast by east	SEbE	Qto Scirocco verso Levante      118.13°	123.75°	129.37°
 13	Southeast           SE      Scirocco                        129.38°	135.00°	140.62°
 14	Southeast by south	SEbS	Qto Scirocco verso Ostro        140.63°	146.25°	151.87°
 15	South-southeast     SSE     Ostro-Scirocco                  151.88°	157.50°	163.12°
 16	South by east       SbE     Qto Ostro verso Scirocco        163.13°	168.75°	174.37°
 
 17	South               S       Ostro                           174.38°	180.00°	185.62°
 18	South by west       SbW     Qto Ostro verso Libeccio        185.63°	191.25°	196.87°
 19	South-southwest     SSW     Ostro-Libeccio                  196.88°	202.50°	208.12°
 20	Southwest by south	SWbS	Qto Libeccio verso Ostro        208.13°	213.75°	219.37°
 21	Southwest           SW      Libeccio                        219.38°	225.00°	230.62°
 22	Southwest by west	SWbW	Qto Libeccio verso Ponente      230.63°	236.25°	241.87°
 23	West-southwest      WSW     Ponente-Libeccio                241.88°	247.50°	253.12°
 24	West by south       WbS     Qto Ponente verso Libeccio      253.13°	258.75°	264.37°
 
 25	West                W       Ponente                         264.38°	270.00°	275.62°
 26	West by north       WbN     Qto Ponente verso Maestro       275.63°	281.25°	286.87°
 27	West-northwest      WNW     Maestro-Ponente                 286.88°	292.50°	298.12°
 28	Northwest by west	NWbW	Qto Maestro verso Ponente       298.13°	303.75°	309.37°
 29	Northwest           NW      Maestro                         309.38°	315.00°	320.62°
 30	Northwest by north	NWbN	Qto Maestro verso Tramontana	320.63°	326.25°	331.87°
 31	North-northwest     NNW     Maestro-Tramontana              331.88°	337.50°	343.12°
 32	North by west       NbW     Qto Tramontana verso Maestro	343.13°	348.75°	354.37°
 
 1	North               N       Tramontana                      354.38°	360.00°

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

