//
//  AgentDetailViewController.h
//  YoYo
//
//  Created by 夏宝梦 on 15/5/20.
//  Copyright (c) 2015年 yoyo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface AgentDetailViewController : BaseViewController


@property (nonatomic, strong) NSString * nameStr;

 
@property (nonatomic, strong) UICollectionView * actorCollectionView;
@property (nonatomic, strong) UICollectionView * friendCollectionView;
@property (nonatomic, strong) NSMutableArray * actorArray;
@property (nonatomic, strong) NSMutableArray * friendArray;




@end
