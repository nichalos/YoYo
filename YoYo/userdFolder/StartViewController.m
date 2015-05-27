//
//  StartViewController.m
//  YoYo
//
//  Created by nichalos on 15/4/3.
//  Copyright (c) 2015年 yoyo. All rights reserved.
//

#import "StartViewController.h"
#import "PSCollectionViewCell.h"
#import "CellView.h"
#import "MyYoYoViewController.h"
#import "WuxianViewController.h"
#import "loginViewController.h"
@interface StartViewController (){

    UIButton *leftBtn;
    dataType myDataType;
}

@end

@implementation StartViewController
@synthesize collectionView;
@synthesize items;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(self.view.frame.size.width/2-80, 30, 70, 40);
    [leftBtn addTarget:self action:@selector(SelectionBtn:) forControlEvents:UIControlEventTouchUpInside];
    [leftBtn setTitle:@"演员" forState:UIControlStateNormal];
    leftBtn.titleLabel.font = [UIFont boldSystemFontOfSize:24];
    leftBtn.layer.masksToBounds = YES;
    leftBtn.layer.cornerRadius = 6;
    [leftBtn setBackgroundColor:BASE_COLOR];
    [leftBtn setSelected:YES];
    [self.view addSubview:leftBtn];
    
    title.hidden = YES;
    
    rightBtn.frame = CGRectMake(self.view.frame.size.width/2+10, 30, 70, 40);
    rightBtn.tag = 1;
    [rightBtn addTarget:self action:@selector(SelectionBtn:) forControlEvents:UIControlEventTouchUpInside];
    [rightBtn setTitle:@"星友" forState:UIControlStateNormal];
    [rightBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    rightBtn.titleLabel.font = [UIFont boldSystemFontOfSize:24];
    rightBtn.layer.masksToBounds = YES;
    rightBtn.layer.cornerRadius = 6;
    [rightBtn setBackgroundColor:[UIColor clearColor]];
    myDataType = enumYanzi;
    

    self.items = [NSMutableArray array];
    collectionView = [[PullPsCollectionView alloc] initWithFrame:CGRectMake(0, 80, self.view.frame.size.width, self.view.frame.size.height-130)];
    [self.view addSubview:collectionView];
    collectionView.collectionViewDelegate = self;
    collectionView.collectionViewDataSource = self;
    collectionView.pullDelegate=self;
    collectionView.backgroundColor = [UIColor colorWithRed:233.0/255.0 green:233.0/255.0 blue:233.0/255.0 alpha:1];
    collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    
    collectionView.numColsPortrait = 2;
    collectionView.numColsLandscape = 3;
    
    collectionView.pullArrowImage = [UIImage imageNamed:@"blackArrow"];
    collectionView.pullBackgroundColor = [UIColor clearColor];
    collectionView.pullTextColor = [UIColor blackColor];
    UILabel *loadingLabel = [[UILabel alloc] initWithFrame:self.collectionView.bounds];
    loadingLabel.text = @"加载中...";
    loadingLabel.textAlignment = NSTextAlignmentCenter;
    collectionView.loadingView = loadingLabel;
    
    if(!collectionView.pullTableIsRefreshing) {
        collectionView.pullTableIsRefreshing = YES;
        [self performSelector:@selector(refreshTable) withObject:nil afterDelay:0];
    }
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)SelectionBtn:(UIButton*)button{
    [button setSelected:!button.selected];
    [button setBackgroundColor:BASE_COLOR];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    switch (button.tag) {
        case 0:
        {
            myDataType = enumYanzi;
            [rightBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [rightBtn setBackgroundColor:[UIColor clearColor]];
        }
            
            break;
        case 1:
        {
            myDataType = enumYo;
            [leftBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [leftBtn setBackgroundColor:[UIColor clearColor]];
        }
            
            break;
        default:
            break;
    }
    if(!collectionView.pullTableIsRefreshing) {
        collectionView.pullTableIsRefreshing = YES;
        [self performSelector:@selector(refreshTable) withObject:nil afterDelay:1];
    }
}
- (void) refreshTable
{
    /*
     
     Code to actually refresh goes here.
     
     */
    
    [self.items removeAllObjects];
    [self loadDataSource];
    self.collectionView.pullLastRefreshDate = [NSDate date];
    self.collectionView.pullTableIsRefreshing = NO;
//    [self.collectionView reloadData];
}

- (void) loadMoreDataToTable
{
    /*
     
     Code to actually load more data goes here.
     
     */
    //    [self loadDataSource];
    [self.items addObjectsFromArray:self.items];
    [self.collectionView reloadData];
    self.collectionView.pullTableIsLoadingMore = NO;
}
#pragma mark - PullTableViewDelegate

- (void)pullPsCollectionViewDidTriggerRefresh:(PullPsCollectionView *)pullTableView
{
    [self performSelector:@selector(refreshTable) withObject:nil afterDelay:3.0f];
}

- (void)pullPsCollectionViewDidTriggerLoadMore:(PullPsCollectionView *)pullTableView
{
    [self performSelector:@selector(loadMoreDataToTable) withObject:nil afterDelay:3.0f];
}
- (void)viewDidUnload
{
    [self setCollectionView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}
- (PSCollectionViewCell *)collectionView:(PSCollectionView *)collectionView viewAtIndex:(NSInteger)index {
    // You should probably subclass PSCollectionViewCell
    CellView *v = (CellView *)[self.collectionView dequeueReusableView];
    //    if (!v) {
    //        v = [[[PSCollectionViewCell alloc] initWithFrame:CGRectZero] autorelease];
    //    }
    if(v == nil) {
        NSArray *nib =
        [[NSBundle mainBundle] loadNibNamed:@"CellView" owner:self options:nil];
        v = [nib objectAtIndex:0];
        v.layer.cornerRadius = 6;
        v.layer.masksToBounds = YES;
//        v.backgroundColor = [UIColor blackColor];
    }
    NSDictionary *item = [self.items objectAtIndex:index];
    v.object = item;
    [v.picView setImage:[UIImage imageNamed:[item objectForKey:@"name"]]];
    v.name.text = [item objectForKey:@"name"];
    v.info.text = @"“你不需要多好，我喜欢就好！”❤️";
    v.count.text = @"20";
    return v;
}

- (CGFloat)heightForViewAtIndex:(NSInteger)index {
    NSDictionary *item = [self.items objectAtIndex:index];
    
    // You should probably subclass PSCollectionViewCell
    return [PSCollectionViewCell heightForViewWithObject:item inColumnWidth:self.collectionView.colWidth];
}

- (void)collectionView:(PSCollectionView *)collectionView didSelectView:(PSCollectionViewCell *)view atIndex:(NSInteger)index {
    WuxianViewController *temp = [[WuxianViewController alloc] init];
    temp.hidesBottomBarWhenPushed = YES;
    temp.name = [[self.items objectAtIndex:index] objectForKey:@"name"];
    temp.infoType = 2;
    [self.navigationController pushViewController:temp animated:YES];
}

- (NSInteger)numberOfViewsInCollectionView:(PSCollectionView *)collectionView {
    return [self.items count];
}




- (void)loadDataSource {
    
    NSString *path=[[NSBundle mainBundle] pathForResource:@"start" ofType:@"plist"];
    self.items =[NSMutableArray arrayWithContentsOfFile:path];
    if (myDataType == enumYo) {
        for (int i = 0; i< 20 ; i++) {
            [self.items exchangeObjectAtIndex:i withObjectAtIndex:items.count-1-i];
        }
    }
    [self dataSourceDidLoad];
}

- (void)dataSourceDidLoad {
    [self.collectionView reloadData];
}

- (void)dataSourceDidError {
    [self.collectionView reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)huoDongAction:(UIButton *)button{
    MyYoYoViewController *mainViewController=[[MyYoYoViewController alloc] init];
    mainViewController.myViewType = enumHd;
    mainViewController.view.backgroundColor=[UIColor whiteColor];
    
    [self.navigationController pushViewController:mainViewController animated:YES];

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
