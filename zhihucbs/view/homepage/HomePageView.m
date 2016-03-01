//
//  HomePageView.m
//  zhihucbs
//
//  Created by 陈秉慎 on 2/23/16.
//  Copyright © 2016 陈秉慎. All rights reserved.
//

#import "HomePageView.h"

@implementation HomePageView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.centerX = (SCREENWIDTH - LEFTVIEWWIDTH) / 2;
        self.centerY = SCREENHEIGHT / 2;
        self.panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
        [self addGestureRecognizer:self.panGestureRecognizer];
    }
    return self;
}

- (void)handlePan:(UIPanGestureRecognizer *)recognizer
{
    
    
    CGPoint translation = [recognizer translationInView:self];
    float x = self.center.x + translation.x;

    if (x < _centerX) {
        x = _centerX;
    }
    if (x > (_centerX + LEFTVIEWWIDTH)) {
        x =_centerX + LEFTVIEWWIDTH;
    }
    self.center = CGPointMake(x, _centerY);
    
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        
        [UIView animateWithDuration:0.2 animations:^(void){
            if (x > (_centerX + LEFTVIEWWIDTH/2)) {
                self.center = CGPointMake(_centerX + LEFTVIEWWIDTH, _centerY);
            }else{
                self.center = CGPointMake(_centerX, _centerY);
            }
        }];
    }
    
    [recognizer setTranslation:CGPointZero inView:self];
    
    [self.delegate leftViewAppeared];
}
@end
