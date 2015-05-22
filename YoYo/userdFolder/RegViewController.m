//
//  RegViewController.m
//  SMS_SDKDemo
//
//  Created by 掌淘科技 on 14-6-4.
//  Copyright (c) 2014年 掌淘科技. All rights reserved.
//

#import "RegViewController.h"
#import "VerifyViewController.h"
#import "SectionsViewController.h"

#import <SMS_SDK/SMS_SDK.h>
#import <SMS_SDK/CountryAndAreaCode.h>
#import "SMS_MBProgressHUD+Add.h"

#import "BasicInfoViewController.h"



@interface RegViewController ()
{
    CountryAndAreaCode* _data2;
    NSString* _str;
    NSMutableData* _data;
    int _state;
    NSString* _localPhoneNumber;
    
    NSString* _localZoneNumber;
    NSString* _appKey;
    NSString* _duid;
    NSString* _token;
    NSString* _appSecret;
    
    NSMutableArray* _areaArray;
    NSString* _defaultCode;
    NSString* _defaultCountryName;
    
    NSTimer* timer1;
    NSTimer* timer2;
    UIAlertView * alert1;
    
    UIButton * agentBtn;
    UIButton * actorBtn;
    UIButton * personBtn;
    
}

@end

static int count = 0;

@implementation RegViewController 

-(void)clickLeftButton
{
//    [self dismissViewControllerAnimated:YES completion:^{
//        _window.hidden=YES;
//    }];
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    //不允许用户输入 国家码
    if (textField ==_areaCodeField)
    {
        [self.view endEditing:YES];
    }
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    return YES;
}

#pragma mark - SecondViewControllerDelegate的方法
- (void)setSecondData:(CountryAndAreaCode *)data
{
    _data2=data;
    NSLog(@"the area data：%@,%@", data.areaCode,data.countryName);

    self.areaCodeField.text=[NSString stringWithFormat:@"+%@",data.areaCode];
    [self.tableView reloadData];
}

-(void)nextStep
{
    if (self.telField.text.length!=11){
        //手机号码不正确
        UIAlertView* alert=[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"notice", nil)
                                                      message:NSLocalizedString(@"errorphonenumber", nil)
                                                     delegate:self
                                            cancelButtonTitle:NSLocalizedString(@"sure", nil)
                                            otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    [SMS_MBProgressHUD showMessag:NSLocalizedString(@"sendingin", nil) toView:self.view];

    NSString* str=[NSString stringWithFormat:@"%@:%@ %@",NSLocalizedString(@"willsendthecodeto", nil),@"+86",self.telField.text];
    _str=[NSString stringWithFormat:@"%@",self.telField.text];
    UIAlertView* alert=[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"surephonenumber", nil)
                                                  message:str delegate:self
                                        cancelButtonTitle:NSLocalizedString(@"cancel", nil)
                                        otherButtonTitles:NSLocalizedString(@"sure", nil), nil];
    [alert show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (1==buttonIndex){
        NSString * str1 = @"+86";
        NSString* str2=[str1 stringByReplacingOccurrencesOfString:@"+" withString:@""];
        [SMS_SDK getVerificationCodeBySMSWithPhone:self.telField.text
                                              zone:str2
                                            result:^(SMS_SDKError *error)
         {
             if (!error){
                 self.timeLabel.hidden = NO;
                 self.getCodeBtn.hidden = YES;
                 self.repeatSMSBtn.hidden = YES;
                 count =0;
                 
                 NSTimer * timerOne = [NSTimer scheduledTimerWithTimeInterval:60 target:self selector:@selector(showRepeatButton) userInfo:nil repeats:YES];
                 NSTimer * timerTwo = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateTime) userInfo:nil repeats:YES];
                 timer1 = timerOne;
                 timer2 = timerTwo;
             }else{
                 UIAlertView* alert=[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"codesenderrtitle", nil)
                                                               message:[NSString stringWithFormat:@"状态码：%zi ,错误描述：%@",error.errorCode,error.errorDescription]
                                                              delegate:self
                                                     cancelButtonTitle:NSLocalizedString(@"sure", nil)
                                                     otherButtonTitles:nil, nil];
                 [alert show];
             }
         }];
    }
}
-(void)CannotGetSMS{
    NSString* str=[NSString stringWithFormat:@"%@:%@",NSLocalizedString(@"cannotgetsmsmsg", nil) ,self.telField.text];
    UIAlertView* alert=[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"surephonenumber", nil) message:str delegate:self cancelButtonTitle:NSLocalizedString(@"cancel", nil) otherButtonTitles:NSLocalizedString(@"sure", nil), nil];
    alert1 = alert;
    [alert show];
}


