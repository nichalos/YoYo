//
//  CardView.m
//  YoYo
//
//  Created by Junfeng Bai on 15/4/2.
//  Copyright (c) 2015年 yoyo. All rights reserved.
//

#import "CardView.h"

@implementation CardView

- (id)initWithFrame:(CGRect)frame isLineTow:(BOOL)isTow{
    self = [super initWithFrame:frame];
    if (self) {
        self.icon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.height, frame.size.height)];
        _icon.backgroundColor = [UIColor clearColor];
        _icon.layer.cornerRadius = 8;
        _icon.layer.masksToBounds = YES;
        [self addSubview:_icon];
        
//        UIImageView *iconBg = [[UIImageView alloc] initWithFrame:_icon.frame];
//        iconBg.image = [UIImage imageNamed:@"home_f"];
//        [self addSubview:iconBg];
        
        self.name = [[UILabel alloc] initWithFrame:CGRectMake(62, 0, frame.size.width-70, 15)];
        self.name.textAlignment = NSTextAlignmentLeft;
        self.name.textColor = [UIColor colorWithRed:220/255.0 green:87/255.0 blue:80/255.0 alpha:1];
        self.name.font = [UIFont systemFontOfSize:13];
        [self addSubview:self.name];
        
        self.pin = [UIButton buttonWithType:UIButtonTypeCustom];
        self.pin.frame = CGRectMake(frame.size.width-20, 0, 30, 30);
        [self.pin setImage:[UIImage imageNamed:@"pin"] forState:UIControlStateNormal];
        self.pin.hidden = YES;
        [self addSubview:self.pin];
        
        self.info = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(_name.frame), CGRectGetMaxY(_name.frame), frame.size.width-70, isTow? 30:20)];
        self.info.numberOfLines = isTow? 2:1;
        self.info.textAlignment = NSTextAlignmentLeft;
        self.info.font = [UIFont systemFontOfSize:11];
        self.info.textColor = [UIColor grayColor];
        [self addSubview:self.info];
        
        self.count = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(_name.frame), CGRectGetMaxY(_info.frame)+3, frame.size.width-70, 15)];
        self.count.textAlignment = NSTextAlignmentLeft;
        self.count.textColor = _name.textColor;
        self.count.font = [UIFont systemFontOfSize:11];
        [self addSubview:self.count];
    }
    return self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
