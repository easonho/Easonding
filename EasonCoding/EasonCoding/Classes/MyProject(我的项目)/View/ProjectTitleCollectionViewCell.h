//
//  ProjectTitleCollectionViewCell.h
//  EasonCoding
//
//  Created by 何毅 on 16/1/15.
//  Copyright © 2016年 eason_ho. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProjectTitleCollectionViewCell : UICollectionViewCell

//标题空间
@property (weak, nonatomic) IBOutlet UIButton *segmentTitle;

//标题名字
@property(nonatomic,strong) NSString* Title;

@end
