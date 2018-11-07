//
//  WeexSDKManager.m
//  WeexDemo
//
//  Created by yangshengtao on 16/11/14.
//  Copyright © 2016年 taobao. All rights reserved.
//

#import "WeexSDKManager.h"



//#import <VKZipModule/VKZipModule.h>

@implementation WeexSDKManager

+ (void)initWeexSDK
{
    //初始weex环境
    [WXSDKEngine initSDKEnvironment];
    
    
#ifdef DEBUG
    [WXLog setLogLevel:WXLogLevelLog];
#endif
}

@end
