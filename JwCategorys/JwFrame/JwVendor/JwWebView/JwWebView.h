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

@protocol JwWebViewDelegate <NSObject>

@optional
//代理返回js调用OC
- (void)webViewReceiveScriptMessage:(WKScriptMessage *)message;

@end

@interface JwWebView : UIView

@property (nonatomic, strong) WKWebView *webView;

//block返回title
@property (nonatomic, copy) void(^didObservePathTitle)(NSString *title);
//代理
@property (nonatomic, weak) id<JwWebViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
