//
//  AgentDetailViewController.m
//  YoYo
//
//  Created by 夏宝梦 on 15/5/20.
//  Copyright (c) 2015年 yoyo. All rights reserved.
//

#import "AgentDetailViewController.h"

#import "CollectionViewCell.h"
#import "FriendCollectionViewCell.h"
#import "WuxianViewController.h"


@interface AgentDetailViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>


@end

@implementation AgentDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    title.text = @"经纪人";
    rightBtn.frame = CGRectMake(10, 27, 30, 30);
    [rightBtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    rightBtn.tag = 20;
    [rightBtn addTarget:self action:@selector(selectBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView * iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(title.frame)+10, (self.view.frame.size.width-20)/2, 120)];
    iconImageView.contentMode = UIViewContentModeScaleAspectFit;
    iconImageView.image = [UIImage imageNamed:self.nameStr];
    [self.view addSubview:iconImageView];
    
    UILabel * nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(iconImageView.frame), CGRectGetMinY(iconImageView.frame), self.view.frame.size.width - iconImageView.frame.size.width -20, 20)];
    nameLabel.text = [NSString stringWithFormat:@"经纪人:%@",self.nameStr];
    [self.view addSubview:nameLabel];
    
    UILabel * characterLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(nameLabel.frame), CGRectGetMaxY(nameLabel.frame)+5, CGRectGetWidth(nameLabel.frame), 20)];
    characterLabel.text = [NSString stringWithFormat:@"个性:%@",self.nameStr];
    [self.view addSubview:characterLabel];
    
    UIButton * contactBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    contactBtn.frame = CGRectMake(CGRectGetMinX(characterLabel.frame), CGRectGetMaxY(iconImageView.frame)-30, 30, 30);
    [contactBtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    contactBtn.tag = 21;
    [contactBtn addTarget:self action:@selector(selectBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:contactBtn];
    
    UILabel * contactLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(contactBtn.frame), CGRectGetMinY(contactBtn.frame), 80, 30)];
    contactLabel.text = @"联系我";
    [self.view addSubview:contactLabel];
    
    UILabel * belongLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(iconImageView.frame), CGRectGetMaxY(iconImageView.frame)+5, 100, 30)];
    belongLabel.text = @"所属艺人";
    [self.view addSubview:belongLabel];
    
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.actorCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(belongLabel.frame), self.view.frame.size.width-20, 95) collectionViewLayout:layout];
    [self.actorCollectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"CELL"];
    self.actorCollectionView.showsHorizontalScrollIndicator = NO;
    self.actorCollectionView.scrollEnabled = YES;
    self.actorCollectionView.delegate = self;
    self.actorCollectionView.dataSource = self;
    self.actorCollectionView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.actorCollectionView];

    self.actorArray = [NSMutableArray array];
    for (int i = 684; i<713; i++) {
        NSString * nameStr = [NSString stringWithFormat:@"IMG_0%d.jpg",i];
        [self.actorArray addObject:nameStr];
    }
    
    UILabel * info1Label = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(self.actorCollectionView.frame)+20, self.view.frame.size.width-20, 20)];
    info1Label.text = @"*程一参与《河东狮吼2》女儿的虐心";
    info1Label.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:info1Label];
    
    UILabel * info2Label = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(info1Label.frame), self.view.frame.size.width-20, 20)];
    info2Label.text = @"*晋平为水星家纺的代言";
    info2Label.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:info2Label];
    
    
    
    UICollectionViewFlowLayout * layout2 = [[UICollectionViewFlowLayout alloc] init];
    layout2.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.friendCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(10, self.view.frame.size.height -((self.view.frame.size.width-25)/4 +70), self.view.frame.size.width-20, 95) collectionViewLayout:layout2];
    [self.friendCollectionView registerClass:[FriendCollectionViewCell class] forCellWithReuseIdentifier:@"CELL"];
    self.friendCollectionView.showsHorizontalScrollIndicator = NO;
    self.friendCollectionView.scrollEnabled = YES;
    self.friendCollectionView.delegate = self;
    self.friendCollectionView.dataSource = self;
    self.friendCollectionView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.friendCollectionView];
    self.friendArray = [NSMutableArray array];
    for (int i = 684; i<713; i++) {
        NSString * nameStr = [NSString stringWithFormat:@"IMG_0%d.jpg",i];
        [self.friendArray addObject:nameStr];
    }
    
    UILabel * friendLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMinY(self.friendCollectionView.frame)-40, self.view.frame.size.width-20, 40)];
    friendLabel.text = @"*联系我的星友";
    friendLabel.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:friendLabel];
    
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGSize size = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height);
    int weight = (size.width - 10)/5;
    if (collectionView == self.actorCollectionView) {
        return CGSizeMake(weight, weight+20);
    }else{
        return CGSizeMake((size.width-25)/4, (size.width-25)/4);
    }
    
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 5, 0);
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (collectionView == self.actorCollectionView) {
        return self.actorArray.count;
    }else{
        return self.friendArray.count;
    }
    
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (collectionView == self.actorCollectionView) {
        static NSString * cellIndentifier = @"CELL";
        CollectionViewCell * cell = (CollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIndentifier forIndexPath:indexPath];
        
        NSString * imageName = [self.actorArray objectAtIndex:indexPath.row];
        [cell setImageNmae:imageName setName:imageName];
        return cell;
    }else{
        static NSString * cellIndentifier = @"CELL";
        FriendCollectionViewCell * cell = (FriendCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIndentifier forIndexPath:indexPath];
        NSString * imageName = [self.friendArray objectAtIndex:indexPath.row];
        [cell setImageNmae:imageName setName:imageName];
        return cell;
    }
    
    
//    cell.backgroundColor = [UIColor yellowColor];
    
    
}
#pragma mark <UICollectionViewDelegate>
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    WuxianViewController * tempVC = [[WuxianViewController alloc] init];
    tempVC.name = [self.actorArray objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:tempVC animated:YES];
}



-(void)selectBtnClicked:(UIButton *)sender{
    switch (sender.tag) {
        case 20:
        {
            [self.navigationController popViewControllerAnimated:YES];
        }
            break;
        case 21:
        {
            
        }
            break;
            
        default:
            break;
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
