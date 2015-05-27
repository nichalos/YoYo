//
//  DetailTableViewCell.m
//  YoYo
//
//  Created by 夏宝梦 on 15/5/20.
//  Copyright (c) 2015年 yoyo. All rights reserved.
//


// cell边框的宽度
#define kCellBorderWidth 5

#import "DetailTableViewCell.h"
#import "UIView+AutoLayout.h"



@implementation DetailTableViewCell
{
    UIButton * firstBtn;
}

- (void)awakeFromNib {
    // Initialization code
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.timeLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.timeLabel.font = [UIFont systemFontOfSize:12];
        self.timeLabel.textColor = [UIColor lightGrayColor];
        self.timeLabel.frame = CGRectMake(kCellBorderWidth, kCellBorderWidth, 50, 20);
        
//        self.timeLabel.backgroundColor = [UIColor blueColor];
        
        self.briefLabel = [[UILabel alloc] initWithFrame:CGRectZero];
//        self.briefLabel.backgroundColor = [UIColor greenColor];
        self.briefLabel.numberOfLines = 0;
        self.briefLabel.font = [UIFont systemFontOfSize:12];
        self.briefLabel.lineBreakMode = NSLineBreakByWordWrapping;
        
        self.iconImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        self.iconImageView.contentMode = UIViewContentModeScaleAspectFit;
//        self.iconImageView.backgroundColor = [UIColor orangeColor];
        
        self.commentTimeLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.commentTimeLabel.font = [UIFont systemFontOfSize:10];
//        self.commentTimeLabel.backgroundColor = [UIColor redColor];
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
        [self addSubview:self.dianpingBtn];
        [self addSubview:self.dianpingLabel];
        
        self.imageArray = [NSMutableArray array];
        
        self.layer.borderColor = [UIColor lightGrayColor].CGColor;
        self.layer.borderWidth = 0.3f;
    }
    return self;
}

-(void)layoutSubviews{

}

