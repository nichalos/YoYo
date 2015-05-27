//
//  PersonViewController.m
//  YoYo
//
//  Created by nichalos on 15/4/3.
//  Copyright (c) 2015年 yoyo. All rights reserved.
//

#import "PersonViewController.h"
#import "PanViewController.h"
#import "MoreViewController.h"
#import "PersonSettingViewController.h"
#import "loginViewController.h"
#import "NewViewController.h"
#import "WuxianViewController.h"

#import "PersonCell.h"
#import "FinishInfoViewController.h"
#import "StarWishViewController.h"

@interface PersonViewController (){
    NSArray *group;
}

@end

@implementation PersonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    title.text = @"我";
//    bg.frame = CGRectMake(0, 65, self.view.bounds.size.width, self.view.bounds.size.height);
//    bg.image = [UIImage imageNamed:@"me"];

//    rightBtn.frame = CGRectMake(self.view.frame.size.width-60, 30, 40, 40);
//    [rightBtn setImage:[UIImage imageNamed:@"setting"] forState:UIControlStateNormal];
//    rightBtn.tag = 0;
//    [rightBtn addTarget:self action:@selector(selectView:) forControlEvents:UIControlEventTouchUpInside];
    
    [self loadMyInfoData];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 75, self.view.frame.size.width, self.view.frame.size.height-75) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView setScrollEnabled:NO];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.tableView.userInteractionEnabled = YES;
    [self.view addSubview:self.tableView];
    
    UIView * view = [[UIView alloc] initWithFrame:CGRectZero];
    self.tableView.tableFooterView = view;
}
-(void)loadMyInfoData{
    NSString *path=[[NSBundle mainBundle] pathForResource:@"MySet" ofType:@"plist"];
    self.mySetArray =[NSArray arrayWithContentsOfFile:path];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.mySetArray.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[self.mySetArray objectAtIndex:section] count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 100;
    }else{
        return 40;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellIndentifer = @"reuse";
    PersonCell *cell = (PersonCell *)[tableView dequeueReusableCellWithIdentifier:cellIndentifer];
    if (!cell) {
        cell = [[PersonCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIndentifer];
    }
    NSArray * arrayIndex = [self.mySetArray objectAtIndex:indexPath.section];
    NSDictionary * item = [arrayIndex objectAtIndex:indexPath.row];
    cell.iconImage.image = [UIImage imageNamed:[item objectForKey:@"icon"]];
   
    
    if (indexPath.section ==0) {
        cell.nameLabel.text = [item objectForKey:@"name"];
        cell.contentLabel.text = [item objectForKey:@"position"];
        cell.contentLabel.textColor = [UIColor redColor];
    }else{
        cell.iconImage.frame = CGRectMake(10, 10, 20, 20);
        cell.contentLabel.text = [item objectForKey:@"name"];
        cell.contentLabel.frame = CGRectMake(CGRectGetMaxX(cell.iconImage.frame)+5, 10, cell.frame.size.width - 40, 20);
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {
        FinishInfoViewController * finishVC = [[FinishInfoViewController alloc] init];
        NSDictionary * dic = [[self.mySetArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
        finishVC.myInfoArray = [dic objectForKey:@"child"];
        finishVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:finishVC animated:YES];
    }else if (indexPath.section == 2 && indexPath.row == 1){
        MoreViewController *temp = [[MoreViewController alloc] init];
        temp.bgName = @"明星祝福";
        temp.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:temp animated:YES];
    }else if (indexPath.section == 3){
        WuxianViewController * photoVC = [[WuxianViewController alloc] init];
        photoVC.name = @"IMG_0746.jpg";
        photoVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:photoVC animated:YES];
    }else if (indexPath.section == 2 && indexPath.row ==0){
        MoreViewController *temp = [[MoreViewController alloc] init];
        temp.bgName = @"影视基地";
        temp.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:temp animated:YES];
    }
}
-(BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}


- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}
-(void)selectView:(UIButton *)button{
    NSString *string = @"";
    BOOL issetting = NO;
    switch (button.tag) {
        case 0:
        case 1:
            return;
            break;
        case 2:
        {
            string = @"yoyo鲜颜值";
        }
            break;
        case 3:
        {
            string = @"明星祝福";
           
        }
            break;
        case 4:
        {
            NewViewController *temp = [[NewViewController alloc] init];
            temp.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:temp animated:YES];
            return;
        }
            break;
        case 5:
        {
            PanViewController *temp = [[PanViewController alloc] init];
            temp.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:temp animated:YES];
            return;
        }
            break;
        case 6:
        {
            WuxianViewController *temp = [[WuxianViewController alloc] init];
            temp.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:temp animated:YES];
            
            return;
        }
            break;
        case 7:
            string = @"邀请朋友加入";
            break;
        case 8:
        {
            [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"LOGIN"];
            
//            loginViewController *temp = [[loginViewController alloc] init];
//            [self.navigationController pushViewController:temp animated:YES];
////            [self.view addSubview:temp.view];
            return;
        }
            break;
        case 9:
            string = @"设置";
            issetting = YES;
            break;
        default:
            break;
    }
    MoreViewController *temp = [[MoreViewController alloc] init];
    temp.bgName = string;
    temp.isSetting = issetting;
    temp.hidesBottomBarWhenPushed = YES;
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
