//
//  PersonCell.m
//  YoYo
//
//  Created by 夏宝梦 on 15/5/25.
//  Copyright (c) 2015年 yoyo. All rights reserved.
//

#import "PersonCell.h"

@implementation PersonCell

- (void)awakeFromNib {
    // Initialization code
}


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.iconImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 80, 80)];
        self.iconImage.contentMode = UIViewContentModeScaleAspectFit;
        self.iconImage.clipsToBounds = YES;
        self.iconImage.layer.cornerRadius = 5;
        [self addSubview:self.iconImage];
        
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_iconImage.frame)+5, CGRectGetMinY(_iconImage.frame), self.frame.size.width - 100, 20)];
        self.nameLabel.font = [UIFont systemFontOfSize:15];
        self.nameLabel.textAlignment = NSTextAlignmentLeft;
        [self addSubview:self.nameLabel];
        
        self.contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(_nameLabel.frame), CGRectGetMaxY(_nameLabel.frame)+1, self.frame.size.width - 100, 20)];
        self.contentLabel.font = [UIFont systemFontOfSize:15];
        self.contentLabel.textAlignment = NSTextAlignmentLeft;
        [self addSubview:self.contentLabel];
        
        
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
