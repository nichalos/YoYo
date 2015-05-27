//
//  AppDelegate.m
//  YoYo
//
//  Created by Junfeng Bai on 15/2/9.
//  Copyright (c) 2015年 yoyo. All rights reserved.
//

#import "AppDelegate.h"
#import <SMS_SDK/SMS_SDK.h>
#import "RegViewController.h"
#import "MyViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
//    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationNone];
    [SMS_SDK registerApp:@"600ace16a67d" withSecret:@"b3a730ce4c4114ec11fb085a409408a4"];
    
    BOOL islogin = [[NSUserDefaults standardUserDefaults] boolForKey:@"LOGIN"];
    if (islogin) {
        [self loginSuccess];
    }
    
    return YES;
}

-(void)loginSuccess{
//     [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"LOGIN"];
    UIStoryboard * storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    MyViewController * myVC = [storyBoard instantiateViewControllerWithIdentifier:@"myVC"];
    self.window.rootViewController = myVC;
}
-(void)logOut{
     [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"LOGIN"];
    RegViewController * loginVC = [[RegViewController alloc] init];
    UINavigationController * navigationVC = [[UINavigationController alloc] initWithRootViewController:loginVC];
    self.window.rootViewController = navigationVC;
    navigationVC.navigationBarHidden = YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
