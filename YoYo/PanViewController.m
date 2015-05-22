//
//  PanViewController.m
//  YoYo
//
//  Created by nichalos on 15/4/3.
//  Copyright (c) 2015年 yoyo. All rights reserved.
//

#import "PanViewController.h"
#import "DishesTableViewCell.h"

@interface PanViewController (){
    NSArray *dataArray;
}

@end

@implementation PanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    title.text = @"盘中餐";
    UIButton *start = [UIButton buttonWithType:UIButtonTypeCustom];
    start.frame = CGRectMake(10, 30, 40, 40);
    [start setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [start addTarget:self action:@selector(selectionback:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:start];
    rightBtn.hidden = YES;
    
    UITableView * tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 75, self.view.frame.size.width, self.view.frame.size.height - 75) style:UITableViewStylePlain];
    
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    
    dataArray = [NSArray arrayWithObjects:@"每一天都像春天的气息，发芽成长，枝繁叶茂。",@"美的质朴，由内而外",@"任性，任性，还是任性",@"内外兼修",@"亲切的大自然",@"我帅，我帅，我帅吗",@"每一天都像春天的气息，发芽成长，枝繁叶茂。",@"美的质朴，由内而外",@"任性，任性，还是任性",@"内外兼修",@"亲切的大自然",@"我帅，我帅，我帅吗",@"每一天都像春天的气息，发芽成长，枝繁叶茂。",@"美的质朴，由内而外",@"任性，任性，还是任性",@"内外兼修",@"亲切的大自然",@"我帅，我帅，我帅吗",@"每一天都像春天的气息，发芽成长，枝繁叶茂。",@"美的质朴，由内而外",@"任性，任性，还是任性",@"内外兼修",@"亲切的大自然",@"我帅，我帅，我帅吗", nil];
}

- (void)selectionback:(UIButton *)button{
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"reuse";
    
    DishesTableViewCell * cell = (DishesTableViewCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[DishesTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.backgroundColor = [UIColor clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    NSString *name = array[indexPath.row];
    cell.imge.image=[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",name]];
    cell.name.text = name;
    cell.breif.text = dataArray[indexPath.row];
    cell.address.text = @"北京";
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
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