-(void)confirmBtnClicked:(UIButton *)sender{
    
    self.userData = [UserData initUserData];
    self.userData.userPhoneNum = self.telField.text;
    self.userData.userPsw = self.pswField.text;
    self.userData.userPosition = self.position;

    
    BasicInfoViewController * basicInvoVC = [[BasicInfoViewController alloc]init];
    basicInvoVC.userModel = self.userData;
    [self.navigationController pushViewController:basicInvoVC animated:YES];
    return;

//    if(self.verifyCodeField.text.length!=4){
//        UIAlertView* alert=[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"notice", nil)
//                                                      message:NSLocalizedString(@"verifycodeformaterror", nil)
//                                                     delegate:self
//                                            cancelButtonTitle:@"确定"
//                                            otherButtonTitles:nil, nil];
//        [alert show];
//    }else{
//        [SMS_SDK commitVerifyCode:self.verifyCodeField.text result:^(enum SMS_ResponseState state) {
//            if(0==state){
//                NSLog(@"验证失败");
//                NSString* str=[NSString stringWithFormat:NSLocalizedString(@"verifycodeerrormsg", nil)];
//                UIAlertView* alert=[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"verifycodeerrortitle", nil)
//                                                              message:str
//                                                             delegate:self
//                                                    cancelButtonTitle:NSLocalizedString(@"sure", nil)
//                                                    otherButtonTitles:nil, nil];
//                [alert show];
//            }else{
//                BasicInfoViewController * basicInvoVC = [[BasicInfoViewController alloc]init];
//                [self presentViewController:basicInvoVC animated:YES completion:nil];
//            }
//        }];
//    }
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGFloat statusBarHeight=0;
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 7.0){
        statusBarHeight=20;
    }
    
    self.view.backgroundColor = [UIColor colorWithRed:252/255.0f green:91/255.0f blue:84/255.0 alpha:1.0f];
    
    UIButton *start = [UIButton buttonWithType:UIButtonTypeCustom];
    start.frame = CGRectMake(10, 30, 40, 40);
    [start setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [start addTarget:self action:@selector(clickLeftButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:start];
    
    
    UILabel * info1Label = [[UILabel alloc] init];
    info1Label.frame = CGRectMake(0, 44+statusBarHeight +10, self.view.frame.size.width, 50);
    info1Label.text = @"星·光·无·限";
    info1Label.textAlignment = NSTextAlignmentCenter;
    info1Label.textColor = [UIColor whiteColor];
    info1Label.font = [UIFont systemFontOfSize:35];
    [self.view addSubview:info1Label];
    
    UILabel * info2Label = [[UILabel alloc] init];
    info2Label.frame = CGRectMake(0, CGRectGetMaxY(info1Label.frame), self.view.frame.size.width, 50);
    info2Label.text = @"人人都能当演员，潜力无限、星光无限。";
    info2Label.textAlignment = NSTextAlignmentCenter;
    info2Label.textColor = [UIColor whiteColor];
    info2Label.font = [UIFont systemFontOfSize:19];
    [self.view addSubview:info2Label];
    //
    UITextField* telField=[[UITextField alloc] init];
    telField.frame=CGRectMake(10, CGRectGetMaxY(info2Label.frame)+10,self.view.frame.size.width - 20, 40+statusBarHeight/4);
    telField.borderStyle=UITextBorderStyleRoundedRect;
    telField.placeholder= NSLocalizedString(@"telfield", nil);
//    telField.placeholder = @"请输入手机号码";
    telField.keyboardType=UIKeyboardTypePhonePad;
    telField.clearButtonMode=UITextFieldViewModeWhileEditing;
    _telField = telField;
    [self.view addSubview:telField];
    
    self.verifyCodeField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMinX(telField.frame), CGRectGetMaxY(telField.frame)+5, CGRectGetWidth(telField.frame)- 110, CGRectGetHeight(telField.frame))];
    self.verifyCodeField.placeholder = @"请输入验证码";
    self.verifyCodeField.borderStyle = UITextBorderStyleRoundedRect;
    self.verifyCodeField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.view addSubview:self.verifyCodeField];
    
    //
    self.getCodeBtn=[UIButton buttonWithType:UIButtonTypeSystem];
