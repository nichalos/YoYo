//
//  DianPingTableViewCell.m
//  YoYo
//
//  Created by xbm524 on 15/5/24.
//  Copyright (c) 2015年 yoyo. All rights reserved.
//

#import "DianPingTableViewCell.h"

@implementation DianPingTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGSize size = [UIScreen mainScreen].bounds.size;
        
        self.iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 5, 50, 50)];
        self.iconImageView.layer.cornerRadius = 25;
        self.iconImageView.clipsToBounds = YES;
        
        self.iconImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:self.iconImageView];
        
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.iconImageView.frame)+5, CGRectGetMinY(self.iconImageView.frame), 80, 20)];
        self.nameLabel.font = [UIFont systemFontOfSize:13];
        [self addSubview:self.nameLabel];
        
        self.classView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.nameLabel.frame), CGRectGetMinY(self.nameLabel.frame), 20, 20)];
        self.classView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:self.classView];
        
        self.briefLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.nameLabel.frame)+5, CGRectGetMaxY(self.nameLabel.frame), 200, 20)];
        self.briefLabel.font = [UIFont systemFontOfSize:13];
        self.briefLabel.textAlignment = NSTextAlignmentLeft;
        [self addSubview:self.briefLabel];
        
        self.timefLabel = [[UILabel alloc] initWithFrame:CGRectMake(size.width - 100, CGRectGetMinY(self.nameLabel.frame), 100, 20)];
        self.timefLabel.font = [UIFont systemFontOfSize:13];
        self.timefLabel.textAlignment = NSTextAlignmentRight;
        [self addSubview:self.timefLabel];
        
        
    }
    return self;
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
