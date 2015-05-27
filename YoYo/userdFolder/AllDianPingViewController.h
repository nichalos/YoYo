//
//  AllDianPingViewController.h
//  YoYo
//
//  Created by xbm524 on 15/5/24.
//  Copyright (c) 2015年 yoyo. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BaseViewController.h"
@interface AllDianPingViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>


@property (nonatomic, strong) NSArray * dataArray;

@end
