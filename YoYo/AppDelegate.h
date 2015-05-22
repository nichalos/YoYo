//
//  AppDelegate.h
//  YoYo
//
//  Created by Junfeng Bai on 15/2/9.
//  Copyright (c) 2015年 yoyo. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

-(void)loginSuccess;
-(void)logOut;

@end

