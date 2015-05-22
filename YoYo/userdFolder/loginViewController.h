//
//  loginViewController.h
//  YoYo
//
//  Created by Junfeng Bai on 15/2/9.
//  Copyright (c) 2015年 yoyo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface loginViewController : UIViewController<UITextFieldDelegate>

@property (nonatomic, strong) UITextField * telField;

@property (nonatomic, strong) UITextField * pswField;

@end
