//
//  FriendCollectionViewCell.h
//  YoYo
//
//  Created by 夏宝梦 on 15/5/20.
//  Copyright (c) 2015年 yoyo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FriendCollectionViewCell : UICollectionViewCell{
    UIImageView *icon;
    UILabel *name;
}
- (void) setImageNmae:(NSString *)image setName:(NSString*)nameStr;


@end
