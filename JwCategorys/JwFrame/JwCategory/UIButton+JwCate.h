//
//  UIButton+JwCate.h
//  JwCategorys
//
//  Created by 陈警卫 on 2020/12/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^didButtonActionBlock)(UIButton* button);

@interface UIButton (JwCate)

/**
 *  button 添加点击事件
 */
- (void)jw_addTargetAction:(didButtonActionBlock)block;

/**
 *  button 添加事件
 */
- (void)jw_addTargetAction:(didButtonActionBlock)block forControlEvents:(UIControlEvents)controlEvents;

@end

NS_ASSUME_NONNULL_END
