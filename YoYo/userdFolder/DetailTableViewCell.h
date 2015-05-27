//
//  DetailTableViewCell.h
//  YoYo
//
//  Created by 夏宝梦 on 15/5/20.
//  Copyright (c) 2015年 yoyo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol imageClickedDelegate <NSObject>
-(void)imageClicked:(UIButton *)sender;
@end


@interface DetailTableViewCell : UITableViewCell


@property (nonatomic, strong) NSDictionary * object;

@property (nonatomic, strong) UILabel * timeLabel;
@property (nonatomic, strong) UILabel * briefLabel;
@property (nonatomic, strong) UIImageView * iconImageView;

@property (nonatomic, strong) UILabel * commentTimeLabel;
@property (nonatomic, strong) UIButton * commentBtn;
@property (nonatomic, strong) UILabel * commentCountLB;
@property (nonatomic, strong) UIButton * praiseBtn;
@property (nonatomic, strong) UILabel * praiseCountLB;

@property (nonatomic, strong) NSMutableArray * imageArray;
@property (nonatomic, strong) NSArray * urlArray;

@property (nonatomic, assign) id <imageClickedDelegate> delegate;
@property (nonatomic, strong) UIButton * dianpingBtn;
@property (nonatomic, strong) UILabel * dianpingLabel;


+ (CGFloat)heightForViewWithObject:(NSDictionary *)object inColumnWidth:(CGFloat)columnWidth;
- (CGSize)getLabHeightWithText:(NSString *)text labeFont1:(UIFont *)font labeSize1:(CGSize)size;
+(CGSize)getLabHeightWithText:(NSString *)text labeFont1:(UIFont *)font labeSize1:(CGSize)size;

-(void)setImageswithURLs:(NSArray *)urls;
- (void)fillViewWithObject:(NSDictionary *)object withWidth:(CGFloat)width andIndexHeight:(CGFloat)indexHeight;

@end
