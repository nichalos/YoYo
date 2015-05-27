//
//  ActivityViewController.m
//  YoYo
//
//  Created by Junfeng Bai on 15/2/9.
//  Copyright (c) 2015年 yoyo. All rights reserved.
//

#import "ActivityViewController.h"
#import "PushPhotoViewController.h"
#import "loginViewController.h"
#import "WuxianYinShiViewController.h"


@interface ActivityViewController ()

@end

@implementation ActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    title.text = @"热点动态";
    rightBtn.frame = CGRectMake(self.view.frame.size.width-60, 30, 30, 30);
    [rightBtn setImage:[UIImage imageNamed:@"fb"] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(selectView:) forControlEvents:UIControlEventTouchUpInside];
    
//    UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 55, bg.frame.size.width, bg.frame.size.height-55)];
//    scroll.backgroundColor = [UIColor clearColor];
//    scroll.showsHorizontalScrollIndicator = NO;
//    scroll.showsVerticalScrollIndicator = NO;
//    [scroll setContentSize:CGSizeMake(0, 1689)];
//    
//    UIImageView *bgImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, scroll.frame.size.width, 1689)];
//    bgImage.image = [UIImage imageNamed:@"热点动态"];
//    bgImage.contentMode = UIViewContentModeTopLeft;
//    bgImage.userInteractionEnabled = YES;
//    bgImage.backgroundColor = [UIColor clearColor];
//    [scroll addSubview:bgImage];
//    [bg addSubview:scroll];
//    
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//    button.frame = CGRectMake(70, 300, 40, 40);
//    button.backgroundColor = [UIColor clearColor];
//    button.tag = 1;
//    [button addTarget:self action:@selector(selectView:) forControlEvents:UIControlEventTouchUpInside];
//    [bgImage addSubview:button];
//
//    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
//    button2.frame = CGRectMake(70, 540, 40, 40);
//    button2.backgroundColor = [UIColor clearColor];
//    button2.tag = 2;
//    [button2 addTarget:self action:@selector(selectView:) forControlEvents:UIControlEventTouchUpInside];
//    [bgImage addSubview:button2];
//
//    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeCustom];
//    button3.frame = CGRectMake(70, 890, 40, 40);
//    button3.backgroundColor = [UIColor clearColor];
//    button3.tag = 3;
//    [button3 addTarget:self action:@selector(selectView:) forControlEvents:UIControlEventTouchUpInside];
//    [bgImage addSubview:button3];
//    
//    UIButton *button4 = [UIButton buttonWithType:UIButtonTypeCustom];
//    button4.frame = CGRectMake(70, 1305, 40, 40);
//    button4.backgroundColor = [UIColor clearColor];
//    button4.tag = 4;
//    [button4 addTarget:self action:@selector(selectView:) forControlEvents:UIControlEventTouchUpInside];
//    [bgImage addSubview:button4];

    [self loadData];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 80, self.view.frame.size.width, self.view.frame.size.height-120) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.items count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary * item = [self.items objectAtIndex:indexPath.row];
    return [DetailTableViewCell heightForViewWithObject:item inColumnWidth:self.tableView.frame.size.width] + 30;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellIndentifer = @"reuse";
    DetailTableViewCell *cell = (DetailTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIndentifer];
    if (!cell) {
        cell = [[DetailTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifer];
        UIImageView * iconImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 10, 50, 50)];
        iconImage.tag = 98;
        iconImage.layer.cornerRadius = 25.0f;
        iconImage.clipsToBounds = YES;
        iconImage.contentMode = UIViewContentModeScaleAspectFill;
        [cell addSubview:iconImage];
        
        UILabel * nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(55, 10, 50, 20)];
        nameLabel.textAlignment = NSTextAlignmentLeft;
        nameLabel.font = [UIFont systemFontOfSize:12];
        nameLabel.tag = 97;
        [cell addSubview:nameLabel];
        
        UIImageView * classImage = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(nameLabel.frame), 10, 20, 20)];
        classImage.tag = 96;
        classImage.layer.cornerRadius = 10.0f;
        classImage.clipsToBounds = YES;
        classImage.contentMode = UIViewContentModeScaleAspectFit;
        [cell addSubview:classImage];
        
    }
    UIImageView * icon =(UIImageView *)[cell viewWithTag:98];
    NSString * name = [[self.imageArray objectAtIndex:indexPath.row] objectForKey:@"name"];
    icon.image = [UIImage imageNamed:name];
    
    UILabel * nameLB = (UILabel *)[cell viewWithTag:97];
    nameLB.text = name;
    
    UIImageView * claseIcon =(UIImageView *)[cell viewWithTag:96];
    claseIcon.image = [UIImage imageNamed:@"pin"];
    
    NSDictionary * item = [self.items objectAtIndex:indexPath.row];
    CGRect rect = [UIScreen mainScreen].bounds;
    [cell fillViewWithObject:item withWidth:rect.size.width andIndexHeight:30];
    
    cell.timeLabel.hidden = YES;
    cell.briefLabel.text = [[self.items objectAtIndex:indexPath.row] objectForKey:@"brief"];
    [cell setImageswithURLs:[item objectForKey:@"image"]];
    cell.commentTimeLabel.text = @"15分钟前";
    cell.commentCountLB.text = @"156";
    cell.praiseCountLB.text = @"56";
    
    
    cell.delegate = self;
    cell.dianpingBtn.hidden = YES;
    
    return cell;
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
-(void)inageBtnClicked:(UIButton *)sender{
    NSLog(@"btn did clicked");
}
-(void)imageClicked:(UIButton *)sender{
    NSLog(@"sender clicekd");
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

}
-(BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

-(void)loadData{
    self.items = [NSMutableArray array];
    
    NSString *path=[[NSBundle mainBundle] pathForResource:@"start" ofType:@"plist"];
    self.imageArray =[NSMutableArray arrayWithContentsOfFile:path];
    
    NSString * brief = @"平静的自己有颗平常的心，看惯平淡的人世，过好平安的日子。平静的自己有颗平常的心，看惯平淡的人世，过好平安的日子。平静的自己有颗平常的心，看惯平淡的人世，过好平安的日子。平静的自己有颗平常的心，看惯平淡的人世，过好平安的日子。";
    for (int i=0; i<self.imageArray.count; i++) {
        if (i==0) {
            NSMutableArray * tempArray = [NSMutableArray array];
            for (int i = 684; i<685; i++) {
                NSString * nameStr = [NSString stringWithFormat:@"IMG_0%d.JPG",i];
                [tempArray addObject:nameStr];
            }
            NSMutableDictionary * temDic = [self.imageArray objectAtIndex:i];
            [temDic setObject:brief forKey:@"brief"];
            [temDic setObject:tempArray forKey:@"image"];
            [self.items addObject:temDic];
        }else if (i==1){
            NSMutableArray * tempArray = [NSMutableArray array];
            for (int i = 684; i<686; i++) {
                NSString * nameStr = [NSString stringWithFormat:@"IMG_0%d.JPG",i];
                [tempArray addObject:nameStr];
            }
            NSMutableDictionary * temDic = [self.imageArray objectAtIndex:i];
            [temDic setObject:brief forKey:@"brief"];
            [temDic setObject:tempArray forKey:@"image"];
            [self.items addObject:temDic];
            
        }else if (i==2){
            NSMutableArray * tempArray = [NSMutableArray array];
            for (int i = 684; i<687; i++) {
                NSString * nameStr = [NSString stringWithFormat:@"IMG_0%d.JPG",i];
                [tempArray addObject:nameStr];
            }
            NSMutableDictionary * temDic = [self.imageArray objectAtIndex:i];
            [temDic setObject:brief forKey:@"brief"];
            [temDic setObject:tempArray forKey:@"image"];
            [self.items addObject:temDic];
        }else if (i==3){
            NSMutableArray * tempArray = [NSMutableArray array];
            for (int i = 684; i<688; i++) {
                NSString * nameStr = [NSString stringWithFormat:@"IMG_0%d.JPG",i];
                [tempArray addObject:nameStr];
            }
            NSMutableDictionary * temDic = [self.imageArray objectAtIndex:i];
            [temDic setObject:brief forKey:@"brief"];
            [temDic setObject:tempArray forKey:@"image"];
            [self.items addObject:temDic];
        }else if (i==4){
            NSMutableArray * tempArray = [NSMutableArray array];
            for (int i = 684; i<689; i++) {
                NSString * nameStr = [NSString stringWithFormat:@"IMG_0%d.JPG",i];
                [tempArray addObject:nameStr];
            }
            NSMutableDictionary * temDic = [self.imageArray objectAtIndex:i];
            [temDic setObject:brief forKey:@"brief"];
            [temDic setObject:tempArray forKey:@"image"];
            [self.items addObject:temDic];
        }else if (i==5){
            NSMutableArray * tempArray = [NSMutableArray array];
            for (int i = 684; i<690; i++) {
                NSString * nameStr = [NSString stringWithFormat:@"IMG_0%d.JPG",i];
                [tempArray addObject:nameStr];
            }
            NSMutableDictionary * temDic = [self.imageArray objectAtIndex:i];
            [temDic setObject:brief forKey:@"brief"];
            [temDic setObject:tempArray forKey:@"image"];
            [self.items addObject:temDic];
        }else{
            NSMutableArray * tempArray = [NSMutableArray array];
            NSString * nameStr = @"IMG_0723.JPG";
            [tempArray addObject:nameStr];
            
            NSMutableDictionary * temDic = [self.imageArray objectAtIndex:i];
            [temDic setObject:brief forKey:@"brief"];
            [temDic setObject:tempArray forKey:@"image"];
            [self.items addObject:temDic];
        }
        
    }
    
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)selectView:(UIButton *)button{
    switch (button.tag) {
        case 0:{
            PushPhotoViewController *temp = [[PushPhotoViewController alloc] init];
            temp.bgName =@"发布照片";
            temp.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:temp animated:YES];
        }
            break;
        case 1:
        case 2:
        case 3:
        case 4:
        {
            WuxianYinShiViewController *temp = [[WuxianYinShiViewController alloc] init];
            temp.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:temp animated:YES];
        }
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)unwindSegue:(UIStoryboardSegue *)sender{
    
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
