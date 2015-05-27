//
//  AllDianPingViewController.m
//  YoYo
//
//  Created by xbm524 on 15/5/24.
//  Copyright (c) 2015年 yoyo. All rights reserved.
//

#import "AllDianPingViewController.h"
#import "DianPingTableViewCell.h"



@interface AllDianPingViewController ()

@end

@implementation AllDianPingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    title.text = @"全部评论";
    rightBtn.frame = CGRectMake(10, 27, 30, 30);
    [rightBtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    rightBtn.tag = 10;
    [rightBtn addTarget:self action:@selector(SelectionBtn:) forControlEvents:UIControlEventTouchUpInside];
    
//    self.dataArray = [NSArray arrayWithObjects:@"", nil]
    
    UITableView * tableView =[[UITableView alloc] initWithFrame:CGRectMake(0, 70, self.view.frame.size.width, self.view.frame.size.height-120) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
}

-(void)SelectionBtn:(UIButton* )sender{
    switch (sender.tag) {
        case 10:
        {
            [self.navigationController popViewControllerAnimated:YES];
        }
            break;
            
        default:
            break;
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 90;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * CellIdentifier = @"reuse";
    DianPingTableViewCell * cell = (DianPingTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[DianPingTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.iconImageView.image = [UIImage imageNamed:@"IMG_0723.jpg"];
    cell.nameLabel.text = @"清一qingq";
    cell.classView.image = [UIImage imageNamed:@"pin"];
    cell.briefLabel.text = @"lsdfjlasjdflasldfj;as";
    cell.timefLabel.text = @"3分钟前";
    
    
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}
-(BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
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
