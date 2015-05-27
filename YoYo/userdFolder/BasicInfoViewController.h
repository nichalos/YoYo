//
//  BasicInfoViewController.h
//  YoYo
//
//  Created by 夏宝梦 on 15/5/18.
//  Copyright (c) 2015年 yoyo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserData.h"

@interface BasicInfoViewController : UIViewController


@property (nonatomic, strong) UITextField * nicknameField;
@property (nonatomic, strong) UIButton * photoBtn;

@property (nonatomic, strong) UserData * userModel;

@end
