//
//  DetailTableViewCell.m
//  YoYo
//
//  Created by 夏宝梦 on 15/5/20.
//  Copyright (c) 2015年 yoyo. All rights reserved.
//

#import "DetailTableViewCell.h"
#define MARGIN 0.0


int titleHeight;
int titleWeight;
int imageHeight;

@implementation DetailTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.timeLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.timeLabel.font = [UIFont systemFontOfSize:12];
//        self.timeLabel.backgroundColor = [UIColor blueColor];
        
        self.briefLabel = [[UILabel alloc] initWithFrame:CGRectZero];
//        self.briefLabel.backgroundColor = [UIColor lightGrayColor];
        self.briefLabel.numberOfLines = 0;
        self.briefLabel.lineBreakMode = NSLineBreakByWordWrapping;
        
        self.iconImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        self.iconImageView.contentMode = UIViewContentModeScaleAspectFit;
//        self.iconImageView.backgroundColor = [UIColor yellowColor];
        
        self.commentTimeLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.commentTimeLabel.font = [UIFont systemFontOfSize:10];
//        self.commentTimeLabel.backgroundColor = [UIColor cyanColor];
        self.commentTimeLabel.numberOfLines = 0;
        
        self.commentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.commentBtn setImage:[UIImage imageNamed:@"tab_item_find"] forState:UIControlStateNormal];
//        [self.commentBtn addTarget:self action:@selector(btnSelected:) forControlEvents:UIControlEventTouchUpInside];
        
        self.commentCountLB = [[UILabel alloc] initWithFrame:CGRectZero];
        self.commentCountLB.font = [UIFont systemFontOfSize:10];
        
        self.praiseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.praiseBtn setImage:[UIImage imageNamed:@"zan_select"] forState:UIControlStateNormal];
//        [self.praiseBtn addTarget:self action:@selector(btnSelected:) forControlEvents:UIControlEventTouchUpInside];
        
        self.praiseCountLB = [[UILabel alloc] initWithFrame:CGRectZero];
        self.praiseCountLB.font = [UIFont systemFontOfSize:10];

        [self addSubview:self.commentBtn];
        [self addSubview:self.praiseBtn];
        [self addSubview:self.iconImageView];
        [self addSubview:self.commentTimeLabel];
        [self addSubview:self.briefLabel];
        [self addSubview:self.timeLabel];
        [self addSubview:self.commentCountLB];
        [self addSubview:self.praiseCountLB];
    }
    return self;
}

-(void)layoutSubviews{
    CGFloat width = 200;
    CGFloat height = self.frame.size.height-titleHeight;
    self.timeLabel.frame = CGRectMake(5, self.bounds.origin.y +20, 45, 20);
    self.briefLabel.frame = CGRectMake(50, self.bounds.origin.y +10, self.frame.size.width-55, titleHeight+10);
    self.briefLabel.font = [UIFont systemFontOfSize:12];    
    self.iconImageView.frame = CGRectMake(50, CGRectGetMaxY(self.briefLabel.frame)+5, width, height-85);
    self.commentTimeLabel.frame = CGRectMake(CGRectGetMinX(self.iconImageView.frame), CGRectGetMaxY(self.iconImageView.frame), 60, 20);
    self.commentBtn.frame = CGRectMake(50, CGRectGetMaxY(self.iconImageView.frame)+25, 20, 20);
    self.commentCountLB.frame = CGRectMake(CGRectGetMaxX(self.commentBtn.frame), CGRectGetMinY(self.commentBtn.frame), 60, 20);
    self.praiseBtn.frame = CGRectMake(self.frame.size.width - 80, CGRectGetMinY(self.commentBtn.frame), 20, 20);
    self.praiseCountLB.frame = CGRectMake(CGRectGetMaxX(self.praiseBtn.frame), CGRectGetMinY(self.praiseBtn.frame), 60, 20);
    
    NSLog(@"cell.height = %@",NSStringFromCGRect(self.frame));
}

+ (CGFloat)heightForViewWithObject:(id)object inColumnWidth:(CGFloat)columnWidth {
    CGFloat height = 0.0;
    int Cellwidth = columnWidth -75;
    height += 90;
    // Label
    NSString *caption = [object objectForKey:@"brief"]!=[NSNull null]? [object objectForKey:@"brief"]:@"";
    CGSize labelSize = CGSizeZero;
    UIFont *labelFont = [UIFont systemFontOfSize:12];
    labelSize = [self getLabHeightWithText:caption labeFont1:labelFont labeSize1:CGSizeMake(Cellwidth-55, INT_MAX)];
    titleHeight = labelSize.height;
    height += labelSize.height;
    
    // Image
    CGFloat width = 200;    
    int objectWidth = [[object objectForKey:@"width"] intValue];
    int objectHeight = [[object objectForKey:@"height"] intValue];
    imageHeight = floorf(objectHeight / (objectWidth / width));
    height += imageHeight;
    NSLog(@"height = %f",height);
    
    return height;
}
+ (CGSize)getLabHeightWithText:(NSString *)text labeFont1:(UIFont *)font labeSize1:(CGSize)size{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    NSDictionary *attributes = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle.copy};

    CGSize labelSize = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    return labelSize;
}
#pragma - mark 字符串高度计算
+ (CGSize)calculateLabelHeigntWithWidth:(CGFloat)width string:(NSString *)text andFont:(UIFont *)font
{
    if (text.length == 0 || [text isEqualToString:@" "]){
        return CGRectZero.size;
    }
    CGSize constraint = CGSizeMake(width , 1000);
    CGRect rect = [text boundingRectWithSize:constraint options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName, nil] context:nil];
    return rect.size;
}



@end
