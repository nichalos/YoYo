//
//  MoreViewController.m
//  YoYo
//
//  Created by nichalos on 15/4/3.
//  Copyright (c) 2015年 yoyo. All rights reserved.
//

#import "MoreViewController.h"

@interface MoreViewController ()

@end

@implementation MoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIImageView *bg = [[UIImageView alloc] initWithFrame:self.view.bounds];
    bg.image = [UIImage imageNamed:_bgName];
    bg.contentMode = UIViewContentModeTopLeft;
    bg.backgroundColor = [UIColor clearColor];
    [self.view addSubview:bg];
    
    UIButton *start = [UIButton buttonWithType:UIButtonTypeCustom];
    start.frame = CGRectMake(10, 24, 45, 45);
    [start setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [start addTarget:self action:@selector(SelectionBtn:) forControlEvents:UIControlEventTouchUpInside];
    start.tag = 0;
    [self.view addSubview:start];
    if (_isDone) {
        UIButton *done = [UIButton buttonWithType:UIButtonTypeCustom];
        done.frame = CGRectMake(self.view.bounds.size.width-55, 24, 45, 45);
        [done setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        [done addTarget:self action:@selector(SelectionDoneBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:done];
    }
    if (_isSetting) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0, 107, self.view.frame.size.width, 45);
        button.backgroundColor = [UIColor clearColor];
        button.tag = 1;
        [button addTarget:self action:@selector(selectView:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        
        UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
        button2.frame = CGRectMake(0, 155, self.view.frame.size.width, 45);
        button2.backgroundColor = [UIColor clearColor];
        button2.tag = 2;
        [button2 addTarget:self action:@selector(selectView:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button2];
        
        UIButton *button3 = [UIButton buttonWithType:UIButtonTypeCustom];
        button3.frame = CGRectMake(0, 245, self.view.frame.size.width, 50);
        button3.backgroundColor = [UIColor clearColor];
        button3.tag = 3;
        [button3 addTarget:self action:@selector(selectView:) forControlEvents:UIControlEventTouchUpInside];
//        [self.view addSubview:button3];
        
        UIButton *button4 = [UIButton buttonWithType:UIButtonTypeCustom];
        button4.frame = CGRectMake(20, 630, self.view.frame.size.width-40, 60);
        button4.backgroundColor = [UIColor clearColor];
        button4.tag = 4;
        [button4 addTarget:self action:@selector(selectView:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button4];
    }
}

- (void)SelectionBtn:(UIButton *)button{
    switch (button.tag) {
        case 0:
            [self.navigationController popViewControllerAnimated:YES];
            break;
            
        default:
            break;
    }
}
- (void)selectView:(UIButton *)button{
    NSString *name = @"";
    switch (button.tag) {
        case 1:
            name = @"关于星光优友";
            break;
        case 2:
            name = @"商业合作";
            break;
        case 3:
            
            break;
        case 4:
        {
            [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"LOGIN"];
            [self.navigationController popViewControllerAnimated:YES];
            return;
        }
            break;
        default:
            break;
    }
    MoreViewController *temp = [[MoreViewController alloc] init];
    temp.bgName = name;
    [self.navigationController pushViewController:temp animated:YES];
}

- (void)SelectionDoneBtn:(UIButton *)button{
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:2] animated:YES];
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
