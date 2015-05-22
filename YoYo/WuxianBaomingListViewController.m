//
//  WuxianBaomingListViewController.m
//  YoYo
//
//  Created by nichalos on 15/4/12.
//  Copyright (c) 2015年 yoyo. All rights reserved.
//

#import "WuxianBaomingListViewController.h"
#import "MoreViewController.h"
@interface WuxianBaomingListViewController ()

@end

@implementation WuxianBaomingListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *view = [[UIView alloc] initWithFrame:self.view.bounds];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, -20, view.frame.size.width, view.frame.size.height)];
    scroll.backgroundColor = [UIColor whiteColor];
    scroll.showsHorizontalScrollIndicator = NO;
    scroll.showsVerticalScrollIndicator = NO;
    [scroll setContentSize:CGSizeMake(0, 834)];
    
    UIImageView *bg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, scroll.frame.size.width, 834)];
    bg.image = [UIImage imageNamed:@"线上报名"];
    bg.contentMode = UIViewContentModeTopLeft;
    bg.userInteractionEnabled = YES;
    bg.backgroundColor = [UIColor clearColor];
    [scroll addSubview:bg];
    [view addSubview:scroll];
    
    
    
    UIImageView *imageBg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 75)];
    imageBg.image = [UIImage imageNamed:@"nav_background"];
    imageBg.userInteractionEnabled = YES;
    [self.view addSubview:imageBg];
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 27, self.view.frame.size.width, 48)];
    title.textColor = [UIColor whiteColor];
    title.font = [UIFont systemFontOfSize:20];
    title.textAlignment = NSTextAlignmentCenter;
    title.text = @"线上报名";
    title.backgroundColor = [UIColor clearColor];
    [imageBg addSubview:title];
    
    UIButton *start = [UIButton buttonWithType:UIButtonTypeCustom];
    start.frame = CGRectMake(10, 24, 45, 45);
    [start setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [start addTarget:self action:@selector(SelectionBtn:) forControlEvents:UIControlEventTouchUpInside];
    start.tag = 0;
    [imageBg addSubview:start];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(self.view.frame.size.width-75, 30, 69, 40);;
    button.backgroundColor = [UIColor clearColor];
    [button setTitle:@"提交" forState:UIControlStateNormal];
    button.tag = 1;
    [button addTarget:self action:@selector(SelectionBtn:) forControlEvents:UIControlEventTouchUpInside];
    [imageBg addSubview:button];
}

- (void)SelectionBtn:(UIButton *)button{
    switch (button.tag) {
        case 0:
            [self.navigationController popViewControllerAnimated:YES];
            break;
        case 1:
        {
            MoreViewController *temp = [[MoreViewController alloc] init];
            temp.bgName = @"线上报名-提交";
            temp.isDone = YES;
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
