//
//  PinTypeButton.m
//  YoYo
//
//  Created by nichalos on 15/4/9.
//  Copyright (c) 2015年 yoyo. All rights reserved.
//

#import "PinTypeButton.h"

@implementation PinTypeButton

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.selectView = [[UIImageView alloc] initWithFrame:CGRectMake(10, (frame.size.height-20)/2, 20, 20)];
        self.selectView.image = [UIImage imageNamed:@"duigou"];
        self.selectView.hidden = YES;
        [self addSubview:_selectView];
        
        self.name = [[UILabel alloc] initWithFrame:CGRectMake(30, 0, frame.size.width-30, frame.size.height)];
        _name.textAlignment = NSTextAlignmentLeft;
        _name.textColor = [UIColor whiteColor];
        _name.font = [UIFont systemFontOfSize:18];
        [self addSubview: _name];
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
