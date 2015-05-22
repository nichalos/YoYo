//
//  NetWorkSingleton.h
//  AAES
//
//  Created by 夏宝梦 on 15/3/2.
//  Copyright (c) 2015年 artron. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Reachability.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "JSON.h"


@interface NetWorkSingleton : NSObject

@property (nonatomic, strong, readonly) NSString *defoSN;

+ (NetWorkSingleton *)sharedNetWork;

//判断网络情况
- (BOOL) isNetworkConnection;

//获取手机验证码
- (NSString *)getSMScodeWithPhone:(NSString *)phoneNum;

//注册接口
-(NSDictionary *)registWith:(NSDictionary *)params;

//登录接口
-(NSDictionary *)loginWith:(NSDictionary *)params;

-(NSString*)deviceString;

//获取经纪人首页数据
-(NSDictionary *)getAgentDataWith:(NSDictionary *)params;







@end













