//
//  PersonViewController.h
//  YoYo
//
//  Created by nichalos on 15/4/3.
//  Copyright (c) 2015年 yoyo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface PersonViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>



@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) NSDictionary * personalDic;
@property (nonatomic, strong) NSArray * mySetArray;
@property (nonatomic, strong) NSArray * mysetIconArray;

@end