//    [nextBtn setTitle:NSLocalizedString(@"nextbtn", nil) forState:UIControlStateNormal];
    [self.getCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    NSString *icon = [NSString stringWithFormat:@"smssdk.bundle/button4.png"];
    [self.getCodeBtn setBackgroundImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    self.getCodeBtn.frame=CGRectMake(CGRectGetMaxX(self.verifyCodeField.frame) +10, CGRectGetMinY(self.verifyCodeField.frame), 100, CGRectGetHeight(self.verifyCodeField.frame));
    [self.getCodeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.getCodeBtn addTarget:self action:@selector(nextStep) forControlEvents:UIControlEventTouchUpInside];
    self.getCodeBtn.backgroundColor = [UIColor greenColor];
    self.getCodeBtn.layer.cornerRadius = 5.0f;
    [self.view addSubview:self.getCodeBtn];
    
    self.timeLabel=[[UILabel alloc] init];
    _timeLabel.frame=CGRectMake(CGRectGetMaxX(self.verifyCodeField.frame) +10, CGRectGetMinY(self.verifyCodeField.frame), 100, CGRectGetHeight(self.verifyCodeField.frame));
    _timeLabel.numberOfLines = 0;
    _timeLabel.textAlignment = NSTextAlignmentCenter;
    _timeLabel.font = [UIFont fontWithName:@"Helvetica" size:15];
    _timeLabel.text=NSLocalizedString(@"timelabel", nil);
    _timeLabel.backgroundColor = [UIColor orangeColor];
    _timeLabel.layer.cornerRadius = 5.0f;
    [self.view addSubview:_timeLabel];
    
    self.repeatSMSBtn=[UIButton buttonWithType:UIButtonTypeSystem];
    _repeatSMSBtn.frame=CGRectMake(CGRectGetMaxX(self.verifyCodeField.frame) +10, CGRectGetMinY(self.verifyCodeField.frame), 100, CGRectGetHeight(self.verifyCodeField.frame) );
    [_repeatSMSBtn setTitle:NSLocalizedString(@"repeatsms", nil) forState:UIControlStateNormal];
    [_repeatSMSBtn addTarget:self action:@selector(CannotGetSMS) forControlEvents:UIControlEventTouchUpInside];
    _repeatSMSBtn.backgroundColor = [UIColor greenColor];
    _repeatSMSBtn.layer.cornerRadius = 5.0f;
    _repeatSMSBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:_repeatSMSBtn];
    
    
    self.pswField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.verifyCodeField.frame), CGRectGetMaxY(self.verifyCodeField.frame)+5, self.view.frame.size.width-20, CGRectGetHeight(self.verifyCodeField.frame))];
    self.pswField.placeholder = @"请输入密码";
    self.pswField.borderStyle = UITextBorderStyleRoundedRect;
    self.pswField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.view addSubview:self.pswField];
    
    agentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    agentBtn.frame = CGRectMake(CGRectGetMinX(self.pswField.frame)+15, CGRectGetMaxY(self.pswField.frame)+20, 26, 26);
    agentBtn.layer.cornerRadius = 13.0f;
    [agentBtn setBackgroundColor:[UIColor whiteColor]];
    agentBtn.tag = 9010;
    [agentBtn addTarget:self action:@selector(positionBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:agentBtn];
    
    UILabel * agentLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(agentBtn.frame)+5, CGRectGetMinY(agentBtn.frame), 80, 25)];
    agentLabel.text = @"经纪人";
    agentLabel.textColor = [UIColor whiteColor];
    agentLabel.font = [UIFont systemFontOfSize:23];
    agentLabel.textAlignment = NSTextAlignmentCenter;
//    agentLabel.backgroundColor = [UIColor redColor];
    [self.view addSubview:agentLabel];
    
    actorBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    actorBtn.frame = CGRectMake(CGRectGetMaxX(agentLabel.frame)+5, CGRectGetMinY(agentLabel.frame), 26, 26);
    actorBtn.layer.cornerRadius = 13.0f;
    [actorBtn setBackgroundColor:[UIColor whiteColor]];
    actorBtn.tag = 9011;
    [actorBtn addTarget:self action:@selector(positionBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:actorBtn];
    
    UILabel * actorLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(actorBtn.frame)+5, CGRectGetMinY(actorBtn.frame), 55, 25)];
    actorLabel.text = @"演员";
    actorLabel.textColor = [UIColor whiteColor];
    actorLabel.font = [UIFont systemFontOfSize:23];
    actorLabel.textAlignment = NSTextAlignmentCenter;
