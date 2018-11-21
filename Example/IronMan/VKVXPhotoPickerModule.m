//
//  VKVXPhotoPickerModule.m
//  IronMan
//
//  Created by 刘浩 on 2018/11/7.
//

#import "VKVXPhotoPickerModule.h"
#import "UIViewController+mtt_category.h"

@interface VKVXPhotoPickerModule () <TZImagePickerControllerDelegate>


/**
 选择图片操作的状态码
 */
@property (nonatomic,strong)NSString * code;

/**
 选择完成后回传的结果
 */
@property (nonatomic,strong)NSDictionary * response;


/**
 操作的对应的提示消息
 */
@property (nonatomic,strong)NSString * msg;


/**
 图片沙盒路径 主路径
 */
@property (nonatomic,strong)NSString * imageSavedPrefixPath;

@end


@implementation VKVXPhotoPickerModule


- (NSString *)imageSavedPrefixPath {
    if(!_imageSavedPrefixPath){
        _imageSavedPrefixPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    }
    return _imageSavedPrefixPath;
}




/**
 PhotoLib 选择的图片存入沙盒

 @param image 存入的图片对象
 @param imageName 存入路径的图片名称
 @return 返回沙盒路径数组
 */
- (NSArray *)saveImagesToSandbox: (NSArray <UIImage *>*)images imageNames:(NSArray <NSString *>*)imageNames {
    NSMutableArray * pathAry = [NSMutableArray new];
    for (NSInteger i = 0 ; i<images.count; i ++) {
        @autoreleasepool {
            UIImage * image = [images objectAtIndex:i];
            NSString * imageName = [imageNames objectAtIndex:i];
            NSData* imageData = UIImagePNGRepresentation(image);
            NSString* fullPathToFile = [self.imageSavedPrefixPath stringByAppendingPathComponent:imageName];
            [pathAry addObject:fullPathToFile];
            [imageData writeToFile:fullPathToFile atomically:NO];
        }
    }
    return [NSArray arrayWithArray:pathAry];
}




/**
 选择图片

 @param option 对图片选择器的设置
 @param result 返回给WeexSdk的参数
 */
- (void)chooseImageWithOption:(NSDictionary*)option result:(WXModuleKeepAliveCallback)result {
    
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:5 columnNumber:5 delegate:self pushPhotoPickerVc:YES];
    [imagePickerVc setDidFinishPickingPhotosWithInfosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto, NSArray<NSDictionary *> *infos) {
        NSMutableArray * imageNames  = [NSMutableArray new];
        for (PHAsset * asset in assets) {
            NSArray *resources = [PHAssetResource assetResourcesForAsset:asset];
            NSString *orgFilename = ((PHAssetResource*)resources[0]).originalFilename;
            [imageNames addObject:orgFilename];
        }
        NSArray * imagePaths =  [self saveImagesToSandbox:photos imageNames:imageNames];
        result(@{@"photos":imagePaths,@"res":@"1:成功"}, NO);
    }];
    [[UIViewController mtt_TopviewControler] presentViewController:imagePickerVc animated:YES completion:nil];
}


- (void)tz_imagePickerControllerDidCancelPickerhandle:(WXModuleKeepAliveCallback)result {
    
}



@end
