//
//  DishesTableViewCell.m
//  Smile
//
//  Created by lyy on 15/4/3.
//  Copyright (c) 2015年 laoyingying. All rights reserved.
//

#import "DishesTableViewCell.h"

@implementation DishesTableViewCell

@synthesize imge;
@synthesize name;
@synthesize breif;
@synthesize address;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
   
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
    
        self.contentView.backgroundColor = [UIColor clearColor];
        
        UIImageView *bg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 414, 100)];
        bg.image = [UIImage imageNamed:@"pzc_bg"];
        [self.contentView addSubview:bg];
        
        self.imge = [[UIImageView alloc] initWithFrame:CGRectMake(20, 10, 80, 80)];
        self.imge.layer.masksToBounds = YES;
        self.imge.backgroundColor = [UIColor clearColor];
        self.imge.layer.cornerRadius = 40;
        [self.contentView addSubview:self.imge];
        
        self.name = [[UILabel alloc] initWithFrame:CGRectMake(110, 15, self.contentView.frame.size.width - 100, 20)];
        self.name.backgroundColor = [UIColor clearColor];
        self.name.font = [UIFont systemFontOfSize:20];
        self.name.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:self.name];
        
        self.breif = [[UILabel alloc] initWithFrame:CGRectMake(110, 40, self.contentView.frame.size.width - 100, 20)];
        self.breif.backgroundColor = [UIColor clearColor];
        self.breif.font = [UIFont systemFontOfSize:16];
        self.breif.textAlignment = NSTextAlignmentLeft;
        self.breif.numberOfLines = 0;
        self.breif.lineBreakMode = NSLineBreakByWordWrapping;
        
        [self.contentView addSubview:self.breif];
        
        self.address = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.breif.frame) + 35, 80, 35, 20)];
        self.address.backgroundColor = [UIColor clearColor];
        self.address.font = [UIFont systemFontOfSize:13];
        self.address.textAlignment = NSTextAlignmentCenter;
        
        [self.contentView addSubview:self.address];
        
    }
    return self;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
