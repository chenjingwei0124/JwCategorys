//
//  AppDelegate.m
//  JwCategorys
//
//  Created by 陈警卫 on 2020/12/15.
//

#import "AppDelegate.h"
#import "JwMacro.h"
#import "UIView+JwCate.h"
#import "JwTabBarController.h"
#import <IQKeyboardManager.h>

@interface AppDelegate ()

@end

@implementation AppDelegate

/** 进入菜单界面 */
- (void)showRootController{
    [self.window.rootViewController removeFromParentViewController];
    [self.window jw_removeAllSubviews];
    self.window.rootViewController = [[JwTabBarController alloc] init];
}

/** 键盘高度计算以及BarTool */
- (void)initKeyboardManager {
    
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.enable = YES;
    manager.shouldResignOnTouchOutside = YES;
    manager.toolbarTintColor = [UIColor blackColor];
    manager.previousNextDisplayMode = IQPreviousNextDisplayModeDefault;
    manager.enableAutoToolbar = NO;
    manager.shouldShowToolbarPlaceholder = NO;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    [self showRootController];
    [self initKeyboardManager];
    [self jw_handleCompose];
    
    return YES;
}

/** URL Scheme */
- (BOOL)application:(UIApplication *)app handleOpenURL:(nonnull NSURL *)url {
    //iOS2.0 - iOS4.2
    return YES;
}

- (BOOL)application:(UIApplication *)app openURL:(nonnull NSURL *)url sourceApplication:(nullable NSString *)sourceApplication annotation:(nonnull id)annotation {
    //iOS4.2 - iOS9.0
    [self jw_handleOpenURL:url];
    return YES;
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    //iOS9.0 -
    [self jw_handleOpenURL:url];
    return YES;
}

/** Universal Link Associated Domains */
- (BOOL)application:(UIApplication *)application continueUserActivity:(nonnull NSUserActivity *)userActivity restorationHandler:(nonnull void (^)(NSArray<id<UIUserActivityRestoring>> * _Nullable))restorationHandler{
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    //应用程序即将进入后台
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    //应用程序进入后台
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    //应用程序即将进入前台
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    //应用程序重新激活
}


- (void)applicationWillTerminate:(UIApplication *)application {
    //应用程序即将终止时调用
}

/** URL Scheme参数处理 */
- (void)jw_handleOpenURL:(nonnull NSURL *)url {
    NSString *urlStr = [url absoluteString];
    //参数格式 jw.compose://data?xxx=xxx&xxx=xxx
    if ([urlStr hasPrefix:@"jw.compose://"]) {
        NSString *paramStr = [urlStr stringByReplacingOccurrencesOfString:@"jw.categorys://data?" withString:@""];
        NSArray *pkvArr = [paramStr componentsSeparatedByString:@"&"];
        
        NSMutableDictionary *param = [NSMutableDictionary dictionary];
        for (NSString *kvStr in pkvArr) {
            NSArray *kvArr = [kvStr componentsSeparatedByString:@"="];
            if (kvArr.count > 1) {
                param[kvArr[0]] = kvArr[1];
            }
        }
        DLog(@"%@", param);
    }
}

/** 处理业务 */
- (void)jw_handleCompose{

}



@end
