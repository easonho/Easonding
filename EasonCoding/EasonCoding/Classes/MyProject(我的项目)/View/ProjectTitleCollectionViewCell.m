//
//  ProjectTitleCollectionViewCell.m
//  EasonCoding
//
//  Created by 何毅 on 16/1/15.
//  Copyright © 2016年 eason_ho. All rights reserved.
//

#import "ProjectTitleCollectionViewCell.h"

@implementation ProjectTitleCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(void) setTitle:(NSString *)Title
{
    self.Title = Title;
    self.segmentTitle.titleLabel.text = Title;
}

@end
