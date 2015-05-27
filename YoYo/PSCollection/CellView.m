//
//  CellView.m
//  PSCollectionViewDemo
//
//  Created by Eric on 12-6-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CellView.h"
#define MARGIN 0.0

@implementation CellView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)prepareForReuse {
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat width = self.frame.size.width - MARGIN * 2;
    CGFloat top = MARGIN;
    CGFloat left = MARGIN;
    NSDictionary *model = (NSDictionary *)self.object;
    // Image
    int objectWidth = [[model objectForKey:@"width"] floatValue];
    int objectHeight = [[model objectForKey:@"height"] floatValue];
    int scaledHeight = floorf(objectHeight / (objectWidth / width));
    self.picView.frame = CGRectMake(left, top, width, scaledHeight);
    _name.frame = CGRectMake(15, scaledHeight-40, 100, 40);
    _cont.frame = CGRectMake(0, scaledHeight, width, 65);
    self.info.frame = CGRectMake(0, 0, width, 40);
    self.count.frame = CGRectMake(width-50, 40, 40, 20);
}


- (IBAction)Action:(UIButton *)sender{
    [sender setSelected:!sender.selected];
    
}
- (IBAction)zanAction:(UIButton*)sender {
    [sender setSelected:!sender.selected];
    int num = [_count.text intValue];
    if (sender.selected) {
        num++;
    }else{
        num--;
    }
    _count.text = [NSString stringWithFormat:@"%d",num];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
