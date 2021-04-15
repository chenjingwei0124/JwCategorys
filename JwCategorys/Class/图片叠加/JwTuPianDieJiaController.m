//
//  JwTuPianDieJiaController.m
//  JwCategorys
//
//  Created by 陈警卫 on 2021/3/15.
//

#import "JwTuPianDieJiaController.h"
#import <UIImage+YYAdd.h>
#import "UIImage+TKCategory.h"
#import "UIImage+Masks.h"

@interface JwTuPianDieJiaController ()

@end

@implementation JwTuPianDieJiaController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupView];
    
}

- (void)setupView{
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:(CGRectMake(50, 100, 341, 262))];
    [self.view addSubview:imageView];
    
    UIImage *image = [UIImage imageNamed:@"test"];
    UIImage *mimage = [UIImage imageNamed:@"3"];
    UIImage *dimage = [image maskedWithImage:mimage];
    imageView.image = dimage;
    
    //TK
    /**
     UIImage *image = [UIImage imageNamed:@"test"];
     UIImage *mimage = [UIImage imageNamed:@"11mask"];
     CGSize size = image.size;
     CGRect rect = {CGPointZero, size};
     [image drawInRect:rect withImageMask:mimage];
     imageView.image = image;
     */
    
    //YY
    /**
     image = [image imageByBlurRadius:60
     tintColor:[UIColor redColor]
     tintMode:(kCGBlendModeNormal)
     saturation:1.0
     maskImage:[UIImage imageNamed:@"3"]];
     */

    //自己写的
    /**
     
     UIImage *image = [UIImage imageNamed:@"test"];
     CGSize size = image.size;
     CGRect rect = {CGPointZero, size};
     
     UIGraphicsBeginImageContext(size);
     //CGFloat scale = image.scale;
     //UIGraphicsBeginImageContextWithOptions(size, NO, scale);
     CGContextRef context = UIGraphicsGetCurrentContext();
     
     CGContextScaleCTM(context, 1, -1);
     CGContextTranslateCTM(context, 0, -rect.size.height);
     
     //CGContextDrawImage(context, rect, image.CGImage);
     //CGContextSaveGState(context);
     //获取蒙版
     UIImage *mimage = [UIImage imageNamed:@"11mask"];
     
     //使用蒙版进行裁剪
     CGContextClipToMask(context, rect, mimage.CGImage);
     CGContextSetBlendMode(context, kCGBlendModeMultiply);
     //绘制图像
     CGContextRestoreGState(context);
     
     UIImage *outputImage = UIGraphicsGetImageFromCurrentImageContext();
     UIGraphicsEndImageContext();
     
     imageView.image = outputImage;
     */
     
    
    
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
