//
//  WuxianYinShiBaominViewController.m
//  YoYo
//
//  Created by nichalos on 15/4/12.
//  Copyright (c) 2015年 yoyo. All rights reserved.
//

#import "WuxianYinShiBaominViewController.h"
#import "WuxianBaomingListViewController.h"

@interface WuxianYinShiBaominViewController ()

@end

@implementation WuxianYinShiBaominViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(20, 110, 370, 40);
    button.backgroundColor = [UIColor clearColor];
    button.tag = 1;
    [button addTarget:self action:@selector(SelectionBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)SelectionBtn:(UIButton *)button{
    switch (button.tag) {
        case 0:
            [self.navigationController popViewControllerAnimated:YES];
            break;
        case 1:
        {
            WuxianBaomingListViewController *temp = [[WuxianBaomingListViewController alloc] init];
            [self.navigationController pushViewController:temp animated:YES];
        }
            break;
        default:
            break;
    }
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
