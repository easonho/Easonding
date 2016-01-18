//
//  Eason_myProjectController.m
//  EasonCoding
//
//  Created by 何毅 on 16/1/15.
//  Copyright © 2016年 eason_ho. All rights reserved.
//

#import "Eason_myProjectController.h"
#import "ProjectTitleCollectionViewCell.h"
#import "PopMenu.h"
#import "MenuItem.h"


#define  titleCell   @"TitleCell"

@interface Eason_myProjectController ()

@property(strong,nonatomic) NSMutableArray* nvc;

//我任务摸
@property (strong, nonatomic) NSArray *segmentItems;
//点击搜索
@property(strong,nonatomic) UISearchBar *mySearch;
//搜索View
@property (strong, nonatomic) UISearchDisplayController *mySearchDisplayController;

@property (strong,nonatomic) PopMenu *myPopMenu;

@end

@implementation Eason_myProjectController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"项目";
    [self configSegmentItems];

    self.indicatorInsets = UIEdgeInsetsMake(0, 24, 0, 24);
    self.indicatorColor = [UIColor greenColor];
    self.itemWidth = SCREEN_WIDTH/3;
    [self setupNavBtn];
    [self.segmentBar registerClass:[ProjectTitleCollectionViewCell class] forCellWithReuseIdentifier:titleCell];
//    self.dataSource = self;
    self.delegate = self;
    
}


- (void)configSegmentItems{
    _segmentItems = @[@"全部项目", @"我参与的", @"我创建的"];
}


- (void)setupNavBtn{
    [self.navigationItem setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"search_Nav"] style:UIBarButtonItemStylePlain target:self action:@selector(searchItemClicked:)] animated:NO];
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"addBtn_Nav"] style:UIBarButtonItemStylePlain target:self action:@selector(addItemClicked:)] animated:NO];
}


#pragma --mark  navigationItem Click
-(void)searchItemClicked:(id) seader
{
    if (!_mySearch) {
        _mySearch=({
            UISearchBar *searchBar = [[UISearchBar alloc] init];
            [searchBar sizeToFit];
             searchBar.delegate = self;
            [searchBar setTintColor:[UIColor whiteColor]];
            [searchBar setPlaceholder:@"项目名称/创建人"];
            searchBar;
        });
    }
    [self.navigationController.view addSubview:_mySearch];
    
    if (!_mySearchDisplayController) {
        _mySearchDisplayController = ({
            UISearchDisplayController *searchController = [[UISearchDisplayController alloc] initWithSearchBar:_mySearch contentsController:self];
             searchController;
        });
    }
    [_mySearch becomeFirstResponder];
}

-(void)addItemClicked:(id) seader
{
    NSArray *menuItems = @[
                           [MenuItem initWithTitle:@"项目" iconName:@"pop_Project" index:0],
                           [MenuItem initWithTitle:@"任务" iconName:@"pop_Task" index:1],
                           [MenuItem initWithTitle:@"冒泡" iconName:@"pop_Tweet" index:2],
                           [MenuItem initWithTitle:@"添加好友" iconName:@"pop_User" index:3],
                           [MenuItem initWithTitle:@"私信" iconName:@"pop_Message" index:4],
                           [MenuItem initWithTitle:@"两步验证" iconName:@"pop_2FA" index:5],
            ];
    
    if (!_myPopMenu) {
        _myPopMenu = [[PopMenu alloc] initWithFrame:SCREEN_BOUND items:menuItems];
        _myPopMenu.perRowItemCount = 3;
        _myPopMenu.menuAnimationType = kPopMenuAnimationTypeSina;
    }
    [_myPopMenu showMenuAtView:kKeyWindow startPoint:CGPointMake(0, -100) endPoint:CGPointMake(0, -100)];
    
    _myPopMenu.didSelectedItemCompletion = ^(MenuItem *selectedItem)
    {
        switch (selectedItem.index) {
            default:
                NSLog(@"select 功能%@",selectedItem.title);
                break;
        }
    };
}


#pragma --mark UISearchBarDelegate
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{

}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{

}

- (void)searchProjectWithStr:(NSString *)string{

}


#pragma --mark JYSlideSegmentDataSource
//- (NSInteger)slideSegment:(UICollectionView *)segmentBar
//   numberOfItemsInSection:(NSInteger)section
//{
//    return 3;
//}
//
//- (UICollectionViewCell *)slideSegment:(UICollectionView *)segmentBar
//                cellForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    ProjectTitleCollectionViewCell *cell = [segmentBar dequeueReusableCellWithReuseIdentifier:titleCell forIndexPath:indexPath];
//    if(cell == nil){
//        
//    }
//    
//    return cell;
//}
//
//- (NSInteger)numberOfSectionsInslideSegment:(UICollectionView *)segmentBar
//{
//    return 3;
//}



#pragma --mark JYSlideSegmentDelegate
- (void)didSelectViewController:(UIViewController *)viewController
{
    NSLog(@"didSelectViewController%@",viewController.title);
}
- (void)didFullyShowViewController:(UIViewController *)viewController
{
    NSLog(@"didFullyShowViewController%@",viewController.title);
}
- (BOOL)shouldSelectViewController:(UIViewController *)viewController
{
    return YES;
}

@end
