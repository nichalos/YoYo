//
//  FriendCollectionViewCell.m
//  YoYo
//
//  Created by 夏宝梦 on 15/5/20.
//  Copyright (c) 2015年 yoyo. All rights reserved.
//

#import "FriendCollectionViewCell.h"

@implementation FriendCollectionViewCell


- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        icon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 2, frame.size.width, frame.size.width)];
        icon.backgroundColor = [UIColor clearColor];
        icon.layer.cornerRadius = 4;
        icon.layer.masksToBounds = YES;
        [self.contentView addSubview:icon];
        
        name = [[UILabel alloc] initWithFrame:CGRectMake(0, frame.size.height-10, frame.size.width, 10)];
        name.textAlignment = NSTextAlignmentCenter;
        name.backgroundColor = [UIColor clearColor];
        name.textColor = [UIColor blackColor];
        name.font = [UIFont systemFontOfSize:10];
        [self.contentView addSubview:name];
    }
    return self;
}

- (void) setImageNmae:(NSString *)image setName:(NSString *)nameStr{
   icon.image = [UIImage imageNamed:image];
    name.text = nameStr;
}

@end
