//
//  CardView.h
//  YoYo
//
//  Created by Junfeng Bai on 15/4/2.
//  Copyright (c) 2015年 yoyo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CardView : UIView

@property (nonatomic,strong) UIImageView *icon;
@property (nonatomic,strong) UILabel *name;
@property (nonatomic,strong) UILabel *info;
@property (nonatomic,strong) UILabel *count;
@property (nonatomic,strong) UIButton *pin;

- (id)initWithFrame:(CGRect)frame isLineTow:(BOOL)isTow;
@end
