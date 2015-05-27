//
//  StarWishViewController.m
//  YoYo
//
//  Created by 夏宝梦 on 15/5/25.
//  Copyright (c) 2015年 yoyo. All rights reserved.
//

#import "StarWishViewController.h"

@interface StarWishViewController ()

@end

@implementation StarWishViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    title.text = @"明星祝福";
    
    rightBtn.frame = CGRectMake(20, 30, 30, 30);
    [rightBtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    rightBtn.tag = 10;
    [rightBtn addTarget:self action:@selector(selectView:) forControlEvents:UIControlEventTouchUpInside];

    UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 70, self.view.frame.size.width, 50)];
    label1.text = @"恭祝";
    label1.font = [UIFont systemFontOfSize:19];
    label1.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label1];
    
    UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(label1.frame), self.view.frame.size.width, 30)];
    label2.text = @"星光优友";
    label2.font = [UIFont systemFontOfSize:16];
    label2.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label2];
    
    UILabel * label3 = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(label2.frame), self.view.frame.size.width, 30)];
    label3.text = @"星光熠熠，前途无量";
    label3.font = [UIFont fontWithName:@"Zapfino" size:18];
    label3.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label3];
    
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
    self.collectionView= [[UICollectionView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(label3.frame), self.view.frame.size.width, self.view.frame.size.height - CGRectGetMaxY(label3.frame)) collectionViewLayout:layout];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.scrollEnabled = YES;
    [self.view addSubview:self.collectionView];

}

#pragma mark --UICollectionViewDelegateFlowLayout
//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat width = (self.view.frame.size.width -20)/3;
    return CGSizeMake(width, width);
}
//定义每个UICollectionView Cell水平之间的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 5;
}
//定义每个UICollectionView Cell垂直之间的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 5;
}
//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(5, 5, 5, 5);
}
#pragma mark <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * CellIdentifier = @"Cell";
    UICollectionViewCell * cell = (UICollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor blueColor];
    return cell;
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
//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
}

-(void)selectView:(UIButton *)button{
    switch (button.tag) {
        case 10:{
            
        }
            break;
        case 11:
        {
            [self.navigationController popViewControllerAnimated:YES];
        }
        case 2:
        case 3:
        case 4:
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
