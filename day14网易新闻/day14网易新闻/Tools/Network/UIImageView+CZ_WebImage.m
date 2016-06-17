//
//  UIImageView+CZ_WebImage.m
//  day14网易新闻
//
//  Created by Jack.Lin on 16/6/17.
//  Copyright © 2016年 Jack.Lin. All rights reserved.
//

#import "UIImageView+CZ_WebImage.h"
#import <UIImageView+WebCache.h>

@implementation UIImageView (CZ_WebImage)

- (void)cz_setImageWithURLString:(NSString *)urlString {

    NSURL *url = [NSURL URLWithString:urlString];
    
    if (url != nil) {
        [self sd_setImageWithURL:url];
    }
}

@end
