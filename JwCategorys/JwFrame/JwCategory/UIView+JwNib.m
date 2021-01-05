//
//  UIView+JwNib.m
//  JwCategorys
//
//  Created by 陈警卫 on 2020/12/29.
//

#import "UIView+JwNib.h"

@implementation UIView (JwNib)

+ (instancetype)jw_createViewFromNib{
    return [self jw_createViewFromNibName:NSStringFromClass(self.class)];
}

+ (instancetype)jw_createViewFromNibName:(NSString *)nibName{
    NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:nibName owner:self options:nil];
    return [nibs firstObject];
}

@end
