//
//  CommentTableViewCell.m
//  YouBike_Objc
//
//  Created by 謝豐任 on 2017/5/9.
//  Copyright © 2017年 劉洧熏. All rights reserved.
//

#import "CommentTableViewCell.h"

@implementation CommentTableViewCell
    @synthesize profileImage = profileImage;
    @synthesize userName = userName;
    @synthesize comment = comment;
    @synthesize timeLabel = timeLabel;

- (void)awakeFromNib {
    [super awakeFromNib];
    userName.textColor = [UIColor colorWithRed:204/255 green:113/255 blue:93/255 alpha:1];
    comment.textColor = [UIColor colorWithRed:211/255 green:150/255 blue:104/255 alpha:1];
    timeLabel.textColor = [UIColor colorWithRed:211/255 green:150/255 blue:104/255 alpha:1];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
