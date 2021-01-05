//
//  JwWebView.h
//  JwPart
//
//  Created by 陈警卫 on 2020/6/5.
//  Copyright © 2020 陈警卫. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JwWebView : UIView

@property (nonatomic, strong) WKWebView *webView;

@property (nonatomic, copy) void(^didObservePathTitle)(NSString *title);

//写入js
@property (nonatomic, strong) NSString *js;

@end

NS_ASSUME_NONNULL_END