#pragma mark- Outside Method
-(void)setImageswithURLs:(NSArray *)urls
{
    if (urls.count>6)  NSAssert(nil,@"set images must less than 9",6);
    
    _urlArray=[[NSArray alloc]initWithArray:urls];
    [self.imageArray removeAllObjects];
    firstBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
    NSInteger count= urls.count;
    [self.iconImageView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    self.iconImageView.userInteractionEnabled = YES;
    if (count == 1) {
        
        NSString * url = [urls objectAtIndex:0];
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:url] forState:UIControlStateNormal];
        btn.frame = CGRectMake(0, 0, 90, 90);
        btn.tag = 100+0;
        [btn addTarget:self action:@selector(imageBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.iconImageView addSubview:btn];
    }else if (count>1 && count<4){
        for (int i = 0; i<urls.count ;i++)
        {
            NSString * url = [urls objectAtIndex:i];
            UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [btn setImage:[UIImage imageNamed:url] forState:UIControlStateNormal];
            NSInteger row = urls.count%3==0 ? urls.count/3 : urls.count/3+1;
            btn.frame = CGRectMake(0 + i*90, 0 + (row-1)*90, 90, 90);
            btn.tag = 100+i;
            [btn addTarget:self action:@selector(imageBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
            [self.iconImageView addSubview:btn];
//            btn.backgroundColor = [UIColor redColor];
        }
    }else{
        for (int i = 0; i<urls.count ;i++)
        {
            if (i<3) {
                NSString * url = [urls objectAtIndex:i];
                UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
                [btn setImage:[UIImage imageNamed:url] forState:UIControlStateNormal];
//                NSInteger row = urls.count%3==0 ? urls.count/3 : urls.count/3+1;
                btn.frame = CGRectMake(0 + i*90, 0, 90, 90);
                btn.tag = 100+i;
                [btn addTarget:self action:@selector(imageBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
                [self.iconImageView addSubview:btn];
                btn.backgroundColor = [UIColor redColor];
            }else if (i >= 3){
                NSString * url = [urls objectAtIndex:i];
                UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
                [btn setImage:[UIImage imageNamed:url] forState:UIControlStateNormal];
                NSInteger row = urls.count%3==0 ? urls.count/3 : urls.count/3+1;
                btn.frame = CGRectMake(0 + (i-3)*90, 0 + (row-1)*90, 90, 90);
                btn.tag = 100+i;
                [btn addTarget:self action:@selector(imageBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
                [self.iconImageView addSubview:btn];
                
//                btn.backgroundColor = [UIColor redColor];
            }
           
        }
    }
}
-(void)imageBtnClicked:(UIButton *)sender{
    if (self.delegate) {
        [self.delegate imageClicked:sender];
    }
}
- (void)fillViewWithObject:(NSDictionary *)object withWidth:(CGFloat)width andIndexHeight:(CGFloat)indexHeight{
    self.object = object;
    int height = 0;
    NSDictionary * item = self.object;
    NSString *caption = [item objectForKey:@"brief"]!=[NSNull null]? [item objectForKey:@"brief"]:@"";
    CGSize labelSize = CGSizeZero;
    UIFont *labelFont = [UIFont systemFontOfSize:12];
    int labelwidth = width-60;
    labelSize = [self getLabHeightWithText:caption labeFont1:labelFont labeSize1:CGSizeMake(labelwidth, 1000)];
    height += labelSize.height+10;
    width = width - 70;
    self.briefLabel.frame = CGRectMake(CGRectGetMaxX(_timeLabel.frame), CGRectGetMinY(_timeLabel.frame)-1 +indexHeight, width, height);
    
    //image
    NSArray * imageArray = [item objectForKey:@"image"];
    if (imageArray.count == 0) {
        
    }else if (imageArray.count<4){
        height = 90;
    }else{
        height = 180;
    }
    
    self.iconImageView.frame = CGRectMake(CGRectGetMaxX(_timeLabel.frame), CGRectGetMaxY(self.briefLabel.frame)+5, width, height);
    self.commentTimeLabel.frame = CGRectMake(CGRectGetMinX(self.iconImageView.frame), CGRectGetMaxY(self.iconImageView.frame), 60, 20);
    self.commentBtn.frame = CGRectMake(55, CGRectGetMaxY(self.commentTimeLabel.frame)+5, 20, 20);
    self.commentCountLB.frame = CGRectMake(CGRectGetMaxX(self.commentBtn.frame), CGRectGetMinY(self.commentBtn.frame), 60, 20);
    self.praiseBtn.frame = CGRectMake(CGRectGetMaxX(self.iconImageView.frame)-70, CGRectGetMinY(self.commentBtn.frame), 20, 20);
    self.praiseCountLB.frame = CGRectMake(CGRectGetMaxX(self.praiseBtn.frame), CGRectGetMinY(self.praiseBtn.frame), 40, 20);
}

+ (CGFloat)heightForViewWithObject:(NSDictionary *)item inColumnWidth:(CGFloat)columnWidth {
    
    NSArray * imageArray = [item objectForKey:@"image"];
    int height = 0;
    
    //label
    NSString *caption = [item objectForKey:@"brief"]!=[NSNull null]? [item objectForKey:@"brief"]:@"";
    CGSize labelSize = CGSizeZero;
    UIFont *labelFont = [UIFont systemFontOfSize:12];
    int labelwidth = columnWidth-60;
    labelSize = [self calculateLabelHeigntWithWidth:labelwidth string:caption andFont:labelFont];
//    labelSize = [self getLabHeightWithText:caption labeFont1:labelFont labeSize1:CGSizeMake(labelwidth, 1000)];
    height += labelSize.height+10;
    
    //image
    if (imageArray.count == 0) {
       
    }else if (imageArray.count<4){
        height += 90;
    }else{
        height += 180;
    }
    return height+70;
}

-(CGSize)getLabHeightWithText:(NSString *)text labeFont1:(UIFont *)font labeSize1:(CGSize)size{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    NSDictionary *attributes = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle.copy};
    CGSize labelSize = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    return labelSize;
}

+(CGSize)getLabHeightWithText:(NSString *)text labeFont1:(UIFont *)font labeSize1:(CGSize)size{
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
