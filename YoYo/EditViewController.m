//
//  EditViewController.m
//  YoYo
//
//  Created by nichalos on 15/4/11.
//  Copyright (c) 2015年 yoyo. All rights reserved.
//

#import "EditViewController.h"

@interface EditViewController ()

@end

@implementation EditViewController

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
    
    UIButton *save = [UIButton buttonWithType:UIButtonTypeCustom];
    save.frame = CGRectMake(340, 24, 45, 45);
    [save setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [save addTarget:self action:@selector(SelectionBtn:) forControlEvents:UIControlEventTouchUpInside];
    save.tag = 1;
    [self.view addSubview:save];
    
    textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 75, self.view.frame.size.width, 100)]; //初始化大小并自动释放
    
    textView.textColor = [UIColor blackColor];//设置textview里面的字体颜色
    
    textView.font = [UIFont fontWithName:@"Arial" size:18.0];//设置字体名字和字体大小
    
    textView.delegate = self;//设置它的委托方法
    
    textView.backgroundColor = [UIColor whiteColor];//设置它的背景颜色
    
    
    
    textView.text = @"";//设置它显示的内容
    
    textView.returnKeyType = UIReturnKeyDefault;//返回键的类型
    
    textView.keyboardType = UIKeyboardTypeDefault;//键盘类型
    
    textView.scrollEnabled = YES;//是否可以拖动
    
    
    
    textView.autoresizingMask = UIViewAutoresizingFlexibleHeight;//自适应高度
    
    
    
    [self.view addSubview: textView];//加入到整个页面中
}

- (void)SelectionBtn:(UIButton *)button{
    [textView resignFirstResponder];
    switch (button.tag) {
        case 0:
            [self.navigationController popViewControllerAnimated:YES];
            break;
        case 1:
        {
            
        }
            break;
        default:
            break;
    }
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    
    self.navigationItem.rightBarButtonItem = nil;
    
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
