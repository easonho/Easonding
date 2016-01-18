//
//  Eason_ProjectTagViewController.h
//  EasonCoding
//
//  Created by 何毅 on 16/1/15.
//  Copyright © 2016年 eason_ho. All rights reserved.
//

#import "EasonBaseViewController.h"

typedef NS_ENUM(NSInteger,ProjectType)
{
//  全部项目
    ProjectAll = 0,
//  我参加的
    ProjectIJoin = 1,
//  我创建的
    ProjecICreate =2
};

@interface Eason_ProjectTagViewController : EasonBaseViewController<UITableViewDataSource,UITableViewDelegate>

//项目类型
@property(assign,nonatomic)ProjectType projectType;


@end


