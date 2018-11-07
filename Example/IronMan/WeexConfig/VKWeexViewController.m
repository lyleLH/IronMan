//
//  VKWeexViewController.m
//  VKProject
//
//  Created by 小兵 on 2018/7/26.
//  Copyright © 2018年 VKProject_OWNER. All rights reserved.
//

#import "VKWeexViewController.h"
#import <WeexSDK/WeexSDK.h>

@interface VKWeexViewController ()

/** weex 渲染的实例对象 */
@property (nonatomic, strong) WXSDKInstance *instance;
/** weex 渲染展示的视图 */
@property (nonatomic, strong) UIView *weexView;
/** js源地址 */
@property (nonatomic, strong) NSURL *sourceURL;

@end

@implementation VKWeexViewController

- (void)dealloc {
    // 切记在viewController的销毁的同时，将weex实例一并销毁，否则会出现内存泄露
    [_instance destroyInstance];
    
    //移除观察者
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (instancetype)initWithSourceURL:(NSURL *)sourceURL {
    if ((self = [super init])) {
        self.sourceURL = sourceURL;
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //渲染weex页面
    [self render];
}

#pragma mark - 生命周期
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self updateInstanceState:WeexInstanceAppear];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super  viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self updateInstanceState:WeexInstanceDisappear];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - updateInstanceState 更新实例状态
- (void)updateInstanceState:(WXState)state
{
    if (_instance && _instance.state != state) {
        _instance.state = state;
        
        if (state == WeexInstanceAppear) {
            [[WXSDKManager bridgeMgr] fireEvent:_instance.instanceId ref:WX_SDK_ROOT_REF type:@"viewappear" params:nil domChanges:nil];
        }
        else if (state == WeexInstanceDisappear) {
            [[WXSDKManager bridgeMgr] fireEvent:_instance.instanceId ref:WX_SDK_ROOT_REF type:@"viewdisappear" params:nil domChanges:nil];
        }
    }
}

#pragma mark - render渲染
- (void)render {
    
    if (!self.sourceURL) return;

    [_instance destroyInstance];
    //创建渲染实例对象
    _instance = [[WXSDKInstance alloc] init];
    _instance.frame = CGRectMake(0.0f, 0.0f, self.view.bounds.size.width, self.view.bounds.size.height);
    _instance.pageObject = self;
    _instance.pageName = self.sourceURL.absoluteString;
    _instance.viewController = self;  //设置渲染控制器
    
    // 为了避免循环引用，声明一个弱指针
    __weak typeof(self) weakSelf = self;
    
    // 设置 WXSDKInstance 创建完的回调
    // _instance.onCreate：weex页面最外层body渲染完成后的回调,
    // 在此回调中，weex渲染所得的rootView已确定，可以输出并添加到父容器中。
    _instance.onCreate = ^(UIView *view) {
        [weakSelf.weexView removeFromSuperview];
        weakSelf.weexView = view;
        [weakSelf.view addSubview:weakSelf.weexView];
    };
    
    // 设置 WXSDKInstance 出错时的回调
    _instance.onFailed = ^(NSError *error) {
        NSLog(@"处理失败:%@", error);
    };
    
    // 设置 WXSDKInstance 渲染完成时的回调
    // _instance.renderFinish：和onCreate不同，renderFinish表示所有weex的页面元素都已渲染完毕，整个渲染过程至此结束。
    _instance.renderFinish = ^(UIView *view) {
        NSLog(@"渲染完成!!!");
    };
    
    /* desc 设置 WXSDKInstance 用于渲染js的url路径
     @param url参数: 是从weex 编译运行后出来的app.js或app.weex.js 文件, 可以放在远程服务器上, 也可以直接拖进项目工程里.
     @param options参数，表示开发者可以通过WeexSDK向 前端 透传的参数，如bundleUrl,
     @param data参数，表示向weex的模板注入的页面数据,它一般来源于native的数据请求，当然也可以在前端逻辑中完成请求后将数据注入
     */
    [_instance renderWithURL:self.sourceURL options:@{@"bundleUrl":[self.sourceURL absoluteString]} data:nil];
}

@end
