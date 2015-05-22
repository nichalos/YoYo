//
//  NetWorkSingleton.m
//  AAES
//
//  Created by 夏宝梦 on 15/3/2.
//  Copyright (c) 2015年 artron. All rights reserved.
//

#import "NetWorkSingleton.h"
#import "NSString+IsNil.h"
#define BASEURL @"http://123.57.11.207:8080/api/"
#define LOGIN_URL @"userinterface/login"
#define REGIST_URL @"userinterface/userRegister"
#define GETUSERID_URL @"userinterface/queryId"


#define GetAGENT_URL @""


//网络请求超时等待时间
#define kTimeOutSeconds 180
#import <sys/utsname.h>



static NetWorkSingleton *network;


@implementation NetWorkSingleton

//共享单例
+ (NetWorkSingleton *)sharedNetWork{
    if (network == nil) {
        network = [[NetWorkSingleton alloc] init];
    }
    return network;
}


//判断设备型号
- (NSString*)deviceString
{
    // 需要#import "sys/utsname.h"
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    NSUserDefaults * userDefault = [NSUserDefaults standardUserDefaults];
    
    if ([deviceString isEqualToString:@"iPhone1,1"])    {
        [userDefault setObject:@"iPhone 1G" forKey:@"iphoneX"];
        [userDefault synchronize];}
    if ([deviceString isEqualToString:@"iPhone1,2"])    {
        [userDefault setObject:@"iPhone 3G" forKey:@"iphoneX"];
        [userDefault synchronize];}
    if ([deviceString isEqualToString:@"iPhone2,1"])    {
        [userDefault setObject:@"iPhone 3GS" forKey:@"iphoneX"];
        [userDefault synchronize];}
    if ([deviceString isEqualToString:@"iPhone3,1"])    {
        [userDefault setObject:@"iPhone 4" forKey:@"iphoneX"];
        [userDefault synchronize];}
    if ([deviceString isEqualToString:@"iPhone4,1"])    {
        [userDefault setObject:@"iPhone 4" forKey:@"iphoneX"];
        [userDefault synchronize];}
    if ([deviceString isEqualToString:@"iPhone5,1"])    {
        [userDefault setObject:@"iPhone 5" forKey:@"iphoneX"];
        [userDefault synchronize];}
    if ([deviceString isEqualToString:@"iPhone5,2"])    {
        [userDefault setObject:@"iPhone 5" forKey:@"iphoneX"];
        [userDefault synchronize];}
    if ([deviceString isEqualToString:@"iPhone5,3"])    {
        [userDefault setObject:@"iPhone 5" forKey:@"iphoneX"];
        [userDefault synchronize];}
    if ([deviceString isEqualToString:@"iPhone5,4"])    {
        [userDefault setObject:@"iPhone 5" forKey:@"iphoneX"];
        [userDefault synchronize];}
    if ([deviceString isEqualToString:@"iPhone6,1"])    {
        [userDefault setObject:@"iPhone 5" forKey:@"iphoneX"];
        [userDefault synchronize];}
    if ([deviceString isEqualToString:@"iPhone6,2"])    {
        [userDefault setObject:@"iPhone 5" forKey:@"iphoneX"];
        [userDefault synchronize];}
    if ([deviceString isEqualToString:@"iPhone7,1"])    {
        [userDefault setObject:@"iPhone 6" forKey:@"iphoneX"];
        [userDefault synchronize];}
    if ([deviceString isEqualToString:@"iPhone7,2"])    {
        [userDefault setObject:@"iPhone 6" forKey:@"iphoneX"];
        [userDefault synchronize];}
//    if ([deviceString isEqualToString:@"iPhone3,2"])    return @"Verizon iPhone 4";
//    if ([deviceString isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
//    if ([deviceString isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
//    if ([deviceString isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
//    if ([deviceString isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
//    if ([deviceString isEqualToString:@"iPad1,1"])      return @"iPad";
//    if ([deviceString isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
//    if ([deviceString isEqualToString:@"iPad2,2"])      return @"iPad 2 (GSM)";
//    if ([deviceString isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
//    if ([deviceString isEqualToString:@"i386"])         return @"Simulator";
    if ([deviceString isEqualToString:@"x86_64"])       {
        [userDefault setObject:@"x86_64" forKey:@"iphoneX"];
        [userDefault synchronize];
    }
    return deviceString;
}

//判断网络连接情况
- (BOOL)isNetworkConnection{
    return ([[Reachability reachabilityForLocalWiFi] currentReachabilityStatus] != NotReachable) || ([[Reachability reachabilityForInternetConnection] currentReachabilityStatus] != NotReachable);
}

