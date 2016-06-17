//
//  WYNewsCell.m
//  day14网易新闻
//
//  Created by Jack.Lin on 16/6/17.
//  Copyright © 2016年 Jack.Lin. All rights reserved.
//

#import "WYNewsCell.h"
#import "WYNewsListItem.h"
#import <UIImageView+WebCache.h>


@interface WYNewsCell()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *sourceLabel;

@property (weak, nonatomic) IBOutlet UILabel *replyLabel;

@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *extraIcon;


@end


@implementation WYNewsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


- (void)setNewsItem:(WYNewsListItem *)newsItem {

    _newsItem = newsItem;
    
    _titleLabel.text = newsItem.title;
    _sourceLabel.text = newsItem.source;
    _replyLabel.text = @(newsItem.replyCount).description;
    
    NSURL *imageURL = [NSURL URLWithString:newsItem.imgsrc];
    [_iconView sd_setImageWithURL:imageURL];
    
    NSInteger idx = 0;
    for (NSDictionary *dict in newsItem.imgextra) {
        NSURL *url = [NSURL URLWithString:dict[@"imgsrc"]];
        
        UIImageView *iv = _extraIcon[idx++];
        
        [iv sd_setImageWithURL:url];
    }
}


@end
