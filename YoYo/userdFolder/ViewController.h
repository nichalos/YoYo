//
//  ViewController.h
//  YoYo
//
//  Created by Junfeng Bai on 15/2/9.
//  Copyright (c) 2015年 yoyo. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>


@property (nonatomic,weak) IBOutlet UICollectionView *myCollectionView;
@property (nonatomic,weak) IBOutlet UIImageView *contestBg;
@property (nonatomic,weak) IBOutlet UILabel *noticeLab;
@end

