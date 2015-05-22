//
//  WuxianPaimaiViewController.m
//  YoYo
//
//  Created by nichalos on 15/4/12.
//  Copyright (c) 2015年 yoyo. All rights reserved.
//

#import "WuxianPaimaiViewController.h"
#import "WuxianPaimaiGuiViewController.h"
@interface WuxianPaimaiViewController ()

@end

@implementation WuxianPaimaiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *view = [[UIView alloc] initWithFrame:self.view.bounds];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 55, view.frame.size.width, view.frame.size.height)];
    scroll.backgroundColor = [UIColor whiteColor];
    scroll.showsHorizontalScrollIndicator = NO;
    scroll.showsVerticalScrollIndicator = NO;
    [scroll setContentSize:CGSizeMake(0, 723)];
    
    UIImageView *bg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, scroll.frame.size.width, 703)];
    bg.image = [UIImage imageNamed:@"星光无限q_星拍卖-拍品页"];
    bg.contentMode = UIViewContentModeTopLeft;
    bg.userInteractionEnabled = YES;
    bg.backgroundColor = [UIColor clearColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(296, 140-75, 60, 25);
    button.backgroundColor = [UIColor clearColor];
    button.tag = 1;
    [button addTarget:self action:@selector(SelectionBtn:) forControlEvents:UIControlEventTouchUpInside];
    [bg addSubview:button];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    button2.frame = CGRectMake(296, 272-75, 60, 25);
    button2.backgroundColor = [UIColor clearColor];
    button2.tag = 2;
    [button2 addTarget:self action:@selector(SelectionBtn:) forControlEvents:UIControlEventTouchUpInside];
    [bg addSubview:button2];
    
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    button3.frame = CGRectMake(296, 400-75, 60, 25);
    button3.backgroundColor = [UIColor clearColor];
    button3.tag = 3;
    [button3 addTarget:self action:@selector(SelectionBtn:) forControlEvents:UIControlEventTouchUpInside];
    [bg addSubview:button3];
    
    UIButton *button4 = [UIButton buttonWithType:UIButtonTypeCustom];
    button4.frame = CGRectMake(296, 528-75, 60, 25);
    button4.backgroundColor = [UIColor clearColor];
    button4.tag = 4;
    [button4 addTarget:self action:@selector(SelectionBtn:) forControlEvents:UIControlEventTouchUpInside];
    [bg addSubview:button4];
    
    UIButton *button5 = [UIButton buttonWithType:UIButtonTypeCustom];
    button5.frame = CGRectMake(296, 650-75, 60, 25);
    button5.backgroundColor = [UIColor clearColor];
    button5.tag = 5;
    [button5 addTarget:self action:@selector(SelectionBtn:) forControlEvents:UIControlEventTouchUpInside];
    [bg addSubview:button5];
    
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
    title.text = @"星拍卖";
    title.backgroundColor = [UIColor clearColor];
    [imageBg addSubview:title];
    
    UIButton *start = [UIButton buttonWithType:UIButtonTypeCustom];
    start.frame = CGRectMake(10, 24, 45, 45);
    [start setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [start addTarget:self action:@selector(SelectionBtn:) forControlEvents:UIControlEventTouchUpInside];
    start.tag = 0;
    [imageBg addSubview:start];

}

- (void)SelectionBtn:(UIButton *)button{
    switch (button.tag) {
        case 0:
            [self.navigationController popViewControllerAnimated:YES];
            break;
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
        {
            WuxianPaimaiGuiViewController *temp = [[WuxianPaimaiGuiViewController alloc] init];
            temp.bgName = @"星光无限q_星拍卖-规则";
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
