//
//  OutlineLabel.m
//  zhihucbs
//
//  Created by 陈秉慎 on 1/18/16.
//  Copyright © 2016 陈秉慎. All rights reserved.
//

#import "OutlineLabel.h"

@implementation OutlineLabel
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.textColor = [UIColor blackColor];
        self.numberOfLines = 0;
    }
    return self;
}

- (void)drawTextInRect:(CGRect)rect {
    
    CGSize shadowOffset = self.shadowOffset;
    UIColor *textColor = self.textColor;
    
    CGContextRef ref = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(ref, 1);
    CGContextSetLineJoin(ref, kCGLineJoinRound);
    
    CGContextSetTextDrawingMode(ref, kCGTextStroke);
    //color
    self.textColor = [UIColor blackColor];
    [super drawTextInRect:rect];
    
    CGContextSetTextDrawingMode(ref, kCGTextFill);
    self.textColor = textColor;
    self.shadowOffset = CGSizeMake(0, 0);
    [super drawTextInRect:rect];
    self.shadowOffset = shadowOffset;
    
}
@end
