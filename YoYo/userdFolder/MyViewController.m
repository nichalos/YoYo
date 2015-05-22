//
//  MyViewController.m
//  YoYo
//
//  Created by nichalos on 15/4/30.
//  Copyright (c) 2015年 yoyo. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.tintColor = [UIColor colorWithRed:255/255.0f green:70/255.0f blue:60/255.0f alpha:1];
    NSArray *array = [NSArray arrayWithObjects:@"home_select",@"start_select",@"find_select",@"me_select", nil];
    for (int i = 0;i<self.viewControllers.count;i++){
        UIViewController *temp = self.viewControllers[i];
        temp.tabBarItem.selectedImage = [UIImage imageNamed:array[i]];
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
