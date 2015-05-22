//
//  CollectionViewCell.m
//  YoYo
//
//  Created by Junfeng Bai on 15/2/13.
//  Copyright (c) 2015年 yoyo. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        layer = [[CALayer alloc] init];
        layer.backgroundColor = [UIColor redColor].CGColor;
        layer.position = CGPointMake(frame.size.width/2, frame.size.height/2);
        layer.bounds = CGRectMake(0, 0, frame.size.width, frame.size.width);
        layer.cornerRadius = frame.size.width/2;
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
