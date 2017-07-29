//
//  FLLoadingView.m
//  Bigeyes
//
//  Created by 红沙尘 on 17/5/10.
//  Copyright © 2017年 红沙尘. All rights reserved.
//

#import "FLLoadingView.h"
#import <CMLToastView/ToastSupport.h>
#import "CMLViewController.h"

#define FLLoad_Window_Tag 12032970
#define CenterX_Leftt self.frame.size.width/2 - 20
#define CenterX_Right self.frame.size.width/2 + 20

@interface FLLoadingView ()<CustomToastViewDelegate>
    
@property (nonatomic, strong) UILabel *messageLabel;

@end

@implementation FLLoadingView {
    BOOL isFinished;
    UIView *leftView;
    UIView *rightView;
    NSTimer *timer;
    UILabel * label;
    int moveDir;
}
    
- (void)dealloc {
    NSLog(@"%s",__FUNCTION__);
}
    
- (id)init {
    self = [self initWithFrame:[UIApplication sharedApplication].delegate.window.bounds];
    if (self) {
        self.backgroundColor = [UIColor blackColor];
        self.userInteractionEnabled = NO;
        self.alpha = 0.5;
    }
    return self;
}
    
#pragma mark - private
    
- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        moveDir = 1;
        
        leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
        leftView.layer.cornerRadius  = 5;
        leftView.layer.masksToBounds = YES;
        CGPoint leftPoint = CGPointMake(CenterX_Leftt, self.frame.size.height/2);
        leftView.center = leftPoint;
        leftView.backgroundColor = [UIColor blueColor];
        [self addSubview:leftView];
        
        rightView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
        rightView.layer.cornerRadius  = 5;
        rightView.layer.masksToBounds = YES;
        CGPoint rightPoint = CGPointMake( CenterX_Right,self.frame.size.height/2);
        rightView.center = rightPoint;
        rightView.backgroundColor = [UIColor purpleColor];
        [self addSubview:rightView];
        
        label = [[UILabel alloc] initWithFrame:CGRectMake(15, frame.size.height/2 + 10,frame.size.width - 30, 20)];
        label.font = [UIFont systemFontOfSize:14];
        label.numberOfLines = 0;
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor redColor];
        [self addSubview:label];
        
        self.messageLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.messageLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.messageLabel];
        self.messageLabel.backgroundColor = [UIColor blackColor];
        self.messageLabel.alpha = 0.5;
        self.messageLabel.textColor = [UIColor whiteColor];
        
        timer = [NSTimer scheduledTimerWithTimeInterval:1.0f/60.0f
                                                 target:self
                                               selector:@selector(updateAnimation)
                                               userInfo:nil
                                                repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    }
    return self;
}
    
- (void)addAnimationToView:(UIView *)view {
    if (isFinished) return;
    [UIView animateWithDuration:1 animations:^{
        if (view.center.x == CenterX_Leftt) {
            CGPoint point = CGPointMake(CenterX_Right, view.center.y);
            view.center = point;
        } else {
            CGPoint point = CGPointMake(CenterX_Leftt, view.center.y);
            view.center = point;
        }
    } completion:^(BOOL finished) {
        [self addAnimationToView:view];
    }];
}
    
- (void)updateAnimation {
    CGPoint leftPoint = CGPointMake(moveDir*0.8 + leftView.center.x, leftView.center.y);
    leftView.center = leftPoint;
    CGPoint rightPoint = CGPointMake(-moveDir*0.8 + rightView.center.x, rightView.center.y);
    rightView.center = rightPoint;
    if (moveDir == 1) {
        leftView.center = CGPointMake(MIN(leftView.center.x, CenterX_Right), leftView.center.y) ;
        rightView.center = CGPointMake(MAX(rightView.center.x, CenterX_Leftt),rightView.center.y) ;
    } else if (moveDir == -1) {
        leftView.center = CGPointMake(MAX(leftView.center.x, CenterX_Leftt),leftView.center.y) ;;
        rightView.center = CGPointMake(MIN(rightView.center.x, CenterX_Right),rightView.center.y) ;
    }
    if (leftView.center.x == CenterX_Leftt) {
        moveDir = 1;
    } else if (leftView.center.x == CenterX_Right) {
        moveDir = -1;
    }
}
    
- (void)stopAnimation {
    [timer invalidate];
    timer = nil;
    [self removeFromSuperview];
}
    
#pragma mark customToastViewDelegate 
    
- (UIView *)toastViewWithLoadingTitle:(NSString *)title subTitle:(NSString *)subTitle context:(void *)context {
    label.text = title;
    return self;
}
    
- (UIView *)toastViewWithTitle:(NSString *)title subTitle:(NSString *)subTitle context:(void *)context {
    UIViewController *vc = (__bridge UIViewController *)(context);
    vc.view.backgroundColor = [UIColor yellowColor];
    UILabel *toastLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.frame) - 50, CGRectGetWidth(self.frame), 50)];
    toastLabel.backgroundColor = [[UIColor greenColor] colorWithAlphaComponent:0.5];
    toastLabel.textColor = [UIColor redColor];
    toastLabel.text = title;
    return toastLabel;
}
    
- (void)toastViewCompletionWithContext:(void *)context{
    [self stopAnimation];
}
    
- (UIView *)toastViewSuccessWithTitle:(NSString *)title context:(void *)context{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    view.backgroundColor = [UIColor purpleColor];
    UILabel *successLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    successLabel.text = @"这一个成功的toast";
    successLabel.numberOfLines = 0;
    [view addSubview:successLabel];
    return view;
}
    
- (UIView *)toastViewErrorWithTitle:(NSString *)title context:(void *)context{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100,100, 100, 100)];
    view.backgroundColor = [UIColor redColor];
    UILabel *errorLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    errorLabel.numberOfLines = 0;
    errorLabel.text = @"这是一个失败的toast";
    [view addSubview:errorLabel];
    return view;
}
    
@end
