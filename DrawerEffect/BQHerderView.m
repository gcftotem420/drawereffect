//
//  BQHerderView.m
//  DrawerEffect
//
//  Created by 郭晨风 on 15/11/12.
//  Copyright © 2015年 郭晨风. All rights reserved.
//

#import "BQHerderView.h"

@implementation BQHerderView


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

-(void)btnClick:(UIButton *)sender
{
    [self.delegate changeRowHeight:sender];
}

+(BQHerderView *)herderViewWithName:(NSString *)name andFrame:(CGRect)frame
{
    return [[BQHerderView alloc] initWithName:name andFrame:frame];
}


@end
