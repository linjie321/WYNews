//
//  WYNewsNormalCell.h
//  day14网易新闻
//
//  Created by Jack.Lin on 16/6/16.
//  Copyright © 2016年 Jack.Lin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WYNewsNormalCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *sourceLabel;

@property (weak, nonatomic) IBOutlet UILabel *replyLabel;

@end
