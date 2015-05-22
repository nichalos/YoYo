//
//  loginViewController.m
//  YoYo
//
//  Created by Junfeng Bai on 15/2/9.
//  Copyright (c) 2015年 yoyo. All rights reserved.
//

#import "loginViewController.h"
#import "RegViewController.h"
#import "AppDelegate.h"
#import "NetWorkSingleton.h"
#import "SMS_MBProgressHUD+Add.h"
#import "NSString+IsNil.h"

@interface loginViewController ()

{
    UIButton * agentBtn;
    UIButton * actorBtn;
    UIButton * personBtn;
}
@end

@implementation loginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    self.view.backgroundColor = [UIColor whiteColor];
    UIImageView *bg = [[UIImageView alloc] initWithFrame:self.view.bounds];
    bg.image = [UIImage imageNamed:@"登录"];
    bg.contentMode = UIViewContentModeTopLeft;
    bg.userInteractionEnabled = YES;
    bg.backgroundColor = [UIColor clearColor];
    [self.view addSubview:bg];
    
    UITapGestureRecognizer *tapGesture = nil;
    tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideTextField:)];//touch action
    tapGesture.numberOfTapsRequired = 1;
    tapGesture.cancelsTouchesInView = NO;
    tapGesture.delaysTouchesEnded = NO;
    [bg addGestureRecognizer:tapGesture];
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//    button.frame = CGRectMake(12, 450, 390, 60);
//    button.backgroundColor = [UIColor clearColor];
//    button.tag = 1;
//    [button addTarget:self action:@selector(SelectionBtn:) forControlEvents:UIControlEventTouchUpInside];
//    [bg addSubview:button];
//    
//    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
//    button2.frame = CGRectMake(12, 530, 390, 60);
//    button2.backgroundColor = [UIColor clearColor];
//    button2.tag = 2;
//    [button2 addTarget:self action:@selector(SelectionBtn:) forControlEvents:UIControlEventTouchUpInside];
//    [bg addSubview:button2];
    CGFloat statusBarHeight=0;
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 7.0){
        statusBarHeight=20;
    }
    
    UITextField* telField=[[UITextField alloc] init];
    telField.frame=CGRectMake(50, 360, self.view.frame.size.width - 100, 40+statusBarHeight/4);
    telField.borderStyle=UITextBorderStyleRoundedRect;
    telField.delegate = self;
    telField.placeholder= NSLocalizedString(@"telfield", nil);
    telField.keyboardType=UIKeyboardTypeNumbersAndPunctuation;
    telField.clearButtonMode=UITextFieldViewModeWhileEditing;
    self.telField = telField;
    [self.view addSubview:telField];
    
    UITextField* pswField =[[UITextField alloc] init];
    pswField.frame=CGRectMake(50, CGRectGetMaxY(telField.frame)+5, self.view.frame.size.width - 100, 40+statusBarHeight/4);
    pswField.borderStyle=UITextBorderStyleRoundedRect;
    pswField.placeholder= NSLocalizedString(@"password", nil);
    pswField.keyboardType=UIKeyboardTypePhonePad;
    pswField.clearButtonMode=UITextFieldViewModeWhileEditing;
    self.pswField = pswField;
    [self.view addSubview:pswField];
    
    
    UIButton * confirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    NSString * titleStr = NSLocalizedString(@"confirmBtn", nil);
    [confirmBtn setTitle: titleStr forState:UIControlStateNormal];
    [confirmBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    confirmBtn.frame = CGRectMake(CGRectGetMinX(self.pswField.frame), CGRectGetMaxY(self.pswField.frame)+10, self.view.frame.size.width-100, 40+statusBarHeight/4);
    confirmBtn.backgroundColor = [UIColor whiteColor];
    confirmBtn.layer.cornerRadius = 5.0f;
    confirmBtn.tag = 0;
    [confirmBtn addTarget:self action:@selector(SelectionBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:confirmBtn];
    
    
    
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    button3.frame = CGRectMake((self.view.frame.size.width - 100)/2, self.view.frame.size.height - 30, 100, 30);
    button3.tag = 1;
    [button3 setTitle:@"注册" forState:UIControlStateNormal];
    [button3 addTarget:self action:@selector(SelectionBtn:) forControlEvents:UIControlEventTouchUpInside];
    [bg addSubview:button3];
    
}

- (void)SelectionBtn:(UIButton *)button{
    switch (button.tag) {
        case 0:
        {
            [self loginButtonClicked];
        }
            break;
        case 1:
        {
            RegViewController* reg=[[RegViewController alloc] init];
//            [self presentViewController:reg animated:YES completion:^{
//            }];
            [self.navigationController pushViewController:reg animated:YES];
        }
            break;
        default:
            break;
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if(textField == self.telField)
    {
        [_pswField becomeFirstResponder];
    }
    else
    {
        [self loginButtonClicked];
    }
    return NO;
}

- (void)hideTextField:(UIPinchGestureRecognizer *)touch
{
    if ([_telField isFirstResponder]) {
        [_telField resignFirstResponder];
    }
    if ([_pswField isFirstResponder]) {
        [_pswField resignFirstResponder];
    }
}

- (void)loginButtonClicked{
    NSString *message =[NSString isPhoneNum:self.telField.text];
    if (message) {
        [SMS_MBProgressHUD showMessag:message toView:self.view];
    }else{
        [SMS_MBProgressHUD showHUDAddedTo:self.view animated:YES];
        NSString *smsCode = [[NetWorkSingleton sharedNetWork] getSMScodeWithPhone:self.telField.text];
        AppDelegate * appdelegate = [UIApplication sharedApplication].delegate;
        [appdelegate loginSuccess];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)unwindSegue:(UIStoryboardSegue *)sender{
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
