//
//  CellView.h
//  PSCollectionViewDemo
//
//  Created by Eric on 12-6-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "PSCollectionViewCell.h"

@interface CellView : PSCollectionViewCell
@property (retain, nonatomic) IBOutlet UIImageView *picView;
@property (retain, nonatomic) IBOutlet UILabel *name;
@property (retain, nonatomic) IBOutlet UILabel *info;
@property (retain, nonatomic) IBOutlet UILabel *count;
@property (retain, nonatomic) IBOutlet UIView *cont;
@property (weak, nonatomic) IBOutlet UIButton *zan;
@end
