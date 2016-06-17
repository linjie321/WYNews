//
//  WYNewsListItem.h
//  day14网易新闻
//
//  Created by Jack.Lin on 16/6/16.
//  Copyright © 2016年 Jack.Lin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WYNewsListItem : NSObject

@property (nonatomic ,copy) NSString *title;

@property (nonatomic ,copy) NSString *digest;

@property (nonatomic ,copy) NSString *imgsrc;

@property (nonatomic ,copy) NSString *source;

@property (nonatomic ,assign) NSInteger replyCount;

@property (nonatomic ,strong) NSArray *imgextra;

@property (nonatomic ,assign) BOOL imgType;

@end
