//
//  MyYoYoViewController.h
//  YoYo
//
//  Created by Junfeng Bai on 15/2/13.
//  Copyright (c) 2015年 yoyo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

typedef enum  {
    enumXr = 0,
    enumYy = 1,
    enumHd = 2
} ViewTyp;

@interface MyYoYoViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>{
    
}

@property (nonatomic,assign) ViewTyp myViewType;
@end
