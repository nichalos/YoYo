//
//  FinishInfoViewController.m
//  YoYo
//
//  Created by 夏宝梦 on 15/5/25.
//  Copyright (c) 2015年 yoyo. All rights reserved.
//

#import "FinishInfoViewController.h"
#import "FinishCell.h"
#import "ChangeInfoViewController.h"
@interface FinishInfoViewController ()

@end

@implementation FinishInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    title.text = @"完善信息";
    
    rightBtn.frame = CGRectMake(self.view.frame.size.width-60, 30, 50, 30);
    [rightBtn setTitle:@"完成" forState:UIControlStateNormal];
    rightBtn.tag = 10;
    [rightBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(selectView:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(20, 30, 30, 30);
    [leftBtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(selectView:) forControlEvents:UIControlEventTouchUpInside];
    leftBtn.tag = 11;
    [self.view addSubview:leftBtn];
    
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 80, self.view.frame.size.width, self.view.frame.size.height-80) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.tableView.userInteractionEnabled = YES;
    [self.view addSubview:self.tableView];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.myInfoArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 60;
    }else{
        return 40;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 5;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellIndentifer = @"reuse";
    FinishCell *cell = (FinishCell *)[tableView dequeueReusableCellWithIdentifier:cellIndentifer];
    if (!cell) {
        cell = [[FinishCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifer];
    }
    if (indexPath.row ==0) {
        cell.iconImage.image = [UIImage imageNamed:@"IMG_0723.JPG"];
        cell.contentLabel.frame = CGRectMake(20, 20, cell.frame.size.width -70, 20);
        cell.detailLabel.hidden = YES;
    }else{
        cell.iconImage.hidden = YES;
    }
    
    NSString * text = [self.myInfoArray objectAtIndex:indexPath.row];
    cell.contentLabel.text = text;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    cell.detailLabel.text = @"womenddd";
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {
        ChangeInfoViewController * changeVC = [[ChangeInfoViewController alloc] init];
        changeVC.titleName = [self.myInfoArray objectAtIndex:indexPath.row];
        
        [self.navigationController pushViewController:changeVC animated:YES];
    }
}
-(BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
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
