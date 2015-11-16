//
//  BQHerderView.m
//  DrawerEffect
//
//  Created by 郭晨风 on 15/11/12.
//  Copyright © 2015年 郭晨风. All rights reserved.
//

#import "BQHerderView.h"

@implementation BQHerderView

#pragma mark - 初始化的方法

-(id)initWithName:(NSString *)name andFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.names = [NSMutableArray array];
        self.on = YES;
        self.btn = [UIButton buttonWithType:UIButtonTypeSystem];
        self.btn.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
        [self.btn setTitle:name forState:UIControlStateNormal];
        self.btn.backgroundColor = [UIColor cyanColor];
        [self.btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.btn];
    }
    return self;
}

#pragma mark - btn点击执行的方法

-(void)btnClick:(UIButton *)sender
{
    [self.delegate changeRowHeight:sender];
}

#pragma mark - 初始化的工厂方法

+(BQHerderView *)herderViewWithName:(NSString *)name andFrame:(CGRect)frame
{
    return [[BQHerderView alloc] initWithName:name andFrame:frame];
}


@end
