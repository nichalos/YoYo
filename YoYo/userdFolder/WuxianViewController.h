//
//  WuxianViewController.h
//  YoYo
//
//  Created by nichalos on 15/4/11.
//  Copyright (c) 2015年 yoyo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface WuxianViewController : BaseViewController


@property (nonatomic,assign) int infoType;

@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) NSString * name;


@property(nonatomic, strong) NSMutableArray *items;
@property(nonatomic, strong) NSMutableArray *briefArray;
@property(nonatomic, strong) NSMutableArray *imageArray;


@end
