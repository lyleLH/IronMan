//
//  VKWXAppDelegate.m
//  IronMan
//
//  Created by MTTGCC on 11/05/2018.
//  Copyright (c) 2018 MTTGCC. All rights reserved.
//

#import "VKWXAppDelegate.h"
#import "VKWeexViewController.h"
#import "WeexSDKManager.h"



@implementation VKWXAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    //初始化WeexSDK
    [WeexSDKManager initWeexSDK];
    
    NSFileManager *fm = [NSFileManager defaultManager];
    NSString *srcFile = [[NSBundle mainBundle]pathForResource:@"File.txt" ofType:nil];
    NSString *doc = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    [fm copyItemAtPath:srcFile toPath:[doc stringByAppendingPathComponent:@"File.txt"] error:nil];
    
    NSString *srcDist = [[NSBundle mainBundle]pathForResource:@"dist" ofType:nil];
    
    [fm copyItemAtPath:srcDist toPath:[doc stringByAppendingPathComponent:@"dist"] error:nil];
    
    //设置根控制器
    NSString *indexPath = [doc stringByAppendingString:@"/dist/index.js"];
    NSURL *sourceUrl = [NSURL fileURLWithPath:indexPath];
    VKWeexViewController *wxDemoVC = [[VKWeexViewController alloc] initWithSourceURL:sourceUrl];
    self.window.rootViewController = [[WXRootViewController alloc] initWithRootViewController:wxDemoVC];
    
    [self.window makeKeyAndVisible];
    
    // Override point for customization after application launch.
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
