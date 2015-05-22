//
//  NSString+IsNil.m
//  AAES
//
//  Created by 夏宝梦 on 15/4/20.
//  Copyright (c) 2015年 artron. All rights reserved.
//

#import "NSString+IsNil.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (IsNil)

-(NSString *)isNull
{
    if (self ==nil || [self isKindOfClass:[NSNull class]] || [self isEqualToString:@"<nil>"])
    {
        return @"";
    }else{
        return self;
    }
}


-(NSString *)isPhoneNum{
    NSString * msg = nil;
    if (self.length < 11){
        msg = @"手机号码长度不是11位，请重新输入";
    }else{
        /**
         * 移动号段正则表达式
         */
        NSString *CM_NUM = @"^((13[4-9])|(147)|(15[0-2,7-9])|(178)|(18[2-4,7-8]))\\d{8}|(1705)\\d{7}$";
        /**
         * 联通号段正则表达式
         */
        NSString *CU_NUM = @"^((13[0-2])|(145)|(15[5-6])|(176)|(18[5,6]))\\d{8}|(1709)\\d{7}$";
        /**
         * 电信号段正则表达式
         */
        NSString *CT_NUM = @"^((133)|(153)|(177)|(18[0,1,9]))\\d{8}$";
        NSPredicate *pred1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM_NUM];
        BOOL isMatch1 = [pred1 evaluateWithObject:self];
        NSPredicate *pred2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU_NUM];
        BOOL isMatch2 = [pred2 evaluateWithObject:self];
        NSPredicate *pred3 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT_NUM];
        BOOL isMatch3 = [pred3 evaluateWithObject:self];
        if (isMatch1 || isMatch2 || isMatch3) {
            msg = nil;
        }else{
            msg = @"请输入正确的电话号码";
        }
    }
    return msg;

}

- (NSString *) stringFromMD5{
    
    if(self == nil || [self length] == 0)
        return nil;
    
    const char *value = [self UTF8String];
    
    unsigned char outputBuffer[CC_MD5_DIGEST_LENGTH];
    CC_MD5(value, (CC_LONG)strlen(value), outputBuffer);
    
    NSMutableString *outputString = [[NSMutableString alloc] initWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(NSInteger count = 0; count < CC_MD5_DIGEST_LENGTH; count++){
        [outputString appendFormat:@"%02x",outputBuffer[count]];
    }
    
    return outputString;
}

@end
