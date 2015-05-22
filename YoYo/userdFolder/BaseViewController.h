//
//  BaseViewController.h
//  YoYo
//
//  Created by nichalos on 15/4/3.
//  Copyright (c) 2015年 yoyo. All rights reserved.
//

#import <UIKit/UIKit.h>
#define BASE_COLOR [UIColor colorWithRed:249/255.0f green:92/255.0f blue:89/255.0f alpha:1]
@interface BaseViewController : UIViewController{
    UILabel *title;
    UIButton *rightBtn;
    NSArray *array;
    UIImageView *bg;
}

@end
