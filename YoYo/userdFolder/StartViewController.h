//
//  StartViewController.h
//  YoYo
//
//  Created by nichalos on 15/4/3.
//  Copyright (c) 2015年 yoyo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "PSCollectionView.h"
#import "PullPsCollectionView.h"
typedef enum  {
    enumYanzi = 0,
    enumYo
} dataType;

@interface StartViewController : BaseViewController<PSCollectionViewDelegate,PSCollectionViewDataSource,UIScrollViewDelegate,PullPsCollectionViewDelegate>
@property(nonatomic,strong) PullPsCollectionView *collectionView;
@property(nonatomic,strong) NSMutableArray *items;
-(void)loadDataSource;
@end
