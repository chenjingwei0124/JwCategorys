//
//  UIButton+JwCate.m
//  JwCategorys
//
//  Created by 陈警卫 on 2020/12/24.
//

#import "UIButton+JwCate.h"
#import <objc/runtime.h>

@implementation UIButton (JwCate)

static char buttonActionTag;

/**
 *  button 添加点击事件
 */
- (void)jw_addTargetAction:(didButtonActionBlock)block{
    objc_setAssociatedObject(self, &buttonActionTag, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
}

/**
 *  button 添加事件
 */
- (void)jw_addTargetAction:(didButtonActionBlock)block forControlEvents:(UIControlEvents)controlEvents{
    objc_setAssociatedObject(self, &buttonActionTag, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(buttonAction:) forControlEvents:controlEvents];
}

/**
 *  button 事件的响应方法
 */
- (void)buttonAction:(id)sender {
    didButtonActionBlock blockAction = (didButtonActionBlock)objc_getAssociatedObject(self, &buttonActionTag);
    if (blockAction) {
        blockAction(self);
    }
}

@end
