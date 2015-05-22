//
//  BaseViewController.m
//  YoYo
//
//  Created by nichalos on 15/4/3.
//  Copyright (c) 2015年 yoyo. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    bg = [[UIImageView alloc] initWithFrame:self.view.bounds];
    bg.backgroundColor = [UIColor colorWithRed:233/255.0f green:233/255.0f blue:233/255.0f alpha:1];
    bg.userInteractionEnabled = YES;
    [self.view addSubview:bg];
    
    UIImageView *imageBg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 74)];
//    imageBg.image = [UIImage imageNamed:@"nav_background"];
    imageBg.backgroundColor = [UIColor whiteColor];
    imageBg.userInteractionEnabled = YES;
    [self.view addSubview:imageBg];
    
    title = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 46)];
    title.textColor = [UIColor blackColor];
    title.font = [UIFont systemFontOfSize:20];
    title.textAlignment = NSTextAlignmentCenter;
    title.backgroundColor = [UIColor clearColor];
    [imageBg addSubview:title];
    
    UIButton *start = [UIButton buttonWithType:UIButtonTypeCustom];
    start.frame = CGRectMake(self.view.frame.size.width-75, 25, 69, 35);
    rightBtn = start;
    [imageBg addSubview:start];
    
    NSString *path=[[NSBundle mainBundle] pathForResource:@"user" ofType:@"plist"];
    array=[NSArray arrayWithContentsOfFile:path];
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
