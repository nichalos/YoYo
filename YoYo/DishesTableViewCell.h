//
//  DishesTableViewCell.h
//  Smile
//
//  Created by lyy on 15/4/3.
//  Copyright (c) 2015年 laoyingying. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DishesTableViewCell : UITableViewCell

@property(nonatomic,strong)UIImageView *imge;     //头像
@property(nonatomic,strong)UILabel *name;         //昵称
@property(nonatomic,strong)UILabel *breif;        //简介
@property(nonatomic,strong)UILabel *address;      //归属地

@end
