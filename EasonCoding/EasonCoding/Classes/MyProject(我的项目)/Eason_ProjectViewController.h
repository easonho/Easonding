//
//  Eason_ProjectViewController.h
//  EasonCoding
//
//  Created by 何毅 on 16/1/14.
//  Copyright © 2016年 eason_ho. All rights reserved.
//

#import "EasonBaseViewController.h"
#import "iCarousel.h"

@interface Eason_ProjectViewController : EasonBaseViewController<iCarouselDataSource, iCarouselDelegate>

@property (strong, nonatomic) NSArray *segmentItems;

@end
