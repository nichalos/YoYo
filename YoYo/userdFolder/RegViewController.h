//
//  RegViewController.h
//  SMS_SDKDemo
//
//  Created by 掌淘科技 on 14-6-4.
//  Copyright (c) 2014年 掌淘科技. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SectionsViewController.h"
#import "UserData.h"

@protocol SecondViewControllerDelegate;

@interface RegViewController : UIViewController
<
UIAlertViewDelegate,
SecondViewControllerDelegate,
UITextFieldDelegate
>

@property(nonatomic,strong) UITableView* tableView;
@property(nonatomic,strong) UITextField* areaCodeField;
@property(nonatomic,strong) UITextField* telField;
@property(nonatomic,strong) UIWindow* window;
@property(nonatomic,strong) UIButton* getCodeBtn;

@property (nonatomic, strong) UITextField * verifyCodeField;
@property (nonatomic, strong) UITextField * pswField;

@property (nonatomic, strong) UILabel * timeLabel;
@property (nonatomic, strong) UIButton * repeatSMSBtn;
@property (nonatomic, strong) NSString * position;
@property (nonatomic, strong) UserData * userData;


-(void)nextStep;

@end
