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

#import "Test2TableViewCell.h"


#import "AllDianPingViewController.h"



@interface WuxianViewController ()<UITableViewDataSource,UITableViewDelegate,imageClickedDelegate>


{
    int titleHeight;
    int imageHeight;
    // 所有的cellFrame数据
    NSMutableArray * CellFrames;
}
@end

@implementation WuxianViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
   
    
    titleHeight = 0;

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
    
    [self loadData];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 80, self.view.frame.size.width, self.view.frame.size.height-120) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.view addSubview:self.tableView];
    [self.tableView setTableHeaderView:headView];
    
    
    UIView * footerView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.tableView.frame), self.view.frame.size.width, 40)];
    footerView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:footerView];
    
    UIButton * dianpingBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    dianpingBtn.frame = CGRectMake(20, 5, 30, 30);
    [dianpingBtn setImage:[UIImage imageNamed:@"comment"] forState:UIControlStateNormal];
    [dianpingBtn addTarget:self action:@selector(dianpingBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [footerView addSubview:dianpingBtn];
    
    UILabel * dianpingLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(dianpingBtn.frame)+5, 5, 30, 30)];
    dianpingLabel.text = @"点评";
    dianpingLabel.font = [UIFont systemFontOfSize:12];
    [footerView addSubview:dianpingLabel];
    
    
//    self.dianpingLabel = [[UILabel alloc]initWithFrame:CGRectZero];
//    self.dianpingLabel.font = [UIFont systemFontOfSize:10];
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
     return [self.items count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary * item = [self.items objectAtIndex:indexPath.row];
    CGRect rect = [UIScreen mainScreen].bounds;
    return [DetailTableViewCell heightForViewWithObject:item inColumnWidth:rect.size.width];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellIndentifer = @"reuse";
    DetailTableViewCell *cell = (DetailTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIndentifer];
    if (!cell) {
        cell = [[DetailTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifer];
    }
    NSDictionary * item = [self.items objectAtIndex:indexPath.row];
    
    CGRect rect = [UIScreen mainScreen].bounds;
    [cell fillViewWithObject:item withWidth:rect.size.width andIndexHeight:0];
    
    
    cell.timeLabel.text = @"5月10日";
    cell.briefLabel.text = [[self.items objectAtIndex:indexPath.row] objectForKey:@"brief"];
    
    
    cell.commentTimeLabel.text = @"15分钟前";
    cell.commentCountLB.text = @"156";
    cell.praiseCountLB.text = @"56";
    
    [cell setImageswithURLs:[item objectForKey:@"image"]];
    cell.delegate = self;
    
    cell.dianpingBtn.hidden = YES;
//    cell.dianpingLabel.text = @"点评";
//    [cell.dianpingBtn addTarget:self action:@selector(dianpingBtnClicked:) forControlEvents:UIControlEventTouchUpInside];

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
-(void)dianpingBtnClicked:(UIButton *)sender{
    AllDianPingViewController * allV = [[AllDianPingViewController alloc]init];
    allV.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:allV animated:YES];
}

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
-(BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

-(void)loadData{
    self.items = [NSMutableArray array];
    
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    
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
        
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [self.tableView reloadData];
//        });
        
//    });
    
}

#pragma - mark 字符串高度计算
-(CGSize)getLabHeightWithText:(NSString *)text labeFont1:(UIFont *)font labeSize1:(CGSize)size{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    NSDictionary *attributes = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle.copy};
    
    CGSize labelSize = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    return labelSize;
    
}
-(CGSize)calculateLabelHeigntWithWidth:(CGFloat)width string:(NSString *)text andFont:(UIFont *)font
{
    if (text.length == 0 || [text isEqualToString:@" "]){
        return CGRectZero.size;
    }
    CGSize constraint = CGSizeMake(width , 1000);
    CGRect rect = [text boundingRectWithSize:constraint options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName, nil] context:nil];
    return rect.size;
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
