//
//  SplittingTriangle.h
//  SplittingTriangle
//
//  Created by Sandy Lee on 9/1/14.
//  Copyright (c) 2014 iaomw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SplittingTriangle : UIView

@property(getter=isPaused, nonatomic) BOOL paused;

@property (assign, nonatomic) CGFloat duration;
@property (assign, nonatomic) BOOL clockwise;

// radius of the circle containing the central triangle

@property (assign, nonatomic) CGFloat radius;

- (void)setForeColor:(UIColor *)foreColor andBackColor:(UIColor*)backColor;

@end