//无网络情况提示
- (void)noConnectionAlertView{
    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"温馨提示"
                                                        message:@"亲，你的网络不给力啊！"
                                                       delegate:nil
                                              cancelButtonTitle:@"知道了" otherButtonTitles:nil];
        [alert show];
    });
}
#pragma mark 同步请求
- (NSString *)sendSynchronous:(NSString*)url andTimeOut:(NSInteger)seconds
{
    if (self.isNetworkConnection){
        url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:url]];
        request.defaultResponseEncoding = NSUTF8StringEncoding;
        request.timeOutSeconds = seconds;
        [request startSynchronous];//startAsynchronous
        NSError *error = [request error];
        if (error){
            return nil;
        }else{
            return [request responseString];
        }
    }else{
        [self noConnectionAlertView];
        return nil;
    };
}
#pragma mark POST请求
- (NSDictionary *)sendSynchronous:(NSString *)url params:(NSDictionary*)params
{
    if (self.isNetworkConnection)
    {
        url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        ASIFormDataRequest *requset = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:url]];
        [requset setRequestMethod:@"POST"];
        [requset setTimeOutSeconds:kTimeOutSeconds];
        for (NSString* key in params.allKeys){
            NSString* value = [params objectForKey:key];
            [requset addPostValue:value forKey:key];
        }
        requset.defaultResponseEncoding = NSUTF8StringEncoding;
        [requset startSynchronous];
        if (requset.responseString){
            NSDictionary * dictionary = [requset.responseString JSONValue];
            return dictionary;
        }else{
            return nil;
        }
    }else{
        [self noConnectionAlertView];
        return nil;
    }
}

- (NSString *)getSMScodeWithPhone:(NSString *)phoneNum{
    NSString *returnStr = @"获取失败";
    NSString *sn = [self getBaseParame];
    NSString *url =[NSString stringWithFormat:@"%@mb/captcha",BASEURL];
    NSDictionary * retDic = [NSDictionary dictionary];
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:phoneNum forKey:@"mobileNo"];
    [params setObject:sn forKey:@"sn"];
    retDic = [self sendSynchronous:url params:params];
    if (retDic) {
        int status =  [[retDic objectForKey:@"status"] intValue];
        if (status == 600) {
            //重新获取
        }else if(status == 200){
            //成功
            returnStr = nil;
        }
    }
    return returnStr;
}


- (NSString *)getBaseParame{
    NSString *sn ;//= [[NSUserDefaults standardUserDefaults] objectForKey:@"DEFO_SN"];
    if (!sn) {
        NSString *tp = @"123123123";
        NSString *url = [NSString stringWithFormat:@"%@sn?tp=%@",BASEURL,tp];
        NSString *dataStr = [self sendSynchronous:url andTimeOut:6000];
        NSDictionary *data = [dataStr JSONValue];
        int code = [[data objectForKey:@"status"] intValue];
        if (code == 200) {
            NSString *snStr = [[data objectForKey:@"data"] isNull];
            NSString *a = [NSString stringWithFormat:@"%@%@",snStr,[tp substringWithRange:NSMakeRange(2, 4)]];
            sn = [a stringFromMD5];
            [[NSUserDefaults standardUserDefaults] setObject:sn forKey:@"DEFO_SN"];
        }
    }
    return sn;
}
/*
 *  @author xbm
 *  @time   2015-03-30
 *  @method 注册接口
 *  @return
 */
-(NSDictionary *)registWith:(NSDictionary *)params{
    NSString *url =[NSString stringWithFormat:@"%@%@",BASEURL,REGIST_URL];
    NSDictionary * retDic = [NSDictionary dictionary];
    retDic = [self sendSynchronous:url params:params];
    if (retDic) {
        return retDic;
    }
    return nil;
}
/*
 *  @author xbm
 *  @time   2015-03-28
 *  @method 登录接口
 *  @return
 */
-(NSDictionary *)loginWith:(NSDictionary *)params{
    NSString *url =[NSString stringWithFormat:@"%@%@",BASEURL,LOGIN_URL];
    NSDictionary * retDic = [NSDictionary dictionary];
    retDic = [self sendSynchronous:url params:params];
    if (retDic) {
        return retDic;
    }
    return nil;
}
/*
 *  @author xbm
 *  @time   2015-05-20
 *  @method 获取经纪人首页数据
 *  @return
 */
-(NSDictionary *)getAgentDataWith:(NSDictionary *)params{
    NSString *url =[NSString stringWithFormat:@"%@%@",BASEURL,GetAGENT_URL];
    NSDictionary * retDic = [NSDictionary dictionary];
    retDic = [self sendSynchronous:url params:params];
    if (retDic) {
        return retDic;
    }
    return nil;
}



@end







