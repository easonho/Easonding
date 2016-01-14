//
//  EasonBaseNavigationController.m
//  EasonCoding
//
//  Created by 何毅 on 16/1/14.
//  Copyright © 2016年 eason_ho. All rights reserved.
//

#import "EasonBaseNavigationController.h"

@interface EasonBaseNavigationController ()

@end

@implementation EasonBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+ (void)initialize
{
    // 初始化导航栏样式
    [self initNavigationBarTheme];
    
    // 初始化导航栏item样式
    [self initBarButtonItemTheme];
    
}


+(void) initNavigationBarTheme{
    UINavigationBar *appearance =  [UINavigationBar appearance];
    // 为了统一iOS6和iOS7，iOS6需要设置导航栏背景来模拟iOS7的效果
    [appearance setBackgroundColor:[UIColor colorWithRed:40 green:48 blue:59 alpha:0.8]];
    // 设置属性
    NSMutableDictionary *attr = [NSMutableDictionary dictionary];
    // 设置字体
    attr[NSForegroundColorAttributeName] = [UIColor blackColor];
    attr[NSFontAttributeName] = [UIFont systemFontOfSize:18];
    // 消去文字阴影，设置阴影偏移为0
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowOffset = CGSizeZero;
    attr[NSShadowAttributeName] = shadow;
    
    [appearance setTitleTextAttributes:attr];
}


+(void) initBarButtonItemTheme{
    // 设置导航栏，修改所有UINavigationBar的样式
    UIBarButtonItem *appearance = [UIBarButtonItem appearance];
    // 设置noraml状态下的样式
    NSMutableDictionary *normalTextAttr = [NSMutableDictionary dictionary];
    // 字体大小
    normalTextAttr[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    // 字体颜色
    normalTextAttr[NSForegroundColorAttributeName] = [UIColor orangeColor];
    // 设置为normal样式
    [appearance setTitleTextAttributes:normalTextAttr forState:UIControlStateNormal];
    // 设置highlighted状态下的样式
    NSMutableDictionary *highlightedTextAttr = [NSMutableDictionary dictionaryWithDictionary:normalTextAttr];
    // 字体颜色
    highlightedTextAttr[NSForegroundColorAttributeName] = [UIColor redColor];
    // 设置为normal样式
    [appearance setTitleTextAttributes:highlightedTextAttr forState:UIControlStateHighlighted];
    
    // 设置disabled状态下的样式
    NSMutableDictionary *disabledTextAttr = [NSMutableDictionary dictionaryWithDictionary:normalTextAttr];
    // 字体颜色
    disabledTextAttr[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    // 设置为normal样式
    [appearance setTitleTextAttributes:disabledTextAttr forState:UIControlStateDisabled];
}



//由自己的子控制器决定是否可以旋转
-(BOOL)shouldAutorotate
{
    return [self.visibleViewController shouldAutorotate];
}

//由子控制器决定显示的方向
-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return [self.visibleViewController preferredInterfaceOrientationForPresentation];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    if (![self.visibleViewController isKindOfClass:[UIAlertController class]]) {//iOS9 UIWebRotatingAlertController
        return [self.visibleViewController supportedInterfaceOrientations];
    }else{
        return UIInterfaceOrientationMaskPortrait;
    }
}


@end
