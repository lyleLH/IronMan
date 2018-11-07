//
//  VKWeexViewController.h
//  VKProject
//
//  Created by 小兵 on 2018/7/26.
//  Copyright © 2018年 VKProject_OWNER. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 weex界面容器
 */
@interface VKWeexViewController : UIViewController

/**
 初始话容器

 @param sourceURL js文件地址
 */
- (instancetype)initWithSourceURL:(NSURL *)sourceURL;

@end
