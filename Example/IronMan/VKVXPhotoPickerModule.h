//
//  VKVXPhotoPickerModule.h
//  IronMan
//
//  Created by 刘浩 on 2018/11/7.
//

#import <Foundation/Foundation.h>
#import <TZImagePickerController/TZImagePickerController.h>
#import <WeexSDK/WXModuleProtocol.h>

NS_ASSUME_NONNULL_BEGIN

@interface VKVXPhotoPickerModule : NSObject<WXModuleProtocol>

- (void)chooseImageWithOption:(NSDictionary*)option result:(WXModuleKeepAliveCallback)result ;


@end

NS_ASSUME_NONNULL_END
