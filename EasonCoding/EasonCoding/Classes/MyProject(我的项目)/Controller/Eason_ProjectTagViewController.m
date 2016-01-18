//
//  Eason_ProjectTagViewController.m
//  EasonCoding
//
//  Created by 何毅 on 16/1/15.
//  Copyright © 2016年 eason_ho. All rights reserved.
//

#import "Eason_ProjectTagViewController.h"
#import "Masonry.h"
#import "EasonProjectCellTableViewCell.h"
#include "ODRefreshControl.h"
#import "SVPullToRefresh.h"


#define Project_Cell  @"Project_Cell"

@interface Eason_ProjectTagViewController ()

//数据DataTable
@property(nonatomic,strong) UITableView* myTableView;
//刷新控制器
@property (nonatomic, strong) ODRefreshControl *refreshControl;

@end

@implementation Eason_ProjectTagViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    switch (self.projectType) {
        case 0:
            NSLog(@"全部项目projectType");
            break;
        case 1:
            NSLog(@"我参加的projectType");
            break;
        case 2:
            NSLog(@"我创建的projectType");
            break;
            
        default:
            break;
    }
    _myTableView = ({
        UITableView *tableView = [[UITableView alloc] init];
        tableView.backgroundColor =[UIColor clearColor];
        tableView.dataSource = self;
        tableView.delegate = self;
        [tableView registerClass:[EasonProjectCellTableViewCell class] forCellReuseIdentifier:Project_Cell];
        [self.view addSubview:tableView];
        [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
        
        {
            __weak typeof (self) weakSelf = self;
            [tableView addInfiniteScrollingWithActionHandler:^{
                //
                [weakSelf refreshMore];
            }];
        }
        
        tableView;
    });
    _refreshControl = [[ODRefreshControl alloc] initInScrollView:_myTableView];
    [_refreshControl addTarget:self action:@selector(refresh) forControlEvents:UIControlEventEditingChanged];
}

#pragma --mark 刷新当前refreshMore
-(void)refresh {
    NSLog(@"我刷刷刷~~~~");
    [NSThread sleepForTimeInterval:0.3];
    [_refreshControl endRefreshing];
}

-(void)refreshMore{

}


#pragma --mark UITableViewDataSoure
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  50;
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    EasonProjectCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Project_Cell forIndexPath:indexPath];
    if(cell == nil){
        cell = [[EasonProjectCellTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Project_Cell];
    }
    cell.textLabel.text = @"text";
    return cell;
}

#pragma --mark UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"选择了~~~Cell");
}

@end
