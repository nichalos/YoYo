//
//  UserData.m
//  YoYo
//
//  Created by 夏宝梦 on 15/5/19.
//  Copyright (c) 2015年 yoyo. All rights reserved.
//

#import "UserData.h"

@implementation UserData


@synthesize userPhoneNum;
@synthesize userPosition;
@synthesize userPsw;
@synthesize userNickName;
@synthesize userPhotoUrl;


+(UserData *)initUserData{
    UserData * userData = [[UserData alloc] init];
    return userData;
}


@end
