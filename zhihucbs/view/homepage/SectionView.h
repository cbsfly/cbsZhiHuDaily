//
//  SectionView.h
//  zhihucbs
//
//  Created by 陈秉慎 on 1/19/16.
//  Copyright © 2016 陈秉慎. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SectionView : UIView
@property (nonatomic, strong) ZHLabel *dateLb;
- (void)setDate:(NSString *)dateStr;
@end
