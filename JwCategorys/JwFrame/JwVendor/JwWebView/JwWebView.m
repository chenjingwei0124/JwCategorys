//
//  JwWebView.m
//  JwPart
//
//  Created by 陈警卫 on 2020/6/5.
//  Copyright © 2020 陈警卫. All rights reserved.
//

#import "JwWebView.h"
#import "JwMacro.h"
#import "UIColor+JwCate.h"
#import "UIView+JwCate.h"
#import "JwWeakScriptMessageDelegate.h"

@interface JwWebView ()<WKScriptMessageHandler, WKUIDelegate, WKNavigationDelegate>

@property (nonatomic, strong) UIProgressView *progressView;

@end

@implementation JwWebView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)setupView{
    [self addSubview:self.webView];
    [self addSubview:self.progressView];
    
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    [self.webView addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)dealloc{
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
    [self.webView removeObserver:self forKeyPath:@"title"];
}


- (UIProgressView *)progressView{
    if (!_progressView) {
        _progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 0, self.jw_width, 0)];
        _progressView.tintColor = kJwColorHexString(@"#F54343");
        _progressView.trackTintColor = [UIColor groupTableViewBackgroundColor];
    }
    return _progressView;
}

- (WKWebView *)webView{
    if (_webView == nil) {
        //网络配置
        WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
        //设置队形
        WKPreferences *preference = [[WKPreferences alloc] init];
        preference.minimumFontSize = 0;
        preference.javaScriptEnabled = YES;
        preference.javaScriptCanOpenWindowsAutomatically = YES;
        config.preferences = preference;
        
        config.allowsInlineMediaPlayback = YES;
        if (@available(iOS 9.0, *)) {
            config.requiresUserActionForMediaPlayback = YES;
            config.allowsPictureInPictureMediaPlayback = YES;
            config.applicationNameForUserAgent = @"JwCompose";
        }
        
        JwWeakScriptMessageDelegate *weakDelegate = [[JwWeakScriptMessageDelegate alloc] initWithDelegate:self];
        WKUserContentController *wkUC = [[WKUserContentController alloc] init];
        [wkUC addScriptMessageHandler:weakDelegate name:@"iOSJS"];
        config.userContentController = wkUC;
        
        _webView = [[WKWebView alloc] initWithFrame:(CGRectMake(0, 0, self.jw_width, self.jw_height)) configuration:config];
        _webView.UIDelegate = self;
        _webView.navigationDelegate = self;
        _webView.allowsBackForwardNavigationGestures = YES;
        
    }
    return  _webView;
}

//WKScriptMessageHandler

//通过接收JS传出消息的name进行捕捉的回调方法
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message{
    DLog(@"name:%@ body:%@ frameInfo:%@",message.name,message.body,message.frameInfo);
    
    NSString *param = [NSString stringWithFormat:@"name:%@\nbody:%@", message.name, message.body];
    DLog(@"JS调用OC%@", param);
}

//WKNavigationDelegate

//在发送请求前决定是否跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    
    DLog(@"%@", navigationAction.request.URL.absoluteString);
    decisionHandler(WKNavigationActionPolicyAllow);//允许
    //decisionHandler(WKNavigationActionPolicyCancel);//不允许
}

//在收到响应后决定是否跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler{
    
    DLog(@"%@", navigationResponse.response.URL.absoluteString);
    decisionHandler(WKNavigationResponsePolicyAllow);//允许
    //decisionHandler(WKNavigationResponsePolicyCancel);//不允许
}

//接收到服务器跳转请求之后调用
- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(null_unspecified WKNavigation *)navigation{
    
}

//页面开始加载时调用
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(null_unspecified WKNavigation *)navigation{
    
}

//当内容开始返回时调用
- (void)webView:(WKWebView *)webView didCommitNavigation:(null_unspecified WKNavigation *)navigation{
    
}

//页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation{
    //写入JS
    if (self.js) {
        NSString *jsString = self.js;
        [webView evaluateJavaScript:jsString completionHandler:^(id _Nullable data, NSError * _Nullable error) {
            
        }];
    }
}

//页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error{
    
}

//WKUIDelegate

//弹出窗
- (WKWebView *)webView:(WKWebView *)webView createWebViewWithConfiguration:(WKWebViewConfiguration *)configuration forNavigationAction:(WKNavigationAction *)navigationAction windowFeatures:(WKWindowFeatures *)windowFeatures {
    if (!navigationAction.targetFrame.isMainFrame) {
        [webView loadRequest:navigationAction.request];
    }
    return nil;
}

//警告框 alert
- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler {
    
}

//确认框 confirm
- (void)webView:(WKWebView *)webView runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(BOOL))completionHandler{
    
}

//输入框 prompt
- (void)webView:(WKWebView *)webView runJavaScriptTextInputPanelWithPrompt:(NSString *)prompt defaultText:(NSString *)defaultText initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(NSString * _Nullable))completionHandler{
    
}


#pragma mark - kvo
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{

    if (object == self.webView && [keyPath isEqualToString:@"estimatedProgress"]) {
        CGFloat progress = [[change objectForKey:NSKeyValueChangeNewKey] floatValue];
        self.progressView.progress = progress;
        if (progress >= 1.0) {
            //添加动画 进度条隐藏更自然
            [UIView animateWithDuration:0.3
                                  delay:0.3
                                options:UIViewAnimationOptionCurveEaseOut
                             animations:^{
                self.progressView.alpha = 0;
            } completion:nil];
        }
    }else if (object == self.webView && [keyPath isEqualToString:@"title"]){
        if (self.didObservePathTitle) {
            self.didObservePathTitle(self.webView.title);
        }
    }
    else{
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
