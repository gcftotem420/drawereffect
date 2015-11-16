//
//  BQHerderView.h
//  DrawerEffect
//
//  Created by 郭晨风 on 15/11/12.
//  Copyright © 2015年 郭晨风. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BQHerderViewDelegate <NSObject>

-(void)changeRowHeight:(UIButton *)sender;

@end

@interface BQHerderView : UIView
@property(nonatomic,assign) BOOL on;
@property(nonatomic,strong) UIButton *btn;
@property(nonatomic,strong) NSMutableArray *names;
@property(nonatomic,weak) id <BQHerderViewDelegate> delegate;

-(id)initWithName:(NSString *)name andFrame:(CGRect) frame;

+(BQHerderView *)herderViewWithName:(NSString *)name andFrame:(CGRect) frame;

@end
