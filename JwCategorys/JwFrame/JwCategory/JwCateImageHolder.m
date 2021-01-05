//
//  JwCateImageHolder.m
//  JwCategorys
//
//  Created by 陈警卫 on 2020/12/28.
//

#import "JwCateImageHolder.h"
#import "UIView+JwCate.h"
#import "UIColor+JwCate.h"

@implementation JwCateImageHolder

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = kJwColorHexString(@"#F6F5F5");
        self.jw_holderView = [[UIImageView alloc] init];
        self.jw_holderView.contentMode = UIViewContentModeScaleAspectFit;
        self.jw_holderView.image = [UIImage imageNamed:@"hud_image_loading"];
        [self addSubview:self.jw_holderView];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    //图片比例103/40
    CGFloat w = self.jw_width * 0.6;
    CGFloat h = self.jw_height * 0.6;
    CGFloat v = w > h ? h : w;
    self.jw_holderView.frame = CGRectMake(0, 0, v, v);
    self.jw_holderView.center = self.center;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
