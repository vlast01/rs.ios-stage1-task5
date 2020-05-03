#import "Converter.h"

// Do not change
NSString *KeyPhoneNumber = @"phoneNumber";
NSString *KeyCountry = @"country";

@implementation PNConverter
- (NSDictionary*)converToPhoneNumberNextString:(NSString*)string; {
    NSMutableString *result = [NSMutableString new];
    NSMutableString *tempString = [NSMutableString stringWithString:string];
    NSMutableString *keyCountry = [NSMutableString new];
    int counter = 0;
    
    if ([tempString characterAtIndex:0]=='+'){
        [tempString deleteCharactersInRange:NSMakeRange(0, 1)];
    }
    [result appendString:@"+"];
    
    
    
    if ([tempString characterAtIndex:0]=='7') {
        [result appendString:@"7"];
        [tempString deleteCharactersInRange:NSMakeRange(0, 1)];
        counter++;
        [keyCountry appendString:@"RU"];
        
        while ([tempString length]>0 && counter < 11) {
            if (counter==1) {
                [result appendString:@" ("];
                if ([tempString characterAtIndex:0]=='7') {
                    [keyCountry replaceCharactersInRange:NSMakeRange(0, 2) withString:@"KZ"];
                }
                
            }
            if (counter == 4) {
                [result appendString:@") "];
            }
            if (counter == 7) {
                [result appendString:@"-"];
            }
            if (counter == 9) {
                [result appendString:@"-"];
            }
            [result appendString:[tempString substringWithRange:NSMakeRange(0, 1)]];
            [tempString deleteCharactersInRange:NSMakeRange(0, 1)];
            counter++;
            
            
        }
        return @{KeyPhoneNumber: result,
                 KeyCountry: keyCountry};
        
    }
    
    if ([tempString characterAtIndex:0] == '3') {
        [result appendString:@"3"];
        [tempString deleteCharactersInRange:NSMakeRange(0, 1)];
        counter++;
        while ([tempString length]>0 && counter < 11) {
            
            if (counter == 1 && [tempString characterAtIndex:0]=='7' && [tempString length]>1) {
                if ([tempString characterAtIndex:1] == '5') {
                    [keyCountry appendString:@"BY"];
                    [result appendString:@"75"];
                }
                else if ([tempString characterAtIndex:1] == '3'){
                    [keyCountry appendString:@"MD"];
                    [result appendString:@"73"];
                }
                else if ([tempString characterAtIndex:1] == '4'){
                    [keyCountry appendString:@"AM"];
                    [result appendString:@"74"];
                }
                counter+=2;
                [tempString deleteCharactersInRange:NSMakeRange(0, 2)];
                continue;
                
            }
            else if (counter == 1 && [tempString characterAtIndex:0]=='8' && [tempString length]>1 && [tempString characterAtIndex:1]=='0')
            {
                [keyCountry appendString:@"UA"];
                [result appendString:@"80"];
                counter+=2;
                [tempString deleteCharactersInRange:NSMakeRange(0, 2)];
                continue;
            }
            
            if (counter == 3) {
                [result appendString:@" ("];
            }
            if (counter == 5) {
                [result appendString:@") "];
            }
            if (counter == 8) {
                [result appendString:@"-"];
            }
            if (counter == 10 && ([keyCountry isEqualToString:@"BY"] || [keyCountry isEqualToString:@"UA"])) {
                [result appendString:@"-"];
            }
            
            [result appendString:[tempString substringWithRange:NSMakeRange(0, 1)]];
            [tempString deleteCharactersInRange:NSMakeRange(0, 1)];
            
            counter++;
            if (counter == 11 && ([keyCountry isEqualToString:@"BY"] || [keyCountry isEqualToString:@"UA"]) && [tempString length]>0) {
                [result appendString:[tempString substringWithRange:NSMakeRange(0, 1)]];
            }
        }

        return @{KeyPhoneNumber: result,
                 KeyCountry: keyCountry};
        
    }
    
    
    if ([tempString characterAtIndex:0] == '9') {
        [result appendString:@"9"];
        [tempString deleteCharactersInRange:NSMakeRange(0, 1)];
        counter++;
        while ([tempString length]>0 && counter < 11) {
            
            if (counter == 1 && [tempString characterAtIndex:0]=='9' && [tempString length]>1) {
                if ([tempString characterAtIndex:1] == '2') {
                    [keyCountry appendString:@"TJ"];
                    [result appendString:@"92"];
                }
                else if ([tempString characterAtIndex:1] == '3'){
                    [keyCountry appendString:@"TM"];
                    [result appendString:@"93"];
                }
                else if ([tempString characterAtIndex:1] == '4'){
                    [keyCountry appendString:@"AZ"];
                    [result appendString:@"94"];
                }
                else if ([tempString characterAtIndex:1] == '6'){
                    [keyCountry appendString:@"KG"];
                    [result appendString:@"96"];
                }
                else if ([tempString characterAtIndex:1] == '8'){
                    [keyCountry appendString:@"UZ"];
                    [result appendString:@"98"];
                }
                counter+=2;
                [tempString deleteCharactersInRange:NSMakeRange(0, 2)];
                continue;
                
            }
            if (counter == 3) {
                [result appendString:@" ("];
            }
            if (counter == 5) {
                [result appendString:@") "];
            }
            if (counter == 8) {
                [result appendString:@"-"];
            }
            if (counter == 10 && ![keyCountry isEqualToString:@"TM"]) {
                [result appendString:@"-"];
            }
            
            [result appendString:[tempString substringWithRange:NSMakeRange(0, 1)]];
            [tempString deleteCharactersInRange:NSMakeRange(0, 1)];
            
            counter++;
            if (counter == 11 && ![keyCountry isEqualToString:@"TM"] && [tempString length]>0) {
                [result appendString:[tempString substringWithRange:NSMakeRange(0, 1)]];
            }
        }
        return @{KeyPhoneNumber: result,
                 KeyCountry: keyCountry};
    }
    
    
    while (counter<12 && [tempString length]>0) {
        [result appendString:[tempString substringWithRange:NSMakeRange(0, 1)]];
        [tempString deleteCharactersInRange:NSMakeRange(0, 1)];
        counter++;
    }
    
 
    return @{KeyPhoneNumber: result,
             KeyCountry: keyCountry};
    
}
@end
