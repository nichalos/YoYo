//
//  ViewController.m
//  YoYo
//
//  Created by Junfeng Bai on 15/2/9.
//  Copyright (c) 2015年 yoyo. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell.h"
#import "MyYoYoViewController.h"
#import "CardView.h"

@interface ViewController (){
    NSArray *array;
    NSArray *labArray;
    int count;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [_myCollectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    count = -1;
    labArray = [NSArray arrayWithObjects:@"欢迎冯绍峰，刘涛，李小冉，郑爽的经纪人加入YOYO娱乐社区⭐️明星",@"欢迎邓超，邓家佳 参加星光YO友活动",@"甄嬛传戏服成功拍卖", nil];
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(changeNotice) userInfo:nil repeats:YES];
    [timer fire];
    
    NSString *path=[[NSBundle mainBundle] pathForResource:@"user" ofType:@"plist"];
    array=[NSArray arrayWithContentsOfFile:path];
    [self initInfoView];
}

- (void)changeNotice{
    count++;
    _noticeLab.text =labArray[count%3];
    if (count == 300) {
        count = 0;
    }
}

- (void)initInfoView{
    CGFloat whidth = _contestBg.frame.size.width;
    CGFloat height = _contestBg.frame.size.height;
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, whidth, height)];
    scrollView.backgroundColor = [UIColor whiteColor];
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    [_contestBg addSubview:scrollView];
    
    UIImageView *home_hot = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, whidth, 130)];
    home_hot.image = [UIImage imageNamed:@"home_hot"];
    [scrollView addSubview:home_hot];
    
    UIImageView *home_start = [[UIImageView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(home_hot.frame)+5, whidth, 149)];
    home_start.image = [UIImage imageNamed:@"home_start"];
    [scrollView addSubview:home_start];
    
    UIView *yoView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(home_start.frame)+5, whidth, 270)];
    yoView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    yoView.layer.borderWidth = 1;
    yoView.layer.cornerRadius = 3;
    yoView.layer.masksToBounds = YES;
    [scrollView addSubview:yoView];
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, whidth, 30)];
    title.textColor = [UIColor darkGrayColor];
    title.font = [UIFont systemFontOfSize:16];
    title.text = @"YO友鲜值推荐";
    title.textAlignment = NSTextAlignmentLeft;
    title.backgroundColor = [UIColor clearColor];
    [yoView addSubview:title];
    
    CardView *cardView = [[CardView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(title.frame)+5, whidth/2, 60) isLineTow:YES];
    cardView.icon.image =  [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",array[30]]];
    cardView.name.text = @"冰冰 rose";
    cardView.info.text = @"每一天都像春天的气息，发芽成长。";
    cardView.count.text = @"品鲜数：3560";
    [yoView addSubview:cardView];
    
    CardView *cardView1 = [[CardView alloc] initWithFrame:CGRectMake(whidth/2+10, CGRectGetMinY(cardView.frame), whidth/2, CGRectGetHeight(cardView.frame)) isLineTow:YES];
    cardView1.icon.image =  [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",array[31]]];
    cardView1.name.text = @"晴雨 Andy";
    cardView1.info.text = @"我喜欢硕果磊磊的采摘季。";
    cardView1.count.text = @"品鲜数：650";
    [yoView addSubview:cardView1];
    
    CardView *cardView2 = [[CardView alloc] initWithFrame:CGRectMake(CGRectGetMinX(cardView.frame), CGRectGetMaxY(cardView.frame)+20, CGRectGetWidth(cardView.frame)-10, CGRectGetHeight(cardView.frame)) isLineTow:NO];
    cardView2.icon.image =  [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",array[32]]];
    cardView2.name.text = @"易欣 solly";
    cardView2.info.text = @"选择我的惊喜。";
    cardView2.count.text = @"品鲜数：620";
    [yoView addSubview:cardView2];
    
    CardView *cardView3 = [[CardView alloc] initWithFrame:CGRectMake(CGRectGetMinX(cardView1.frame), CGRectGetMinY(cardView2.frame), CGRectGetWidth(cardView.frame)-10, CGRectGetHeight(cardView.frame)) isLineTow:NO];
    cardView3.icon.image =  [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",array[33]]];
    cardView3.name.text = @"jamie";
    cardView3.info.text = @"阳光中的向日葵。";
    cardView3.count.text = @"品鲜数：612";
    [yoView addSubview:cardView3];
    
    CardView *cardView4 = [[CardView alloc] initWithFrame:CGRectMake(CGRectGetMinX(cardView.frame), CGRectGetMaxY(cardView3.frame)+20, CGRectGetWidth(cardView.frame)-10, CGRectGetHeight(cardView.frame)) isLineTow:NO];
    cardView4.icon.image =  [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",array[34]]];
    cardView4.name.text = @"慧慧";
    cardView4.info.text = @"一滴水。";
    cardView4.count.text = @"品鲜数：650";
    [yoView addSubview:cardView4];
    
    CardView *cardView5 = [[CardView alloc] initWithFrame:CGRectMake(CGRectGetMinX(cardView3.frame), CGRectGetMinY(cardView4.frame), CGRectGetWidth(cardView.frame)-10, CGRectGetHeight(cardView.frame)) isLineTow:NO];
    cardView5.icon.image =  [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",array[35]]];
    cardView5.name.text = @"邓家佳";
    cardView5.info.text = @"我就是我。";
    cardView5.count.text = @"品鲜数：650";
    [yoView addSubview:cardView5];
    
    
    UILabel *title4 = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(yoView.frame), 80, 30)];
    title4.textColor = [UIColor darkGrayColor];
    title4.font = [UIFont systemFontOfSize:14];
    title4.text = @"活跃用户";
    title4.textAlignment = NSTextAlignmentLeft;
    title4.backgroundColor = [UIColor clearColor];
    [scrollView addSubview:title4];
    
    UILabel *title5 = [[UILabel alloc] initWithFrame:CGRectMake(80, CGRectGetMaxY(yoView.frame)+5, 250, 20)];
    title5.textColor = [UIColor grayColor];
    title5.font = [UIFont systemFontOfSize:10];
    title5.text = @"(登上活跃用户榜，更容易让专业人士发现你哦 :))";
    title5.textAlignment = NSTextAlignmentLeft;
    title5.backgroundColor = [UIColor clearColor];
    [scrollView addSubview:title5];
    
    
    for (int i=0 ; i<5; i++) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(6+i*80, CGRectGetMaxY(title5.frame)+5, 80, 80)];
        view.backgroundColor = [UIColor clearColor];
        
        UIImageView* _icon = [[UIImageView alloc] initWithFrame:CGRectMake(3, 0, 74, 74)];
        _icon.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",array[40+i]]];
        _icon.backgroundColor = [UIColor clearColor];
        _icon.layer.cornerRadius = 74/2;
        _icon.layer.masksToBounds = YES;
        [view addSubview:_icon];
        
        UILabel *name = [[UILabel alloc] initWithFrame:CGRectMake(0, 80, 80, 20)];
        name.textAlignment = NSTextAlignmentCenter;
        name.textColor = [UIColor grayColor];
        name.text = array[40+i];
        name.font = [UIFont systemFontOfSize:10];
        [view addSubview: name];
        
        UILabel *info = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(name.frame), CGRectGetMaxY(name.frame)+10, 80, 15)];
        info.textAlignment = NSTextAlignmentCenter;
        info.font = [UIFont systemFontOfSize:12];
        info.text = @"每日登陆";
        info.textColor = [UIColor darkGrayColor];
        [view addSubview:info];
        [scrollView addSubview:view];
    }
    
    [scrollView setContentSize:CGSizeMake(0, CGRectGetMaxY(yoView.frame)+190)];

}

#pragma mark -- UICollectionViewDataSource

//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}

//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    static NSString * CellIdentifier = @"UICollectionViewCell";
    CollectionViewCell * cell = (CollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[CollectionViewCell alloc] initWithFrame:CGRectMake(0, 0, 80, 90)];
        cell.backgroundColor = [UIColor redColor];
    }
    NSString *name = array[indexPath.row];
    [cell setImageNmae:[NSString stringWithFormat:@"%@.jpg",name] setName:name];
    return cell;
}


#pragma mark --UICollectionViewDelegateFlowLayout

//定义每个Item 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(80, 90);
}

//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0,0,10,5);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 2.0;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 2.0;
}

#pragma mark --UICollectionViewDelegate

//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell * cell = (UICollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    //临时改变个颜色，看好，只是临时改变的。如果要永久改变，可以先改数据源，然后在cellForItemAtIndexPath中控制。（和UITableView差不多吧！O(∩_∩)O~）
    cell.backgroundColor = [UIColor greenColor];

}

//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
