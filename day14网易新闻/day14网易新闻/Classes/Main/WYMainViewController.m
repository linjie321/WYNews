//
//  WYMainViewController.m
//  day14网易新闻
//
//  Created by Jack.Lin on 16/6/15.
//  Copyright © 2016年 Jack.Lin. All rights reserved.
//

#import "WYMainViewController.h"

@interface WYMainViewController ()

@end

@implementation WYMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)addChildViewControllers {

      NSArray *array = @[
                         @{@"clsName": @"WYHomeViewController", @"title": @"新闻", @"imageName": @"news"},
                         @{@"clsName": @"UIViewController", @"title": @"阅读", @"imageName": @"reader"},
                         @{@"clsName": @"UIViewController", @"title": @"视频", @"imageName": @"media"},
                         @{@"clsName": @"UIViewController", @"title": @"话题", @"imageName": @"bar"},
                         @{@"clsName": @"UIViewController", @"title": @"我", @"imageName": @"me"}
                         ];
    
    NSMutableArray *arrayM = [NSMutableArray array];
    
    for (NSDictionary *dict in array) {
        
        [arrayM addObject:[self childControllerWithDict:dict]];
    }

    self.viewControllers = arrayM.copy;
}


- (UIViewController *)childControllerWithDict:(NSDictionary *)dict {

    NSString *clsName = dict[@"clsName"];
    Class cls = NSClassFromString(clsName);
    
    NSAssert(clsName != nil, @"传入类名错误");
    UIViewController *vc = [cls new];
    
    vc.title = dict[@"title"];
    
    NSString *imageName = [NSString stringWithFormat:@"tabbar_icon_%@_normal",dict[@"imageName"]];
    vc.tabBarItem.image = [UIImage imageNamed:imageName];
    
    NSString *imageNameHL = [NSString stringWithFormat:@"tabbar_icon_%@_highlight",dict[@"imageName"]];
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:imageNameHL] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    
    return nav;
}



@end
