//
//  NewViewController.m
//  YoYo
//
//  Created by Junfeng Bai on 15/2/13.
//  Copyright (c) 2015年 yoyo. All rights reserved.
//

#import "NewViewController.h"
#import "MoreViewController.h"
@interface NewViewController (){

}

@end

@implementation NewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    title.text = @"发现机缘";
    rightBtn.hidden = YES;
    UIButton *start = [UIButton buttonWithType:UIButtonTypeCustom];
    start.frame = CGRectMake(10, 24, 45, 45);
    [start setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [start addTarget:self action:@selector(SelectionBtn:) forControlEvents:UIControlEventTouchUpInside];
    start.tag = 0;
    [self.view addSubview:start];
    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 75, 414, 607)];
    image.userInteractionEnabled = YES;
    [self.view addSubview:image];
    image.image = [UIImage imageNamed:@"发现机缘"];
    
    UIImageView *line = [[UIImageView alloc] initWithFrame:CGRectMake(0, 680, 414, 10)];
    line.userInteractionEnabled = YES;
    [self.view addSubview:line];
    line.image = [UIImage imageNamed:@"faxian"];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(180, 490, 40, 70);
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
            MoreViewController *temp = [[MoreViewController alloc] init];
            temp.bgName = @"发现机缘点中";
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
