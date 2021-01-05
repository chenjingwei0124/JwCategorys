//
//  ViewController.m
//  JwCategorys
//
//  Created by 陈警卫 on 2020/12/15.
//

#import "ViewController.h"

#import "UIView+JwCate.h"
#import "UIColor+JwCate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //self.view.backgroundColor = [UIColor jw_colorWithHexString:@"#F74948"];
    
    self.view.backgroundColor = kJwColorHexString(@"#F74948");
    
    dispatch_queue_t queue = dispatch_queue_create("net.bujige.testQueue", DISPATCH_QUEUE_CONCURRENT);
    
    NSLog(@"b--%f", [[NSDate date] timeIntervalSince1970]);
    dispatch_async(queue, ^{
        NSLog(@"d--%f", [[NSDate date] timeIntervalSince1970]);
    });
    
}


@end
