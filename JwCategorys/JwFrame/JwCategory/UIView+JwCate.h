//
//  UIView+JwCate.h
//  JwCategorys
//
//  Created by 陈警卫 on 2020/12/15.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (JwCate)
/** 赋取x值 */
@property (nonatomic, assign) CGFloat jw_x;
/** 赋取y值 */
@property (nonatomic, assign) CGFloat jw_y;
/** 固定控件x值赋值右边值 取值右边值 */
@property (nonatomic, assign) CGFloat jw_right;
/** 固定控件y值赋值下边值 取值下边值 */
@property (nonatomic, assign) CGFloat jw_bottom;
/** 固定控件宽度赋值右边值 取值右边值 */
@property (nonatomic, assign) CGFloat jw_right_x;
/** 固定控件高度赋值下边值 取值下边值 */
@property (nonatomic, assign) CGFloat jw_bottom_y;
/** 赋取width值 */
@property (nonatomic, assign) CGFloat jw_width;
/** 赋取height值 */
@property (nonatomic, assign) CGFloat jw_height;
/** 固定控件右边赋值宽度 取值宽度 */
@property (nonatomic, assign) CGFloat jw_width_r;
/** 固定控件底边赋值高度 取值高度 */
@property (nonatomic, assign) CGFloat jw_height_b;
/** 赋取centerX值 */
@property (nonatomic, assign) CGFloat jw_centerX;
/** 赋取centerY值 */
@property (nonatomic, assign) CGFloat jw_centerY;
/** 赋取origin值 */
@property (nonatomic, assign) CGPoint jw_origin;
/** 赋取size值 */
@property (nonatomic, assign) CGSize jw_size;
/** 获取当前view的UIViewController */
@property (nonatomic, strong, readonly) UIViewController *jw_viewController;
/** 获取当前view的UINavigationController */
@property (nonatomic, strong, readonly) UINavigationController *jw_navigationController;
/** 获取当前view的UITabBarController */
@property (nonatomic, strong, readonly) UITabBarController *jw_tabBarController;
/** 固定角圆角 */
- (void)jw_bezierRoundingCorners:(UIRectCorner)corners cornerRadius:(NSInteger)cornerRadius;

/** 制作截图 */
- (nullable UIImage *)jw_snapshotImage;
/** 制作截图 */
- (nullable UIImage *)jw_snapshotImageAfterScreenUpdates:(BOOL)afterUpdates;
/** 移除子视图 */
- (void)jw_removeAllSubviews;


@end

NS_ASSUME_NONNULL_END
