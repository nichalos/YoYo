//
//  ChangeInfoViewController.m
//  YoYo
//
//  Created by 夏宝梦 on 15/5/25.
//  Copyright (c) 2015年 yoyo. All rights reserved.
//

#import "ChangeInfoViewController.h"

@interface ChangeInfoViewController ()

@end

@implementation ChangeInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    title.text = [NSString stringWithFormat:@"修改%@",self.titleName];
    
    rightBtn.frame = CGRectMake(20, 30, 30, 30);
    [rightBtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    rightBtn.tag = 10;
    [rightBtn addTarget:self action:@selector(selectView:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *confirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    confirmBtn.frame = CGRectMake(self.view.frame.size.width - 70, 30, 50, 30);
    [confirmBtn setTitle:@"确定" forState:UIControlStateNormal];
    [confirmBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [confirmBtn addTarget:self action:@selector(selectView:) forControlEvents:UIControlEventTouchUpInside];
    confirmBtn.tag = 11;
    [self.view addSubview:confirmBtn];
    
    UITextView * textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 90, self.view.frame.size.width, 100)];
    [self.view addSubview:textView];
    
}

-(void)selectView:(UIButton *)button{
    switch (button.tag) {
        case 10:{
            [self.navigationController popViewControllerAnimated:YES];
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
