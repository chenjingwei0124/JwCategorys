//
//  JwRootViewController.m
//  JwPart
//
//  Created by 陈警卫 on 2020/7/7.
//  Copyright © 2020 陈警卫. All rights reserved.
//

#import "JwRootViewController.h"
#import "JwTabBarController.h"

@interface JwRootViewController ()

@end

@implementation JwRootViewController

+ (JwRootViewController *)root{
    JwTabBarController *tc = [[JwTabBarController alloc] init];
    JwRootViewController *rc = [[JwRootViewController alloc] initWithRootViewController:tc];
    return rc;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
