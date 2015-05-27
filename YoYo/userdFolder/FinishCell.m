//
//  FinishCell.m
//  YoYo
//
//  Created by 夏宝梦 on 15/5/25.
//  Copyright (c) 2015年 yoyo. All rights reserved.
//

#import "FinishCell.h"

@implementation FinishCell

- (void)awakeFromNib {
    // Initialization code
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.iconImage = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width -50, 10, 40, 40)];
        self.iconImage.contentMode = UIViewContentModeScaleAspectFit;
        self.iconImage.clipsToBounds = YES;
        self.iconImage.layer.cornerRadius = 5;
        [self addSubview:self.iconImage];
        
        self.contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, 150, 20)];
        self.contentLabel.font = [UIFont systemFontOfSize:15];
        self.contentLabel.textAlignment = NSTextAlignmentLeft;
//        self.contentLabel.backgroundColor = [UIColor redColor];
        [self addSubview:self.contentLabel];
        
        self.detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width -90, 10, 100, 20)];
        self.detailLabel.font = [UIFont systemFontOfSize:14];
        self.detailLabel.textAlignment = NSTextAlignmentRight;
//        self.detailLabel.backgroundColor = [UIColor blueColor];
        [self addSubview:self.detailLabel];
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
