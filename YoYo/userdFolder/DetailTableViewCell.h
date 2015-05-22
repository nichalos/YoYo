//
//  DetailTableViewCell.h
//  YoYo
//
//  Created by 夏宝梦 on 15/5/20.
//  Copyright (c) 2015年 yoyo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailTableViewCell : UITableViewCell


@property (nonatomic, strong) id object;

@property (nonatomic, strong) UILabel * timeLabel;
@property (nonatomic, strong) UILabel * briefLabel;
@property (nonatomic, strong) UIImageView * iconImageView;

@property (nonatomic, strong) UILabel * commentTimeLabel;
@property (nonatomic, strong) UIButton * commentBtn;
@property (nonatomic, strong) UILabel * commentCountLB;
@property (nonatomic, strong) UIButton * praiseBtn;
@property (nonatomic, strong) UILabel * praiseCountLB;




+ (CGFloat)heightForViewWithObject:(id)object inColumnWidth:(CGFloat)columnWidth;
+ (CGSize)getLabHeightWithText:(NSString *)text labeFont1:(UIFont *)font labeSize1:(CGSize)size;
- (CGSize)calculateLabelHeigntWithWidth:(CGFloat)width string:(NSString *)text andFont:(UIFont *)font;

@end
