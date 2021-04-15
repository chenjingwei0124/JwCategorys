//
//  JwCellWebCell.m
//  JwCategorys
//
//  Created by 陈警卫 on 2021/4/15.
//

#import "JwCellWebCell.h"
#import <WebKit/WKWebView.h>
#import "JwWeakScriptMessageDelegate.h"

@interface JwCellWebCell ()<WKScriptMessageHandler, WKUIDelegate, WKNavigationDelegate>

@property (nonatomic, strong) WKWebView *webView;

@end

@implementation JwCellWebCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.webView];
        [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.bottom.offset(0);
        }];
        
    }
    return self;
}

- (void)setCellWebModel:(JwCellWebModel *)cellWebModel{
    _cellWebModel = cellWebModel;
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:cellWebModel.url]]];
}

- (void)layoutSubviews{
    [super layoutSubviews];
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
        
        _webView = [[WKWebView alloc] initWithFrame:(CGRectZero) configuration:config];
        _webView.UIDelegate = self;
        _webView.navigationDelegate = self;
        _webView.allowsBackForwardNavigationGestures = YES;
        
        _webView.scrollView.scrollEnabled = NO;
    }
    return  _webView;
}

//页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation{
    
    CGFloat height = 0;
    if ([self.cellWebModel.url isEqualToString:@"https://www.baidu.com/"]) {
        height = 100;
    }else{
        height = 200;
    }
    
    if (self.didFinishAction) {
        self.didFinishAction(height);
    }
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
