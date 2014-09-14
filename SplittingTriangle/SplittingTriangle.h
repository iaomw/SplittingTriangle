//
//  SplittingTriangle.h
//  SplittingTriangle
//
//  Created by Sandy Lee on 9/1/14.
//  Copyright (c) 2014 iaomw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SplittingTriangle : UIView

@property (assign, nonatomic) CGFloat duration;
@property (assign, nonatomic) BOOL clockwise;
@property (assign, nonatomic) CGFloat radius;

- (void)setForeColor:(UIColor *)foreColor andBackColor:(UIColor*)backColor;

@end
