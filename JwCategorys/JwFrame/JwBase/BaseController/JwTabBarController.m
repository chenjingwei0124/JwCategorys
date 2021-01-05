//
//  JwTabBarController.m
//  JwCompose
//
//  Created by 陈警卫 on 2019/9/11.
//  Copyright © 2019 陈警卫. All rights reserved.
//

#import "JwTabBarController.h"
#import "JwNavigationController.h"
#import "JwHomeController.h"

@interface JwTabBarController ()<UITabBarControllerDelegate>

@property (nonatomic, strong) JwNavigationController *homeNC;
@property (nonatomic, strong) JwNavigationController *lifeNC;
@property (nonatomic, strong) JwNavigationController *zhengwuNC;
@property (nonatomic, strong) JwNavigationController *myNC;

@property (nonatomic, strong) JwNavigationController *scmNC;

@end

@implementation JwTabBarController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /**
     JwBaseTabBar *tabBar = [[JwBaseTabBar alloc] init];
     tabBar.didMidAction = ^{
     JwSCMController *vc = [[JwSCMController alloc] init];
     [kJwRootNavigationVC pushViewController:vc animated:YES];
     };
     
     [self setValue:tabBar forKey:@"tabBar"];
     */
    [self setupView];
}

- (void)setupView{
    
    self.homeNC = [self navigationWithRootViewController:[[JwHomeController alloc] init]
                                   tabBarItemImageString:@"tab_zixun"
                           tabBarItemSelectedImageString:@"tab_zixuned"
                                                   title:@"资讯"];
    
    self.myNC = [self navigationWithRootViewController:[[JwHomeController alloc] init]
                                 tabBarItemImageString:@"tab_me"
                         tabBarItemSelectedImageString:@"tab_meed"
                                                 title:@"我的"];
    
    self.delegate = self;
    self.tabBar.translucent = NO;
    self.tabBar.tintColor = kJwColorHexString(@"#F54343");
    //去除顶部横线
    [self.tabBar setBackgroundImage:[UIImage new]];
    [self.tabBar setShadowImage:[UIImage new]];
    
    if (@available(iOS 10.0, *)) {
        self.tabBar.unselectedItemTintColor = kJwColorHexString(@"999999");
    }
    self.viewControllers = @[self.homeNC, self.myNC];
    //self.selectedIndex = 3;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    //if (viewController == [tabBarController.viewControllers firstObject]) {
    //if (self.selectedViewController == viewController) {
    //}
    //}
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    /**
     if (viewController == [tabBarController.viewControllers objectAtIndex:2]) {
     return NO;
     }else{
     return YES;
     }
     */
    return YES;
}

/**
 设置导航控制器
 */
- (JwNavigationController *)navigationWithRootViewController:(UIViewController *)controller
                                       tabBarItemImageString:(NSString *)imageString
                               tabBarItemSelectedImageString:(NSString *)selectedImageString
                                                       title:(NSString *)title{
    JwNavigationController *navc = [[JwNavigationController alloc] initWithRootViewController:controller];
    navc.tabBarItem.image = [[UIImage imageNamed:imageString] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
    navc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageString] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
    
    //[navc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor redColor]} forState:UIControlStateNormal];
    //[navc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blueColor]} forState:UIControlStateSelected];
    
    navc.title = title;
    controller.title = title;
    
    return navc;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
