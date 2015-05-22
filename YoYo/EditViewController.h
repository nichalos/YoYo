//
//  EditViewController.h
//  YoYo
//
//  Created by nichalos on 15/4/11.
//  Copyright (c) 2015年 yoyo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditViewController : UIViewController<UITextViewDelegate>{
    UITextView *textView;
}

@property (nonatomic,strong)NSString *bgName;

@end
