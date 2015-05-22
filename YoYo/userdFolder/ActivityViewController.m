//
//  ActivityViewController.m
//  YoYo
//
//  Created by Junfeng Bai on 15/2/9.
//  Copyright (c) 2015年 yoyo. All rights reserved.
//

#import "ActivityViewController.h"
#import "PushPhotoViewController.h"
#import "loginViewController.h"
#import "WuxianYinShiViewController.h"

@interface ActivityViewController ()

@end

@implementation ActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    title.text = @"热点动态";
    rightBtn.frame = CGRectMake(self.view.frame.size.width-60, 30, 40, 40);
    [rightBtn setImage:[UIImage imageNamed:@"fb"] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(selectView:) forControlEvents:UIControlEventTouchUpInside];
    
    UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 55, bg.frame.size.width, bg.frame.size.height-55)];
    scroll.backgroundColor = [UIColor clearColor];
    scroll.showsHorizontalScrollIndicator = NO;
    scroll.showsVerticalScrollIndicator = NO;
    [scroll setContentSize:CGSizeMake(0, 1689)];
    
    UIImageView *bgImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, scroll.frame.size.width, 1689)];
    bgImage.image = [UIImage imageNamed:@"热点动态"];
    bgImage.contentMode = UIViewContentModeTopLeft;
    bgImage.userInteractionEnabled = YES;
    bgImage.backgroundColor = [UIColor clearColor];
    [scroll addSubview:bgImage];
    [bg addSubview:scroll];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(70, 300, 40, 40);
    button.backgroundColor = [UIColor clearColor];
    button.tag = 1;
    [button addTarget:self action:@selector(selectView:) forControlEvents:UIControlEventTouchUpInside];
    [bgImage addSubview:button];

    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    button2.frame = CGRectMake(70, 540, 40, 40);
    button2.backgroundColor = [UIColor clearColor];
    button2.tag = 2;
    [button2 addTarget:self action:@selector(selectView:) forControlEvents:UIControlEventTouchUpInside];
    [bgImage addSubview:button2];

    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    button3.frame = CGRectMake(70, 890, 40, 40);
    button3.backgroundColor = [UIColor clearColor];
    button3.tag = 3;
    [button3 addTarget:self action:@selector(selectView:) forControlEvents:UIControlEventTouchUpInside];
    [bgImage addSubview:button3];
    
    UIButton *button4 = [UIButton buttonWithType:UIButtonTypeCustom];
    button4.frame = CGRectMake(70, 1305, 40, 40);
    button4.backgroundColor = [UIColor clearColor];
    button4.tag = 4;
    [button4 addTarget:self action:@selector(selectView:) forControlEvents:UIControlEventTouchUpInside];
    [bgImage addSubview:button4];

}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)selectView:(UIButton *)button{
    switch (button.tag) {
        case 0:{
            PushPhotoViewController *temp = [[PushPhotoViewController alloc] init];
            temp.bgName =@"发布照片";
            temp.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:temp animated:YES];
        }
            break;
        case 1:
        case 2:
        case 3:
        case 4:
        {
            WuxianYinShiViewController *temp = [[WuxianYinShiViewController alloc] init];
            temp.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:temp animated:YES];
        }
        default:
            break;
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
