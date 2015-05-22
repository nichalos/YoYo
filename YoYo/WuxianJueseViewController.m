//
//  WuxianJueseViewController.m
//  YoYo
//
//  Created by nichalos on 15/4/13.
//  Copyright (c) 2015年 yoyo. All rights reserved.
//

#import "WuxianJueseViewController.h"

@interface WuxianJueseViewController ()

@end

@implementation WuxianJueseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    for (int i =0; i<9; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(12+i%3*134, 95+i/3*170, 124, 124);
        button.layer.cornerRadius = 62;
        button.layer.masksToBounds = YES;
        [button setBackgroundImage:[UIImage imageNamed:@"dj"] forState:UIControlStateSelected];
        [button addTarget:self action:@selector(selectAction:) forControlEvents:UIControlEventTouchUpInside];
        switch (i) {
            case 5:
                 button.frame = CGRectMake(17+i%3*134, 99+i/3*170, 120, 120);
                break;
            case 6:
                 button.frame = CGRectMake(16+i%3*134, 94+i/3*170, 120, 120);
                break;
            case 7:
                 button.frame = CGRectMake(17+i%3*134, 94+i/3*170, 120, 120);
                break;
            case 8:
                 button.frame = CGRectMake(17+i%3*134, 92+i/3*170, 120, 120);
                break;
            default:
                break;
        }
        [self.view addSubview:button];
    }
    
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    button1.frame = CGRectMake(35, 697, 350, 33);
    button1.backgroundColor = [UIColor clearColor];
    button1.tag = 1;
    [button1 addTarget:self action:@selector(SelectionBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
}

-(void)selectAction:(UIButton *)button{
    [button setSelected:!button.selected];
}

- (void)SelectionBtn:(UIButton *)button{
    switch (button.tag) {
        case 0:
            [self.navigationController popViewControllerAnimated:YES];
            break;
        case 1:
        {
            MoreViewController *temp = [[MoreViewController alloc] init];
            temp.bgName = @"星光无限q_角色影像-支付";
            [self.navigationController pushViewController:temp animated:YES];
        }
            break;
        default:
            break;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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
