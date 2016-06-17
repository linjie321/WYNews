//
//  WYNewsCell.h
//  day14网易新闻
//
//  Created by Jack.Lin on 16/6/17.
//  Copyright © 2016年 Jack.Lin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WYNewsListItem;


@interface WYNewsCell : UITableViewCell

@property (nonatomic, strong) WYNewsListItem *newsItem;

@end
