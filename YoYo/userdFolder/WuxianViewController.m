//
//  WuxianViewController.m
//  YoYo
//
//  Created by nichalos on 15/4/11.
//  Copyright (c) 2015年 yoyo. All rights reserved.
//

#import "WuxianViewController.h"
#import "WuxianYinShiViewController.h"
#import "PushPhotoViewController.h"

#import "DetailTableViewCell.h"

@interface WuxianViewController ()<UITableViewDataSource,UITableViewDelegate>


@end

@implementation WuxianViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
   
//    UIView *view = [[UIView alloc] initWithFrame:self.view.bounds];
//    [self.view addSubview:view];
//    UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, -20, view.frame.size.width, view.frame.size.height)];
//    scroll.backgroundColor = [UIColor clearColor];
//    scroll.showsHorizontalScrollIndicator = NO;
//    scroll.showsVerticalScrollIndicator = NO;
//    [scroll setContentSize:CGSizeMake(0, 1667)];
    
//    NSString *name = @"";
//    if (_infoType == 0) {
//        name = @"个人相册";
//    }else if(_infoType == 1){
//        name = @"经纪人";
//    }else{
//        name = @"个人详情";
//    }
    
//    UIImageView *bg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, scroll.frame.size.width, 1667)];
//    bg.image = [UIImage imageNamed:name];
//    bg.contentMode = UIViewContentModeTopLeft;
//    bg.userInteractionEnabled = YES;
//    bg.backgroundColor = [UIColor clearColor];
//
//    
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//    button.frame = CGRectMake(360, 90, 45, 45);
//    button.backgroundColor = [UIColor clearColor];
//    button.tag = 1;
//    if (_infoType == 0) {
//        [button addTarget:self action:@selector(SelectionBtn:) forControlEvents:UIControlEventTouchUpInside];
//    }
//    [bg addSubview:button];
    
//    UIButton *start = [UIButton buttonWithType:UIButtonTypeCustom];
//    start.frame = CGRectMake(10, 24, 45, 45);
//    start.backgroundColor = [UIColor clearColor];
//    [start addTarget:self action:@selector(SelectionBtn:) forControlEvents:UIControlEventTouchUpInside];
//    start.tag = 0;
//    [self.view addSubview:start];
    
    
    
//    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
//    button1.frame = CGRectMake(0, 1090, scroll.frame.size.width, 60);
//    button1.backgroundColor = [UIColor clearColor];
//    button1.tag = 2;
//    [button1 addTarget:self action:@selector(SelectionBtn:) forControlEvents:UIControlEventTouchUpInside];
//    [bg addSubview:button1];
//    
//    [scroll addSubview:bg];
    
