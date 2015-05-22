//
//  PersonSettingViewController.m
//  YoYo
//
//  Created by nichalos on 15/4/11.
//  Copyright (c) 2015年 yoyo. All rights reserved.
//

#import "PersonSettingViewController.h"
#import "MoreViewController.h"
#import "EditViewController.h"
#import "WuxianViewController.h"

@interface PersonSettingViewController (){
     NSArray *group;
}

@end

@implementation PersonSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    title.text = @"个人设置";
    rightBtn.hidden = YES;
    
    UIButton *start = [UIButton buttonWithType:UIButtonTypeCustom];
    start.frame = CGRectMake(10, 30, 40, 40);
    [start setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [start addTarget:self action:@selector(SelectionBtn:) forControlEvents:UIControlEventTouchUpInside];
    start.tag = 0;
    [self.view addSubview:start];
    
    UITableView *table = [[UITableView alloc] initWithFrame:CGRectMake(0, 75, self.view.frame.size.width, self.view.frame.size.height-75) style:UITableViewStylePlain];
    table.dataSource = self;
    table.delegate = self;
    UIView *foot = [[UIView alloc] init];
    table.tableFooterView = foot;
    [self.view addSubview:table];
    
    
    NSArray *groupOne = [NSArray arrayWithObjects:@"YO友才艺颜值会员",@"星光无线", nil];
    NSArray *groupTwo = [NSArray arrayWithObjects:@"YOYO号",@"昵称",@"个性签名", nil];
    
    NSArray *groupThree = [NSArray arrayWithObjects:@"兴趣爱好",@"联系方式",@"行业院校",@"完善档案", nil];
    
    group = [NSArray arrayWithObjects:groupOne,groupTwo,groupThree,nil];
}

