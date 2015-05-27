//
//  ActivityViewController.h
//  YoYo
//
//  Created by Junfeng Bai on 15/2/9.
//  Copyright (c) 2015年 yoyo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "DetailTableViewCell.h"

@interface ActivityViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate,imageClickedDelegate>


@property (nonatomic, strong) UITableView * tableView;
@property(nonatomic, strong) NSMutableArray *items;
@property(nonatomic, strong) NSMutableArray *imageArray;

@end