//    [view addSubview:scroll];

    title.text = @"黄一慧";
    rightBtn.frame = CGRectMake(10, 27, 30, 30);
    [rightBtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    rightBtn.tag = 10;
    [rightBtn addTarget:self action:@selector(SelectionBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    UIView * headView = [[UIView alloc] initWithFrame:CGRectMake(0, 80, self.view.frame.size.width, 500)];
    
    UIImageView * iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 0, 60, 60)];
    iconImageView.image = [UIImage imageNamed:self.name];
    iconImageView.contentMode = UIViewContentModeScaleAspectFit;
    iconImageView.layer.cornerRadius = 30;
    iconImageView.clipsToBounds = YES;
    [headView addSubview:iconImageView];
    
    UILabel * positionLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(iconImageView.frame)+2, CGRectGetMinY(iconImageView.frame)+20, 80, 30)];
    positionLabel.text = @"职业:演员";
    positionLabel.font = [UIFont systemFontOfSize:16];
    positionLabel.textAlignment = NSTextAlignmentLeft;
    [headView addSubview:positionLabel];
    
    UILabel * localLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width -200, CGRectGetMaxY(iconImageView.frame)-30, 190, 30)];
    localLabel.text = @"所在地:北京";
    localLabel.font = [UIFont systemFontOfSize:16];
    localLabel.textAlignment = NSTextAlignmentRight;
    [headView addSubview:localLabel];
    
    UIImageView * photo1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(localLabel.frame)+5, self.view.frame.size.width/2, (headView.frame.size.height-iconImageView.frame.size.height)/2) ];
    photo1.image = [UIImage imageNamed:self.name];
    photo1.contentMode = UIViewContentModeScaleAspectFill;
    photo1.clipsToBounds = YES;
    [headView addSubview:photo1];
    
    UIImageView *photo2 = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(photo1.frame), CGRectGetMinY(photo1.frame), CGRectGetWidth(photo1.frame), CGRectGetHeight(photo1.frame))];
    photo2.image = [UIImage imageNamed:self.name];
    photo2.contentMode = UIViewContentModeScaleAspectFill;
    photo2.clipsToBounds = YES;
    [headView addSubview:photo2];
    
    UIImageView *photo3 = [[UIImageView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(photo1.frame), self.view.frame.size.width, CGRectGetHeight(photo1.frame))];
    photo3.image = [UIImage imageNamed:self.name];
    photo3.contentMode = UIViewContentModeScaleAspectFill;
    photo3.clipsToBounds = YES;
    [headView addSubview:photo3];
    
    
    
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 90, self.view.frame.size.width, self.view.frame.size.height-90) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
//    self.tableView.separatorColor = [UIColor redColor];
//    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.view addSubview:self.tableView];
    self.items = [NSMutableArray array];
    [self loadData];
    
    [self.tableView setTableHeaderView:headView];

}

-(void)loadData{
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSString *path=[[NSBundle mainBundle] pathForResource:@"start" ofType:@"plist"];
        self.imageArray =[NSMutableArray arrayWithContentsOfFile:path];
        NSString * brief = @"平静的自己有颗平常的心，看惯平淡的人世，过好平安的日子。平静的自己有颗平常的心，看惯平淡的人世，过好平安的日子。平静的自己有颗平常的心，看惯平淡的人世，过好平安的日子。平静的自己有颗平常的心，看惯平淡的人世，过好平安的日子。";
        for (int i=0; i<self.imageArray.count; i++) {
            NSMutableDictionary * temDic = [self.imageArray objectAtIndex:i];
            [temDic setObject:brief forKey:@"brief"];
            [self.items addObject:temDic];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });

    });
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
     return [self.items count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary * item = [self.items objectAtIndex:indexPath.row];
    return [DetailTableViewCell heightForViewWithObject:item inColumnWidth:self.tableView.frame.size.width];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * indentifier = @"cell";
    DetailTableViewCell *cell = (DetailTableViewCell *)[tableView dequeueReusableCellWithIdentifier:indentifier];
    if (!cell) {
        cell = [[DetailTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
    }

    NSString *name = [[self.items objectAtIndex:indexPath.row] objectForKey:@"name"];
    cell.briefLabel.text = [[self.items objectAtIndex:indexPath.row] objectForKey:@"brief"];
    cell.iconImageView.image = [UIImage imageNamed:name];
    cell.timeLabel.text = @"5月10日";
    cell.commentTimeLabel.text = @"15分钟前";
    cell.commentCountLB.text = @"156";
    cell.praiseCountLB.text = @"56";
    
    return cell;
}
//- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
//    return YES;
//}

- (void)SelectionBtn:(UIButton *)button{
    switch (button.tag) {
        case 10:
            [self.navigationController popViewControllerAnimated:YES];
            break;
        case 1:
        {
            PushPhotoViewController *temp = [[PushPhotoViewController alloc] init];
            temp.bgName =@"发布照片";
            temp.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:temp animated:YES];
        }
            break;
        case 2:
        {
            WuxianYinShiViewController *temp = [[WuxianYinShiViewController alloc] init];
            temp.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:temp animated:YES];
        }
            break;
        default:
            break;
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
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
