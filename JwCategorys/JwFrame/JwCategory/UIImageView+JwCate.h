//
//  UIImageView+JwCate.h
//  JwCategorys
//
//  Created by 陈警卫 on 2020/12/28.
//

#import <UIKit/UIKit.h>
#import <SDWebImage.h>
#import <Masonry.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (JwCate)

/** 加载网络图片 统一placeholder */
- (void)jw_sd_setImageWithURLStr:(NSString *)urlStr;

/** 加载网络图片 设置placeholder */
- (void)jw_sd_setImageWithURLStr:(NSString *)urlStr placeholderImage:(UIImage *)placeholder;

/** 加载网络图片 处理返回结果 */
- (void)jw_sd_setImageWithURLStr:(NSString *)urlStr completed:(SDExternalCompletionBlock)completed;

/** 处理请求连接 */
- (NSURL *)jw_urlWithEncodeString:(NSString *)string;

@end

NS_ASSUME_NONNULL_END
