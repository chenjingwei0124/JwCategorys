//
//  UIView+JwHolder.h
//  JwCategorys
//
//  Created by 陈警卫 on 2020/12/29.
//

#import <UIKit/UIKit.h>
#import <Masonry.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, Jw_ViewState) {
    Jw_ViewStateError = 0,     //加载失败
    Jw_ViewStateNothing = 1,   //什么都没有
};

@interface UIView (JwHolder)

@property (nonatomic, strong) UIView *jw_showBackView;

@property (nonatomic, copy) void(^jw_didShowBackAction)(UIView *view);

- (void)jw_setupShowBackViewWithState:(Jw_ViewState)state;

- (void)jw_setupShowBackViewWithImage:(NSString *)image text:(NSString *)text button:(NSString *)button;

- (void)jw_removeShowBackView;


@end

NS_ASSUME_NONNULL_END
