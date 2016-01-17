//
//  Eason_TaskViewController.m
//  EasonCoding
//
//  Created by 何毅 on 16/1/14.
//  Copyright © 2016年 eason_ho. All rights reserved.
//

#import "Eason_TaskViewController.h"
#import "FRDLivelyButton.h"
#import "EasonEditTaskController.h"

@interface Eason_TaskViewController ()

@end

@implementation Eason_TaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor greenColor]];
    self.title = @"任务";
    
    
    FRDLivelyButton *button = [[FRDLivelyButton alloc] initWithFrame:CGRectMake(0, 0, 18, 18)];
    
//    kFRDLivelyButtonStyleHamburger,
//    kFRDLivelyButtonStyleClose,
//    kFRDLivelyButtonStylePlus,
//    kFRDLivelyButtonStyleCirclePlus,
//    kFRDLivelyButtonStyleCircleClose,
//    kFRDLivelyButtonStyleCaretUp,
//    kFRDLivelyButtonStyleCaretDown,
//    kFRDLivelyButtonStyleCaretLeft,
//    kFRDLivelyButtonStyleCaretRight,
//    kFRDLivelyButtonStyleArrowLeft,
//    kFRDLivelyButtonStyleArrowRight
    
    [button setOptions:@{kFRDLivelyButtonHighlightScale : @(0.9f),kFRDLivelyButtonLineWidth:@(1.0)}];
    [button setStyle:kFRDLivelyButtonStylePlus animated:YES];
    UIBarButtonItem *rightBottonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    [button addTarget:self action:@selector(addItemClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.rightBarButtonItem = rightBottonItem;

}

-(void) addItemClicked:(UIBarButtonItem*)seader
{
    EasonEditTaskController * editTaskController = [[EasonEditTaskController alloc] init];
    [self.navigationController pushViewController:editTaskController animated:NO];
    self.tabBarController.tabBar.hidden = YES;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
