//
//  JwScanQRController.m
//  JwPart
//
//  Created by 陈警卫 on 2021/2/24.
//  Copyright © 2021 陈警卫. All rights reserved.
//

#import "JwScanQRController.h"

#define LBXScan_Define_Native
#define LBXScan_Define_ZXing
#define LBXScan_Define_ZBar
#define LBXScan_Define_UI

#import <LBXScanViewController.h>

@interface JwScanQRController ()<LBXScanViewControllerDelegate>

@property (nonatomic, strong) LBXScanViewController *scanVC;

@end

@implementation JwScanQRController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"扫一扫";
    [self setupView];
}

- (void)setupView{
    
    self.scanVC = [[LBXScanViewController alloc] init];
    self.scanVC.delegate = self;
    self.scanVC.isOpenInterestRect = YES;
    LBXScanViewStyle *style = [[LBXScanViewStyle alloc] init];
    self.scanVC.style = style;
    self.scanVC.libraryType = SLT_Native;
    self.scanVC.view.frame = self.view.bounds;
    [self.view addSubview:self.scanVC.view];
    [self addChildViewController:self.scanVC];
}

- (void)scanResultWithArray:(NSArray<LBXScanResult*>*)array{
    if (array.count > 0) {
        LBXScanResult *result = array.firstObject;
        NSLog(@"%@", result);
    }
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
