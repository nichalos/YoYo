//
//  StarWishViewController.h
//  YoYo
//
//  Created by 夏宝梦 on 15/5/25.
//  Copyright (c) 2015年 yoyo. All rights reserved.
//

#import "BaseViewController.h"

@interface StarWishViewController : BaseViewController<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>



@property (nonatomic, strong) UICollectionView * collectionView;

@end