//    actorLabel.backgroundColor = [UIColor redColor];
    [self.view addSubview:actorLabel];
    
    personBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    personBtn.frame = CGRectMake(CGRectGetMaxX(actorLabel.frame)+5, CGRectGetMinY(actorLabel.frame), 26, 26);
    personBtn.layer.cornerRadius = 13.0f;
    [personBtn setBackgroundColor:[UIColor whiteColor]];
    personBtn.tag = 9012;
    [personBtn addTarget:self action:@selector(positionBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:personBtn];
    
    UILabel * personLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(personBtn.frame)+5, CGRectGetMinY(personBtn.frame), 95, 25)];
    personLabel.text = @"个人用户";
    personLabel.textColor = [UIColor whiteColor];
    personLabel.font = [UIFont systemFontOfSize:23];
    personLabel.textAlignment = NSTextAlignmentCenter;
//    personLabel.backgroundColor = [UIColor redColor];
    [self.view addSubview:personLabel];
    
    UIButton * confirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    NSString * titleStr = NSLocalizedString(@"confirmBtn", nil);
    [confirmBtn setTitle: titleStr forState:UIControlStateNormal];
    [confirmBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    confirmBtn.frame = CGRectMake(CGRectGetMinX(self.verifyCodeField.frame), CGRectGetMaxY(agentBtn.frame)+25, self.view.frame.size.width-20, 40+statusBarHeight/4);
    confirmBtn.backgroundColor = [UIColor whiteColor];
    confirmBtn.layer.cornerRadius = 5.0f;
    [confirmBtn addTarget:self action:@selector(confirmBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:confirmBtn];
    
    self.telField.delegate=self;
    self.verifyCodeField.delegate = self;
    
    self.repeatSMSBtn.hidden = YES;
    self.timeLabel.hidden = YES;
    [timer2 invalidate];
    [timer1 invalidate];
    count = 0;
}
-(void)setBtnStateWithBtn:(UIButton *)btn{
    [btn setSelected:NO];
    [btn setBackgroundColor:[UIColor whiteColor]];
}
-(void)positionBtnClicked:(UIButton *)sender{
    int tag = (int)sender.tag;
    switch (tag) {
        case 9010:
        {
            [sender setSelected:!sender.isSelected];
            [self setBtnStateWithBtn:actorBtn];
            [self setBtnStateWithBtn:personBtn];
            
            if (sender.isSelected) {
                self.position = @"经纪人";
                NSLog(@"%@",self.position);
                [sender setBackgroundColor:[UIColor greenColor]];
            }else{
                [sender setBackgroundColor:[UIColor whiteColor]];
            }
        }
            break;
        case 9011:
        {
            [sender setSelected:YES];
            self.position = @"演员";
            [self setBtnStateWithBtn:agentBtn];
            [self setBtnStateWithBtn:personBtn];
            [sender setBackgroundColor:[UIColor greenColor]];
        }
            break;
        case 9012:
        {
            [sender setSelected:YES];
            self.position = @"个人用户";
            [self setBtnStateWithBtn:actorBtn];
            [self setBtnStateWithBtn:agentBtn];
            [sender setBackgroundColor:[UIColor greenColor]];
        }
            break;
            
        default:
            break;
    }
}
-(void)updateTime{
    self.timeLabel.hidden = NO;
    self.getCodeBtn.hidden = YES;
    count++;
    if (count>=60) {
        count =0;
        self.timeLabel.text = @"";
        self.timeLabel.hidden = YES;
        self.repeatSMSBtn.hidden = NO;
        [timer2 invalidate];
        return;
    }
    self.timeLabel.text = [NSString stringWithFormat:@"%@%i%@",NSLocalizedString(@"timelablemsg", nil), 60-count, NSLocalizedString(@"second", nil)];
}
-(void)showRepeatButton{
    self.timeLabel.hidden=YES;
    self.repeatSMSBtn.hidden=NO;
    [timer1 invalidate];
    return;
}


@end
