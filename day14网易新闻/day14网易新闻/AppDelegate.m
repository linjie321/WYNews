//
//  AppDelegate.m
//  day14网易新闻
//
//  Created by Jack.Lin on 16/6/15.
//  Copyright © 2016年 Jack.Lin. All rights reserved.
//

#import "AppDelegate.h"
#import <AFNetworkActivityIndicatorManager.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    
    
    [self setupAppearance];
    
    _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _window.backgroundColor = [UIColor whiteColor];
    
    Class cls = NSClassFromString(@"WYNewsListViewController");
    UIViewController *vc = [cls new];
    
    _window.rootViewController = vc;
    [_window makeKeyAndVisible];
    
    
    
    
    return YES;
}


- (void)setupAppearance {
   
    [UITabBar appearance].tintColor = [UIColor cz_colorWithHex:0xDF0000];
}

@end
