//
//  AppDelegate.m
//  day14网易新闻
//
//  Created by Jack.Lin on 16/6/15.
//  Copyright © 2016年 Jack.Lin. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _window.backgroundColor = [UIColor whiteColor];
    
    Class cls = NSClassFromString(@"WYMainViewController");
    UIViewController *vc = [cls new];
    
    _window.rootViewController = vc;
    [_window makeKeyAndVisible];
    
    
    return YES;
}


@end
