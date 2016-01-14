//
//  EasonRootTabBarController.m
//  EasonCoding
//
//  Created by 何毅 on 16/1/14.
//  Copyright © 2016年 eason_ho. All rights reserved.
//

#import "EasonRootTabBarController.h"
#import "EasonBaseNavigationController.h"
#import "RDVTabBarItem.h"
#import "Eason_ProjectViewController.h"
#import "Eason_TaskViewController.h"
#import "Eason_TweetViewController.h"
#import "Eason_MessageViewController.h"
#import "Eason_MeViewController.h"

@interface EasonRootTabBarController ()

@end

@implementation EasonRootTabBarController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpChildViewController];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma --mark 初始化子控制器
-(void) setUpChildViewController{
//   我的项目
    Eason_ProjectViewController *project = [[Eason_ProjectViewController alloc] init];
    UINavigationController *nav_project = [[EasonBaseNavigationController alloc] initWithRootViewController:project];
    
//  我的任务
    Eason_TaskViewController *mytask = [[Eason_TaskViewController alloc] init];
    UINavigationController *nav_mytask = [[EasonBaseNavigationController alloc] initWithRootViewController:mytask];
    
//  冒泡
    Eason_TweetViewController *tweet = [[Eason_TweetViewController alloc] init];
    UINavigationController *nav_tweet = [[EasonBaseNavigationController alloc] initWithRootViewController:tweet];
    
//  消息
    Eason_MessageViewController *message = [[Eason_MessageViewController alloc] init];
    UINavigationController *nav_message = [[EasonBaseNavigationController alloc] initWithRootViewController:message];
//  我的
    Eason_MeViewController *me = [[Eason_MeViewController alloc] init];
    UINavigationController *nav_me = [[EasonBaseNavigationController alloc] initWithRootViewController:me];
    
    [self setViewControllers:@[nav_project,nav_mytask,nav_tweet,nav_message,nav_me]];
    [self initTabBarForController];
    self.delegate = self;
}

//为TabBar设置文字
-(void) initTabBarForController{
    UIImage *backgroundImage = [UIImage imageNamed:@"tabbar_background"];
    NSArray *tabBarItemImages = @[@"project", @"task", @"tweet", @"privatemessage", @"me"];
    NSArray *tabBarItemTitles = @[@"我的项目", @"我的任务", @"冒泡", @"消息", @"我"];
    
    NSInteger index = 0;
    for (RDVTabBarItem *item in [[self tabBar] items]) {
        item.titlePositionAdjustment = UIOffsetMake(0, 3);
        [item setBackgroundSelectedImage:backgroundImage withUnselectedImage:backgroundImage];
        UIImage *selectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_selected",
                                                      [tabBarItemImages objectAtIndex:index]]];
        UIImage *unselectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_normal",
                                                        [tabBarItemImages objectAtIndex:index]]];
        [item setFinishedSelectedImage:selectedimage withFinishedUnselectedImage:unselectedimage];
        [item setTitle:[tabBarItemTitles objectAtIndex:index]];
        index++;
    }
}

#pragma --mark  RDVTabBarControllerDelegate 
/**
 * Asks the delegate whether the specified view controller should be made active.
 */
- (BOOL)tabBarController:(RDVTabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    NSLog(@"单击当前的Controller");
    if (tabBarController.selectedViewController != viewController) {
        return YES;
    }
    if (![viewController isKindOfClass:[UINavigationController class]]) {
        return YES;
    }
    UINavigationController *nav = (UINavigationController *)viewController;
    if (nav.topViewController != nav.viewControllers[0]) {
        return YES;
    }
    return YES;

}

/**
 * Tells the delegate that the user selected an item in the tab bar.
 */
- (void)tabBarController:(RDVTabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{

    NSLog(@"选择别Controller");
}

@end
