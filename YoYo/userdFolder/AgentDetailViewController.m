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

#import "FinishInfoViewController.h"


@interface AgentDetailViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>


@end

@implementation AgentDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    title.text = @"经纪人";
    bg.backgroundColor = [UIColor whiteColor];
    rightBtn.frame = CGRectMake(10, 27, 30, 30);
    [rightBtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    rightBtn.tag = 20;
    [rightBtn addTarget:self action:@selector(selectBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView * iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, CGRectGetMaxY(title.frame)+5, 210, 210)];
    iconImageView.contentMode = UIViewContentModeScaleAspectFit;
    iconImageView.backgroundColor = [UIColor clearColor];
    iconImageView.layer.cornerRadius = 6;
    iconImageView.layer.masksToBounds = YES;
    iconImageView.image = [UIImage imageNamed:self.nameStr];
    [self.view addSubview:iconImageView];
    
    UILabel * nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(iconImageView.frame)+25, CGRectGetMinY(iconImageView.frame)+5, self.view.frame.size.width - iconImageView.frame.size.width -20, 20)];
    nameLabel.text = [NSString stringWithFormat:@"经纪人 ：%@",self.nameStr];
    [self.view addSubview:nameLabel];
    
    UILabel * characterLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(nameLabel.frame), CGRectGetMaxY(nameLabel.frame)+15, CGRectGetWidth(nameLabel.frame), 20)];
    characterLabel.text = [NSString stringWithFormat:@"个性 ：热情稳重"];
    [self.view addSubview:characterLabel];
    
    UIButton * contactBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    contactBtn.frame = CGRectMake(CGRectGetMinX(characterLabel.frame)-3, CGRectGetMaxY(iconImageView.frame)-37, 30, 30);
    [contactBtn setImage:[UIImage imageNamed:@"callme"] forState:UIControlStateNormal];
    contactBtn.tag = 21;
    [contactBtn addTarget:self action:@selector(selectBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:contactBtn];
    
    UILabel * contactLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(contactBtn.frame)+5, CGRectGetMinY(contactBtn.frame), 50, 30)];
    contactLabel.text = @"联系我";
    contactLabel.textColor = [UIColor blackColor];
    contactLabel.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:contactLabel];
    
    UIButton * addMeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    addMeBtn.frame = CGRectMake(CGRectGetMaxX(contactLabel.frame), CGRectGetMinY(contactLabel.frame), 30, 30);
    [addMeBtn setImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
    addMeBtn.tag = 22;
    [addMeBtn addTarget:self action:@selector(selectBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addMeBtn];
    
    UILabel * addLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(addMeBtn.frame)+4, CGRectGetMinY(addMeBtn.frame), 50, 30)];
    addLabel.text = @"加关注";
    addLabel.textColor = [UIColor blackColor];
    addLabel.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:addLabel];
    
    
    UIImageView * yirenImage = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMinX(iconImageView.frame)+3, CGRectGetMaxY(iconImageView.frame)+7, 16, 16)];
    yirenImage.image = [UIImage imageNamed:@"pin"];
    [self.view addSubview:yirenImage];
    
    UILabel * belongLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(yirenImage.frame)+3, CGRectGetMaxY(iconImageView.frame), 100, 30)];
    belongLabel.text = @"所带艺人";
    belongLabel.textColor =[UIColor blackColor];
    belongLabel.font = [UIFont systemFontOfSize:14];
    belongLabel.backgroundColor = [UIColor clearColor];
    [self.view addSubview:belongLabel];
    
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.actorCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(belongLabel.frame), self.view.frame.size.width, (self.view.bounds.size.width - 30)/5+30) collectionViewLayout:layout];
    [self.actorCollectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"CELL"];
    self.actorCollectionView.showsHorizontalScrollIndicator = NO;
    self.actorCollectionView.scrollEnabled = YES;
    self.actorCollectionView.delegate = self;
    self.actorCollectionView.dataSource = self;
    self.actorCollectionView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.actorCollectionView];

    self.actorArray = [NSMutableArray array];
    for (int i = 684; i<713; i++) {
        NSString * nameStr = [NSString stringWithFormat:@"IMG_0%d.JPG",i];
        [self.actorArray addObject:nameStr];
    }
    
    UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(12, CGRectGetMaxY(self.actorCollectionView.frame)+24, 4, 4)];
    redView.backgroundColor = [UIColor colorWithRed:255/255.0f green:70/255.0f blue:60/255.0 alpha:1.0f];
    [self.view addSubview:redView];
    
    UIView *redView1 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMinX(redView.frame), CGRectGetMaxY(redView.frame)+20, 4, 4)];
    redView1.backgroundColor = [UIColor colorWithRed:255/255.0f green:70/255.0f blue:60/255.0 alpha:1.0f];
    [self.view addSubview:redView1];
    
    UILabel * info1Label = [[UILabel alloc] initWithFrame:CGRectMake(26, CGRectGetMaxY(self.actorCollectionView.frame)+15, self.view.frame.size.width-20, 20)];
    info1Label.text = @"程一桥参演《河东狮吼2》女儿的拍摄";
    info1Label.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:info1Label];
    
    UILabel * info2Label = [[UILabel alloc] initWithFrame:CGRectMake(26, CGRectGetMaxY(info1Label.frame)+5, self.view.frame.size.width-20, 20)];
    info2Label.text = @"吕平为水星家纺代言";
    info2Label.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:info2Label];
    
    
    UIView *startView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-210, self.view.frame.size.width, 160)];
    
    startView.backgroundColor = [UIColor colorWithRed:233/255.0f green:233/255.0f blue:233/255.0f alpha:1];
    [self.view addSubview:startView];
    
    UIImageView * friendImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 14, 14)];
    friendImage.image = [UIImage imageNamed:@"pin"];
    [startView addSubview:friendImage];
    
    UILabel * friendLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(friendImage.frame)+5, CGRectGetMinY(friendImage.frame), 200, 16)];
    friendLabel.text = @"联系我的星友";
    friendLabel.backgroundColor = [UIColor clearColor];
    friendLabel.font = [UIFont systemFontOfSize:14];
    [startView addSubview:friendLabel];

    UICollectionViewFlowLayout * layout2 = [[UICollectionViewFlowLayout alloc] init];
    layout2.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.friendCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(friendLabel.frame)+10, self.view.frame.size.width, CGRectGetHeight(_actorCollectionView.frame)) collectionViewLayout:layout2];
    [self.friendCollectionView registerClass:[FriendCollectionViewCell class] forCellWithReuseIdentifier:@"CELL"];
    self.friendCollectionView.showsHorizontalScrollIndicator = NO;
    self.friendCollectionView.scrollEnabled = YES;
    self.friendCollectionView.delegate = self;
    self.friendCollectionView.dataSource = self;
    self.friendCollectionView.backgroundColor = [UIColor clearColor];
    [startView addSubview:self.friendCollectionView];
    self.friendArray = [NSMutableArray array];
    for (int i = 684; i<713; i++) {
        NSString * nameStr = [NSString stringWithFormat:@"IMG_0%d.JPG",i];
        [self.friendArray addObject:nameStr];
    }
    
    
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGSize size = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height);
    int weight = (size.width - 30)/5;
    if (collectionView == _friendCollectionView) {
        weight = (size.width -70)/4;
    }
    return CGSizeMake(weight, weight+20);
    
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 5;
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    if (collectionView == _friendCollectionView) {
        return 20;
    }
    return 6;
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 5, 5, 0);
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
        {//联系我
            FinishInfoViewController * finishVC = [[FinishInfoViewController alloc] init];
            finishVC.hidesBottomBarWhenPushed = YES;
            
            NSString *path=[[NSBundle mainBundle] pathForResource:@"MySet" ofType:@"plist"];
            NSArray * indexArray =[NSArray arrayWithContentsOfFile:path];
            NSDictionary * dic = [[indexArray objectAtIndex:0] objectAtIndex:0];
            finishVC.myInfoArray = [dic objectForKey:@"child"];
            [self.navigationController pushViewController:finishVC animated:YES];
        }
            break;
        case 22:
        {//加关注
            
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
