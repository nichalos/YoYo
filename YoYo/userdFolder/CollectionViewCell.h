//
//  CollectionViewCell.h
//  YoYo
//
//  Created by Junfeng Bai on 15/2/13.
//  Copyright (c) 2015年 yoyo. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CollectionViewCell : UICollectionViewCell{
    CALayer *layer;
    UILabel *name;
}
- (void) setImageNmae:(NSString *)image setName:(NSString*)nameStr;
@end
