//
//  GerenViewController.m
//  YoYo
//
//  Created by nichalos on 15/4/16.
//  Copyright (c) 2015年 yoyo. All rights reserved.
//

#import "GerenViewController.h"
#import "PinTypeButton.h"

@interface GerenViewController (){
    UIView *pinWin;
    PinTypeButton *selectButton;
    UIImageView *noticeView;
}

@end

@implementation GerenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *view = [[UIView alloc] initWithFrame:self.view.bounds];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 56, view.frame.size.width, view.frame.size.height-76)];
    scroll.backgroundColor = [UIColor whiteColor];
    scroll.showsHorizontalScrollIndicator = NO;
    scroll.showsVerticalScrollIndicator = NO;
    [scroll setContentSize:CGSizeMake(0, 1092)];
    
    UIImageView *bg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, scroll.frame.size.width, 1092)];
    bg.image = [UIImage imageNamed:@"geren"];
    bg.contentMode = UIViewContentModeTopLeft;
    bg.userInteractionEnabled = YES;
    bg.backgroundColor = [UIColor clearColor];
    [scroll addSubview:bg];
    [view addSubview:scroll];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(338, 10, 60, 60);
    button.backgroundColor = [UIColor clearColor];
    button.tag = 1;
    [button addTarget:self action:@selector(SelectionBtn:) forControlEvents:UIControlEventTouchUpInside];
    [bg addSubview:button];
    
    UIImageView *imageBg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 75)];
    imageBg.image = [UIImage imageNamed:@"nav_background"];
    imageBg.userInteractionEnabled = YES;
    [self.view addSubview:imageBg];
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 27, self.view.frame.size.width, 48)];
    title.textColor = [UIColor whiteColor];
    title.font = [UIFont systemFontOfSize:20];
    title.textAlignment = NSTextAlignmentCenter;
    title.text = @"个人主页";
    title.backgroundColor = [UIColor clearColor];
    [imageBg addSubview:title];
    
    UIButton *start = [UIButton buttonWithType:UIButtonTypeCustom];
    start.frame = CGRectMake(10, 24, 45, 45);
    [start setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [start addTarget:self action:@selector(SelectionBtn:) forControlEvents:UIControlEventTouchUpInside];
    start.tag = 0;
    [imageBg addSubview:start];
    [self initPinView];
    [self initNoticeView];
}

- (void)initPinView{
    pinWin = [[UIView alloc] initWithFrame:self.view.bounds];
    pinWin.backgroundColor = [UIColor clearColor];
    pinWin.hidden = YES;
    
    UIImageView *pinBg = [[UIImageView alloc] initWithFrame:CGRectMake((CGRectGetWidth(pinWin.frame)-386)/2, (CGRectGetHeight(pinWin.frame)-234)/2, 386, 234)];
    pinBg.image = [UIImage imageNamed:@"pin_win"];
    pinBg.userInteractionEnabled = YES;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, CGRectGetWidth(pinWin.frame), 40)];
    label.text = @"你想怎么品?";
    label.textAlignment = NSTextAlignmentLeft;
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:18];
    [pinBg addSubview:label];
    
    UIImageView *line = [[UIImageView alloc] initWithFrame:CGRectMake(0, 39, CGRectGetWidth(pinWin.frame), 1)];
    line.image = [UIImage imageNamed:@"home_h"];
    [pinBg addSubview:line];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(20, 40, pinBg.frame.size.width-40, 140)];
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.backgroundColor = [UIColor clearColor];
    
    NSArray *pinArray = [NSArray arrayWithObjects:@"细嚼慢咽",@"狼吞虎咽",@"囫囵吞枣",@"风卷残云",@"其味无穷",@"饥不择食",@"回味无穷",@"咂嘴舔唇",@"津津有味",@"盆光钵净",@"蚕食鲸吞", @"饿虎扑食", @"茹毛饮血",@"食不甘味",@"大吃大喝", @"疯掠狂食", @"虎口吞食 ",nil];
    for (int i = 0; i<pinArray.count; i++) {
        PinTypeButton *button = [[PinTypeButton alloc] initWithFrame:CGRectMake(i%3*108, i/3*50, 108, 40)];
        button.tag = i;
        button.name.text = pinArray[i];
        [button addTarget:self action:@selector(pinType:) forControlEvents:UIControlEventTouchUpInside];
        button.backgroundColor = [UIColor clearColor];
        [scrollView addSubview:button];
    }
    [scrollView setContentSize:CGSizeMake(0, pinArray.count/3*50+50)];
    [pinBg addSubview:scrollView];
    
    UIButton *done = [UIButton buttonWithType:UIButtonTypeCustom];
    done.frame = CGRectMake(50, 180, pinBg.frame.size.width-100, 45);
    done.tag = 4;
    [done addTarget:self action:@selector(doneAction:) forControlEvents:UIControlEventTouchUpInside];
    [done setTitle:@"确定" forState:UIControlStateNormal];
    done.layer.borderColor = [UIColor colorWithWhite:.9 alpha:.5].CGColor;
    done.layer.borderWidth = 2;
    done.layer.cornerRadius = 4;
    done.layer.masksToBounds = YES;
    [pinBg addSubview:done];
    
    
    [pinWin addSubview:pinBg];
    [self.view addSubview:pinWin];
}

- (void)doneAction:(UIButton *)button{
    pinWin.hidden = YES;
    if (selectButton) {
        selectButton.selectView.hidden = YES;
        [selectButton setSelected:NO];
    }
    [self showNoticeView];
}

- (void)pinType:(PinTypeButton *)button{
    if (button.selected) {
        [button setSelected:NO];
        button.selectView.hidden = YES;
    }else{
        [button setSelected:YES];
        button.selectView.hidden = NO;
    }
    if (selectButton && selectButton.tag == button.tag) {
        selectButton = nil;
        return;
    }else{
        selectButton.selectView.hidden = YES;
        [selectButton setSelected:NO];
    }
    selectButton = button;
}

- (void)initNoticeView{
    
        noticeView = [[UIImageView alloc] initWithFrame:CGRectMake(10, (self.view.frame.size.height-63)/2, self.view.frame.size.width-20, 63)];
        noticeView.image = [UIImage imageNamed:@"button"];
        UILabel *notice = [[UILabel alloc] initWithFrame:noticeView.bounds];
        notice.text = @"Ta已经成为你的盘中餐！";
        notice.textColor = [UIColor whiteColor];
        notice.textAlignment = NSTextAlignmentCenter;
        [noticeView addSubview:notice];
    
    noticeView.hidden = YES;
    [self.view addSubview:noticeView];
}

- (void)showNoticeView{
    noticeView.hidden = NO;
    [self performSelector:@selector(hiddenNoticeView) withObject:nil afterDelay:1];
}
- (void)hiddenNoticeView{
    noticeView.hidden = YES;
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    if (touch.view == pinWin) {
        pinWin.hidden = YES;
    }
}
- (void)SelectionBtn:(UIButton *)button{
    switch (button.tag) {
        case 0:
            [self.navigationController popViewControllerAnimated:YES];
            break;
        case 1:
        {
            pinWin.hidden = NO;
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
