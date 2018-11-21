//
//  WeexSDKManager.m
//  WeexDemo
//
//  Created by yangshengtao on 16/11/14.
//  Copyright © 2016年 taobao. All rights reserved.
//

#import "WeexSDKManager.h"



#import "VKVXPhotoPickerModule.h"

@implementation WeexSDKManager

+ (void)initWeexSDK
{
    //初始weex环境
    [WXSDKEngine initSDKEnvironment];
    //TODO: 注册组件
    [WXSDKEngine registerModule:@"photoPicker" withClass:[VKVXPhotoPickerModule class]];
    
#ifdef DEBUG
    [WXLog setLogLevel:WXLogLevelLog];
#endif
}

@end
