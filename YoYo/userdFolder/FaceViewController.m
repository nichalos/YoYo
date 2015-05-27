//
//  FaceViewController.m
//  YoYo
//
//  Created by nichalos on 15/4/30.
//  Copyright (c) 2015年 yoyo. All rights reserved.
//

#import "FaceViewController.h"
#import "WuxianViewController.h"
#import "AgentCollectionViewCell.h"
#import "AgentDetailViewController.h"

#import "NetWorkSingleton.h"


@interface FaceViewController ()<UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>

{
    
}

@end

@implementation FaceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    title.text = @"经纪人";
    rightBtn.hidden = YES;
    
    
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    self.mainCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-114) collectionViewLayout:layout];
    [self.mainCollectionView registerClass:[AgentCollectionViewCell class] forCellWithReuseIdentifier:@"CELL"];
    self.mainCollectionView.delegate = self;
    self.mainCollectionView.dataSource = self;
    self.mainCollectionView.backgroundColor = [UIColor colorWithRed:232.0/255.0f green:232.0/255.0f blue:232.0/255.0f alpha:1];
    self.mainCollectionView.scrollEnabled = YES;
    self.mainCollectionView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.mainCollectionView];
    [self loaddata];
    
}
- (void)loaddata
{
    self.imageArray = [NSMutableArray array];
    for (int i = 684; i<783; i++) {
        NSString * nameStr = [NSString stringWithFormat:@"IMG_0%d.JPG",i];
        [self.imageArray addObject:nameStr];
    }
    
//    __block typeof(self) selfs = self;
//    dispatch_async( dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0 ), ^(void){
//        NSDictionary * allDatasDic = [[NetWorkSingleton sharedNetWork] getAgentDataWith:nil];
//        dispatch_async( dispatch_get_main_queue(), ^(void){
//            if(allDatasDic){
//                //顶部广告区
//                selfs.imageArray  = [allDatasDic objectForKey:@""];
//                if (selfs.imageArray.count >0) {
//                    [self.mainCollectionView reloadData];
//                }
//            }
//        });
//    });
 
}


-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGSize size = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height);
    int weight = (size.width - 50)/4;
    return CGSizeMake(weight, weight);
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 5;
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.imageArray.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellIndentifier = @"CELL";
    AgentCollectionViewCell * cell = (AgentCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIndentifier forIndexPath:indexPath];
    
    NSString * imageName = [self.imageArray objectAtIndex:indexPath.row];
    cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
    cell.imageView.image = [UIImage imageNamed:imageName];
    
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
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSString * nameStr = [self.imageArray objectAtIndex:indexPath.row];
    
    AgentDetailViewController * temp = [[AgentDetailViewController alloc] init];
    temp.nameStr = nameStr;
//    temp.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:temp animated:YES];
}


-(void)iconAction:(UIButton *)button{
    WuxianViewController *temp = [[WuxianViewController alloc] init];
    temp.hidesBottomBarWhenPushed = YES;
    temp.infoType = 1;
    [self.navigationController pushViewController:temp animated:YES];
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