- (void)SelectionBtn:(UIButton *)button{
    switch (button.tag) {
        case 0:
            [self.navigationController popViewControllerAnimated:YES];
            break;
            
        default:
            break;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 2) {
        return 26;
    }
    return 25;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0){
        return 1;
    }else{
        return [[group objectAtIndex:section-1] count];
    }
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"";
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
        {
            NSString *cellInd = @"cell";
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellInd];
            if (!cell) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellInd];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                UIImageView *_icon = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 70, 70)];
                _icon.backgroundColor = [UIColor clearColor];
                _icon.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",array[29]]];
                [cell.contentView addSubview:_icon];
                
                UIImageView *add = [[UIImageView alloc] initWithFrame:CGRectMake(90, 10, 70, 70)];
                add.backgroundColor = [UIColor clearColor];
                add.image = [UIImage imageNamed:@"add"];
                [cell.contentView addSubview:add];
                
                UILabel *name = [[UILabel alloc] initWithFrame:CGRectMake(10, 85, 300, 20)];
                name.textAlignment = NSTextAlignmentLeft;
                name.textColor = [UIColor lightGrayColor];
                name.font = [UIFont systemFontOfSize:14];
                name.text = @"第一张为默认头像位置";
                [cell.contentView addSubview:name];
            }
            return cell;
        }
            break;
        case 1:
        {
            NSString *cellInd = @"cell";
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellInd];
            if (!cell) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellInd];
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                UILabel *name = [[UILabel alloc] initWithFrame:CGRectMake(40, 10, 240, 30)];
                name.textAlignment = NSTextAlignmentLeft;
                name.textColor = [UIColor redColor];
                name.tag = 1;
                name.font = [UIFont systemFontOfSize:24];
                
                [cell.contentView addSubview:name];
                
                UILabel *info = [[UILabel alloc] initWithFrame:CGRectMake(250, 0, 100, 55)];
                info.textAlignment = NSTextAlignmentLeft;
                info.textColor = [UIColor lightGrayColor];
                
                info.tag = 2;
                [cell.contentView addSubview:info];
            }
            UILabel *name = (UILabel *)[cell.contentView viewWithTag:1];
            name.text = [group[indexPath.section-1] objectAtIndex:indexPath.row];
            UILabel *info = (UILabel *)[cell.contentView viewWithTag:2];
            if (indexPath.row == 0) {
                info.frame = CGRectMake(270, 0, 100, 55);
                info.font = [UIFont systemFontOfSize:22];
                info.text = @"未开通";
            }else{
                info.frame = CGRectMake(150, 0, 240, 55);
                info.font = [UIFont systemFontOfSize:14];
                info.text = @"机遇，提升，点点星光围绕着你 你能抓住它么...";
            }
            return cell;
        }
            break;
        case 2:
        {
            NSString *cellInd = @"cell";
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellInd];
            if (!cell) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellInd];
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                
                UILabel *name = [[UILabel alloc] initWithFrame:CGRectMake(40, 0, 100, 55)];
                name.tag = 1;
                name.textAlignment = NSTextAlignmentLeft;
                name.textColor = [UIColor blackColor];
                name.font = [UIFont systemFontOfSize:24];
                [cell.contentView addSubview:name];
                UILabel *info = [[UILabel alloc] initWithFrame:CGRectMake(270, 0, 100, 55)];
                info.textAlignment = NSTextAlignmentRight;
                info.textColor = [UIColor lightGrayColor];
                info.font = [UIFont systemFontOfSize:20];
                info.tag = 2;
                [cell.contentView addSubview:info];
            }
            UILabel *name = (UILabel *)[cell.contentView viewWithTag:1];
            name.text = [group[indexPath.section-1] objectAtIndex:indexPath.row];
            UILabel *info = (UILabel *)[cell.contentView viewWithTag:2];
            if (indexPath.row == 0) {
                cell.accessoryType = UITableViewCellAccessoryNone;
                info.text = @"1568226";
            }else if(indexPath.row == 1){
                info.text = @"清爽的一天";
            }else{
                info.text = @"";
            }
            return cell;
        }
        case 3:
        {
            NSString *cellInd = @"cell";
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellInd];
            if (!cell) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellInd];
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                
                UILabel *name = [[UILabel alloc] initWithFrame:CGRectMake(40, 0, 100, 55)];
                name.tag = 1;
                name.textAlignment = NSTextAlignmentLeft;
                name.textColor = [UIColor blackColor];
                name.font = [UIFont systemFontOfSize:24];
                [cell.contentView addSubview:name];
            }
            UILabel *name = (UILabel *)[cell.contentView viewWithTag:1];
            name.text = [group[indexPath.section-1] objectAtIndex:indexPath.row];
            return cell;
        }
        default:
            break;
    }
    
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0 && indexPath.row == 0) {
        return 110;
    }else if (indexPath.section == 0 && indexPath.row == 1){
        return 55;
    }
    return 55;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        
    }else if (indexPath.section == 1) {
        
        switch (indexPath.row) {
            case 0:
            {
                MoreViewController *temp = [[MoreViewController alloc] init];
                temp.bgName = @"yo友才艺会员";
                temp.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:temp animated:YES];
            }
                break;
                
            case 1:
            {
                WuxianViewController *temp = [[WuxianViewController alloc] init];
                temp.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:temp animated:YES];
            }
                break;
                
            default:
                break;
        }
    }else if(indexPath.section == 2){
        if (indexPath.row == 0) {
            return;
        }else{
            EditViewController *temp = [[EditViewController alloc] init];
            temp.bgName = [group[indexPath.section-1] objectAtIndex:indexPath.row];
            temp.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:temp animated:YES];
        }
    }else{
        if (indexPath.row == 0 || indexPath.row == 2) {
            EditViewController *temp = [[EditViewController alloc] init];
            temp.bgName = [group[indexPath.section-1] objectAtIndex:indexPath.row];
            temp.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:temp animated:YES];
        }else{
            MoreViewController *temp = [[MoreViewController alloc] init];
            temp.bgName = [group[indexPath.section-1] objectAtIndex:indexPath.row];
            temp.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:temp animated:YES];
        }
        
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
