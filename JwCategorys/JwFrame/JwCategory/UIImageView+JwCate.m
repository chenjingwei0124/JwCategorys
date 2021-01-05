//
//  UIImageView+JwCate.m
//  JwCategorys
//
//  Created by 陈警卫 on 2020/12/28.
//

#import "UIImageView+JwCate.h"
#import "JwCateImageHolder.h"

#define kJwImageHolderTag 41270

@implementation UIImageView (JwCate)

/** 加载网络图片 统一placeholder */
- (void)jw_sd_setImageWithURLStr:(NSString *)urlStr{
    NSURL *url = [self jw_urlWithEncodeString:urlStr];
    
    UIView *view = [self viewWithTag:kJwImageHolderTag];
    if (view) {
        [view removeFromSuperview];
    }
    
    UIView *placeholderView = [[JwCateImageHolder alloc] init];
    placeholderView.tag = kJwImageHolderTag;
    [self addSubview:placeholderView];
    [placeholderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.right.mas_equalTo(0);
    }];
    
    [self sd_setImageWithURL:url completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        if (image && placeholderView) {
            [placeholderView removeFromSuperview];
        }
        if (error && placeholderView) {
            //错误
        }
    }];
}

/** 加载网络图片 设置placeholder */
- (void)jw_sd_setImageWithURLStr:(NSString *)urlStr placeholderImage:(UIImage *)placeholder{
    NSURL *url = [self jw_urlWithEncodeString:urlStr];
    [self sd_setImageWithURL:url placeholderImage:placeholder];
}

/** 加载网络图片 处理返回结果 */
- (void)jw_sd_setImageWithURLStr:(NSString *)urlStr completed:(SDExternalCompletionBlock)completed{
    NSURL *url = [self jw_urlWithEncodeString:urlStr];
    [self sd_setImageWithURL:url completed:completed];
}

/** 处理请求连接 */
- (NSURL *)jw_urlWithEncodeString:(NSString *)string{
    
    if ([string isKindOfClass:[NSURL class]]) {
        return (NSURL *)string;
    }
    if (![string isKindOfClass:[NSString class]]){
        return nil;
    }
    string = [string stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSURL *url = [NSURL URLWithString:string];
    return url;
}

@end
