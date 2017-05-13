//
//  CommentTableViewCell.h
//  YouBike_Objc
//
//  Created by 謝豐任 on 2017/5/9.
//  Copyright © 2017年 劉洧熏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommentTableViewCell : UITableViewCell
    @property (weak, nonatomic) IBOutlet UIImageView *profileImage;
    @property (weak, nonatomic) IBOutlet UILabel *userName;
    @property (weak, nonatomic) IBOutlet UILabel *comment;

@end
