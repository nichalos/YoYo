//
//  UserData.h
//  YoYo
//
//  Created by 夏宝梦 on 15/5/19.
//  Copyright (c) 2015年 yoyo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserData : NSObject

@property (nonatomic, strong) NSString * userPhoneNum;
@property (nonatomic, strong) NSString * userPsw;
@property (nonatomic, strong) NSString * userPosition;
@property (nonatomic, strong) NSString * userNickName;
@property (nonatomic, strong) NSString * userPhotoUrl;

//+(UserModel*)sharedUserModel;

+(UserData *)initUserData;


@end
