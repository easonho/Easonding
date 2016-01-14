//
//  Eason_ProjectViewController.m
//  EasonCoding
//
//  Created by 何毅 on 16/1/14.
//  Copyright © 2016年 eason_ho. All rights reserved.
//

#import "Eason_ProjectViewController.h"
#import "Masonry.h"
#import "iCarousel.h"


@interface Eason_ProjectViewController ()

//滚动板
@property(strong,nonatomic) iCarousel* myCarousel;

@end

@implementation Eason_ProjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.view setBackgroundColor:[UIColor redColor]];
     self.title = @"项目";
    [self configSegmentItems];
    [self setupNavBtn];
    
    _myCarousel=({
        iCarousel *icarousel = [[iCarousel alloc] init];
        icarousel.dataSource = self;
        icarousel.delegate = self;
        icarousel.scrollSpeed =1.0;
        icarousel.type = iCarouselTypeLinear;
        icarousel.pagingEnabled = 0.3;
        [self.view addSubview:icarousel];
        [icarousel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(44, 0, 0, 0));
        }];
        icarousel;
    });
    
}
- (void)configSegmentItems{
    _segmentItems = @[@"全部项目", @"我参与的", @"我创建的"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupNavBtn{
    [self.navigationItem setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"search_Nav"] style:UIBarButtonItemStylePlain target:self action:@selector(searchItemClicked:)] animated:NO];
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"addBtn_Nav"] style:UIBarButtonItemStylePlain target:self action:@selector(addItemClicked:)] animated:NO];
}

#pragma --mark  navigationItem Click
-(void)searchItemClicked:(id) seader
{
    NSLog(@"searchItemClicked");

}


-(void)addItemClicked:(id) seader
{
    NSLog(@"addItemClicked");

}

#pragma --mark icarousel dataSoure delegate
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return  self.segmentItems.count;
}
- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(nullable UIView *)view
{

    UIView *contentview = [[UIView alloc] initWithFrame:carousel.bounds];
    [contentview setBackgroundColor:[UIColor redColor]];
    return contentview;
}

@end
