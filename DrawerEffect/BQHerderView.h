//
//  BQHerderView.h
//  DrawerEffect
//
//  Created by 郭晨风 on 15/11/12.
//  Copyright © 2015年 郭晨风. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BQHerderViewDelegate <NSObject>

-(void)changeRowHeight;

@end

@interface BQHerderView : UIView
@property(nonatomic,assign) BOOL on;
@property(nonatomic,strong) UIButton *btn;
@property(nonatomic,weak) id <BQHerderViewDelegate> delegate;

@end
