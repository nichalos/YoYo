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
        layer = [[CALayer alloc] init];
        layer.backgroundColor = [UIColor redColor].CGColor;
        layer.position = CGPointMake(frame.size.width/2, frame.size.height/2);
        layer.bounds = CGRectMake(0, 0, frame.size.width-10, frame.size.width-15);
        layer.cornerRadius = 5.0f;
        layer.masksToBounds = YES;
        layer.borderWidth = 2;
        layer.borderColor = [UIColor whiteColor].CGColor;
        [self.contentView.layer addSublayer:layer];
        name = [[UILabel alloc] initWithFrame:CGRectMake(0, frame.size.height-10, frame.size.width, 10)];
        name.textAlignment = NSTextAlignmentCenter;
        name.backgroundColor = [UIColor clearColor];
        name.textColor = [UIColor darkGrayColor];
        name.font = [UIFont systemFontOfSize:10];
        [self.contentView addSubview:name];
    }
    return self;
}

- (void) setImageNmae:(NSString *)image setName:(NSString *)nameStr{
    UIImage *icon = [UIImage imageNamed:image];
    [layer setContents:(id)icon.CGImage];
    name.text = nameStr;
}

@end
