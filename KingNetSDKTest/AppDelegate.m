//
//  AppDelegate.m
//  KingNetSDKTest
//
//  Created by niujf on 2019/2/19.
//  Copyright © 2019年 WHOwner All rights reserved.
//

#import "AppDelegate.h"
#import <MysticalPowerSDK/TMOpenShareSDK.h>
#import "KN_GameViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] init];
    self.window.frame = [UIScreen mainScreen].bounds;
    [self.window makeKeyAndVisible];
    self.window.rootViewController  = [[KN_GameViewController alloc] init];//游戏方生成的rootVC
    
    // Initialize Google Mobile Ads SDK
    
    
    //初始化
    [[TMOpenShareSDK shareTMOpenShareSDK] SG_ProjectInit: application launchOptions:launchOptions];
    [[TMOpenShareSDK shareTMOpenShareSDK] setLogEnabled:YES];
  
    return YES;
}



- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
            options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options{
    return [[TMOpenShareSDK shareTMOpenShareSDK] SG_ThirdPartApplication:application openURL:url options:options];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    [[TMOpenShareSDK shareTMOpenShareSDK] SG_AppsFlyerTrackerBecomeActive];
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
