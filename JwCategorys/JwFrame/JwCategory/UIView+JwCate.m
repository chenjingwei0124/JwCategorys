//
//  UIView+JwCate.m
//  JwCategorys
//
//  Created by 陈警卫 on 2020/12/15.
//

#import "UIView+JwCate.h"

@implementation UIView (JwCate)

/** 取x值 */
- (CGFloat)jw_x{
    return self.frame.origin.x;
}
/** 赋x值 */
- (void)setJw_x:(CGFloat)jw_x{
    CGRect frame = self.frame;
    frame.origin.x = jw_x;
    self.frame = frame;
}
/** 取y值 */
- (CGFloat)jw_y{
    return self.frame.origin.y;
}
/** 赋y值 */
- (void)setJw_y:(CGFloat)jw_y{
    CGRect frame = self.frame;
    frame.origin.y = jw_y;
    self.frame = frame;
}
/** 固定控件x值 取值右边值 */
- (CGFloat)jw_right{
    return self.frame.origin.x + self.frame.size.width;
}
/** 固定控件x值 赋值右边值 */
- (void)setJw_right:(CGFloat)jw_right{
    CGRect frame = self.frame;
    frame.size.width = jw_right - frame.origin.x;
    self.frame = frame;
}
/** 固定控件y值 取值下边值 */
- (CGFloat)jw_bottom{
    return self.frame.origin.y + self.frame.size.height;
}
/** 固定控件y值 赋值下边值 */
- (void)setJw_bottom:(CGFloat)jw_bottom{
    CGRect frame = self.frame;
    frame.size.height = jw_bottom - frame.origin.y;
    self.frame = frame;
}
/** 固定控件宽度 取值右边值 */
- (CGFloat)jw_right_x{
    return self.frame.origin.x + self.frame.size.width;
}
/** 固定控件宽度 赋值右边值 */
- (void)setJw_right_x:(CGFloat)jw_right_x{
    CGRect frame = self.frame;
    frame.origin.x = jw_right_x - frame.size.width;
    self.frame = frame;
}
/** 固定控件高度 取值下边值 */
- (CGFloat)jw_bottom_y{
    return self.frame.origin.y + self.frame.size.height;
}
/** 固定控件高度 赋值下边值 */
- (void)setJw_bottom_y:(CGFloat)jw_bottom_y{
    CGRect frame = self.frame;
    frame.origin.y = jw_bottom_y - frame.size.height;
    self.frame = frame;
}
/** 取width值 */
- (CGFloat)jw_width{
    return self.frame.size.width;
}
/** 赋width值 */
- (void)setJw_width:(CGFloat)jw_width{
    CGRect frame = self.frame;
    frame.size.width = jw_width;
    self.frame = frame;
}
/** 取height值 */
- (CGFloat)jw_height{
    return self.frame.size.height;
}
/** 赋height值 */
- (void)setJw_height:(CGFloat)jw_height{
    CGRect frame = self.frame;
    frame.size.height = jw_height;
    self.frame = frame;
}
/** 固定控件右边 取值宽度 */
- (CGFloat)jw_width_r{
    return self.frame.size.width;
}
/** 固定控件右边 赋值宽度 */
- (void)setJw_width_r:(CGFloat)jw_width_r{
    CGRect frame = self.frame;
    frame.origin.x = frame.origin.x - (jw_width_r - frame.size.width);
    frame.size.width = jw_width_r;
    self.frame = frame;
}
/** 固定控件底边 取值高度 */
- (CGFloat)jw_height_b{
    return self.frame.size.height;
}
/** 固定控件底边 赋值高度 */
- (void)setJw_height_b:(CGFloat)jw_height_b{
    CGRect frame = self.frame;
    frame.origin.y = frame.origin.y - (jw_height_b - frame.size.height);
    frame.size.width = jw_height_b;
    self.frame = frame;
}
/** 取centerX值 */
- (CGFloat)jw_centerX{
    return self.center.x;
}
/** 赋centerX值 */
- (void)setJw_centerX:(CGFloat)jw_centerX{
    self.center = CGPointMake(jw_centerX, self.center.y);
}
/** 取centerY值 */
- (CGFloat)jw_centerY{
    return self.center.y;
}
/** 赋centerY值 */
- (void)setJw_centerY:(CGFloat)jw_centerY{
    self.center = CGPointMake(self.center.x, jw_centerY);
}
/** 取origin值 */
- (CGPoint)jw_origin{
    return self.frame.origin;
}
/** 赋origin值 */
- (void)setJw_origin:(CGPoint)jw_origin{
    CGRect frame = self.frame;
    frame.origin = jw_origin;
    self.frame = frame;
}
/** 取size值 */
- (CGSize)jw_size{
    return self.frame.size;
}
/** 赋size值 */
- (void)setJw_size:(CGSize)jw_size{
    CGRect frame = self.frame;
    frame.size = jw_size;
    self.frame = frame;
}
/** 获取当前view的UIViewController */
- (UIViewController *)jw_viewController{
    UIResponder *responder = self;
    while ((responder = [responder nextResponder])) {
        if ([responder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)responder;
        }
    }
    return nil;
}
/** 获取当前view的UINavigationController */
- (UINavigationController *)jw_navigationController{
    for (UIView *next = [self superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UINavigationController class]]) {
            return (UINavigationController *)nextResponder;
        }
    }
    return nil;
}
/** 获取当前view的UITabBarController */
- (UITabBarController *)jw_tabBarController{
    for (UIView *next = [self superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UITabBarController class]]) {
            return (UITabBarController *)nextResponder;
        }
    }
    return nil;
}

/** 固定角圆角 */
- (void)jw_bezierRoundingCorners:(UIRectCorner)corners cornerRadius:(NSInteger)cornerRadius{
    [self layoutIfNeeded];
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:CGSizeMake(cornerRadius,cornerRadius)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

/** 制作截图 */
- (nullable UIImage *)jw_snapshotImage{
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, 0);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *snap = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return snap;
}
/** 制作截图 */
- (nullable UIImage *)jw_snapshotImageAfterScreenUpdates:(BOOL)afterUpdates{
    if (![self respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)]) {
        return [self jw_snapshotImage];
    }
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, 0);
    [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:afterUpdates];
    UIImage *snap = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return snap;
}
/** 移除子视图 */
- (void)jw_removeAllSubviews{
    //[self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    while (self.subviews.count) {
        [self.subviews.lastObject removeFromSuperview];
    }
}

@end
