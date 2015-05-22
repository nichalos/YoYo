//
//  PersonViewController.m
//  YoYo
//
//  Created by nichalos on 15/4/3.
//  Copyright (c) 2015年 yoyo. All rights reserved.
//

#import "PersonViewController.h"
#import "PanViewController.h"
#import "MoreViewController.h"
#import "PersonSettingViewController.h"
#import "loginViewController.h"
#import "NewViewController.h"
#import "WuxianViewController.h"
@interface PersonViewController (){
    NSArray *group;
}

@end

@implementation PersonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    title.text = @"我";
    bg.frame = CGRectMake(0, 65, self.view.bounds.size.width, self.view.bounds.size.height);
    bg.image = [UIImage imageNamed:@"me"];

    rightBtn.frame = CGRectMake(self.view.frame.size.width-60, 30, 40, 40);
    [rightBtn setImage:[UIImage imageNamed:@"setting"] forState:UIControlStateNormal];
    rightBtn.tag = 0;
    [rightBtn addTarget:self action:@selector(selectView:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 177, self.view.frame.size.width, 50);
    button.backgroundColor = [UIColor clearColor];
    button.tag = 1;
    [button addTarget:self action:@selector(selectView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    button2.frame = CGRectMake(0, 230, self.view.frame.size.width, 53);
    button2.backgroundColor = [UIColor clearColor];
    button2.tag = 2;
    [button2 addTarget:self action:@selector(selectView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    button3.frame = CGRectMake(0, 285, self.view.frame.size.width, 63);
    button3.backgroundColor = [UIColor clearColor];
    button3.tag = 3;
    [button3 addTarget:self action:@selector(selectView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button3];
    
    UIButton *button4 = [UIButton buttonWithType:UIButtonTypeCustom];
    button4.frame = CGRectMake(0, 350, self.view.frame.size.width, 60);
    button4.backgroundColor = [UIColor clearColor];
    button4.tag = 4;
    [button4 addTarget:self action:@selector(selectView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button4];
    
    UIButton *button5 = [UIButton buttonWithType:UIButtonTypeCustom];
    button5.frame = CGRectMake(0, 415, self.view.frame.size.width, 55);
    button5.backgroundColor = [UIColor clearColor];
    button5.tag = 5;
    [button5 addTarget:self action:@selector(selectView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button5];
    
    UIButton *button6 = [UIButton buttonWithType:UIButtonTypeCustom];
    button6.frame = CGRectMake(0, 475, self.view.frame.size.width, 50);
    button6.backgroundColor = [UIColor clearColor];
    button6.tag = 6;
    [button6 addTarget:self action:@selector(selectView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button6];

    UIButton *button8 = [UIButton buttonWithType:UIButtonTypeCustom];
    button8.frame = CGRectMake(0, 525, self.view.frame.size.width, 55);
    button8.backgroundColor = [UIColor clearColor];
    button8.tag = 7;
    [button8 addTarget:self action:@selector(selectView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button8];
    
    UIButton *button9 = [UIButton buttonWithType:UIButtonTypeCustom];
    button9.frame = CGRectMake(self.view.frame.size.width-100, 95, 80, 50);
    button9.backgroundColor = [UIColor clearColor];
    [button9 setTitle:@"退出" forState:UIControlStateNormal];
    [button9 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button9.tag = 8;
//    button9.layer.borderColor = [UIColor colorWithRed:252/255.0f green:91/255.0f blue:84/255.0f alpha:1].CGColor;
//    button9.layer.borderWidth = 2;
//    button9.layer.cornerRadius = 6;
//    button9.layer.masksToBounds = YES;
    [button9 addTarget:self action:@selector(selectView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button9];
    
    UILabel *verson = [[UILabel alloc] initWithFrame:CGRectMake(268, 655, 70, 40)];
    verson.text = @"最新版本";
    verson.font = [UIFont systemFontOfSize:17];
    [self.view addSubview:verson];

    UILabel *versonNum = [[UILabel alloc] initWithFrame:CGRectMake(350, 655, 70, 40)];
    versonNum.text = @"V1.0";
    versonNum.textColor = BASE_COLOR;
    versonNum.font = [UIFont systemFontOfSize:19];
    [self.view addSubview:versonNum];
    
//    BOOL islogin = [[NSUserDefaults standardUserDefaults] boolForKey:@"LOGIN"];
//    if (!islogin) {
//        loginViewController *temp = [[loginViewController alloc] init];
//        [self.navigationController pushViewController:temp animated:NO];
//    }
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}
-(void)selectView:(UIButton *)button{
    NSString *string = @"";
    BOOL issetting = NO;
    switch (button.tag) {
        case 0:
        case 1:
            return;
            break;
        case 2:
        {
            string = @"yoyo鲜颜值";
        }
            break;
        case 3:
        {
            string = @"明星祝福";
           
        }
            break;
        case 4:
        {
            NewViewController *temp = [[NewViewController alloc] init];
            temp.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:temp animated:YES];
            return;
        }
            break;
        case 5:
        {
            PanViewController *temp = [[PanViewController alloc] init];
            temp.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:temp animated:YES];
            return;
        }
            break;
        case 6:
        {
            WuxianViewController *temp = [[WuxianViewController alloc] init];
            temp.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:temp animated:YES];
            
            return;
        }
            break;
        case 7:
            string = @"邀请朋友加入";
            break;
        case 8:
        {
            [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"LOGIN"];
            
//            loginViewController *temp = [[loginViewController alloc] init];
//            [self.navigationController pushViewController:temp animated:YES];
////            [self.view addSubview:temp.view];
            return;
        }
            break;
        case 9:
            string = @"设置";
            issetting = YES;
            break;
        default:
            break;
    }
    MoreViewController *temp = [[MoreViewController alloc] init];
    temp.bgName = string;
    temp.isSetting = issetting;
    temp.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:temp animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
