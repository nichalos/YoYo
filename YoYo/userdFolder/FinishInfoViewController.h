//
//  FinishInfoViewController.h
//  YoYo
//
//  Created by 夏宝梦 on 15/5/25.
//  Copyright (c) 2015年 yoyo. All rights reserved.
//

#import "BaseViewController.h"

@interface FinishInfoViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>


@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) NSArray * myInfoArray;


@end
