//
//  SplittingTriangle.m
//  SplittingTriangle
//
//  Created by Sandy Lee on 9/1/14.
//  Copyright (c) 2014 iaomw. All rights reserved.
//

#import "SplittingTriangle.h"

@interface SplittingTriangle ()

@property (nonatomic, strong) CADisplayLink *displayLink;

@property (nonatomic, assign) CGFloat rotateAngle;
@property (nonatomic, assign) CGFloat rotateDelta;

@property (nonatomic, assign) BOOL clockwising;

@property (strong, nonatomic) UIColor *foreColor;

@property (nonatomic, assign) CGFloat ratio;

@end

@implementation SplittingTriangle

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {}
    
    return self;
}

- (void)setForeColor:(UIColor *)foreColor andBackColor:(UIColor*)backColor {
    
    self.foreColor = foreColor;
    
    self.backgroundColor = backColor;
}

# pragma mark - Getter&Setter

- (void)setPaused:(BOOL)paused {
    
    [self.displayLink setPaused:paused];
}

- (CADisplayLink*)displayLink {
    
    if (!_displayLink) {
        
        _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(update:)];
        
        [_displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    }
    
    return _displayLink;
}

- (CGFloat)duration {
    
    if (!_duration) {
        
        return 2.2;
    }
    
    return _duration;
}

- (UIColor*)foreColor {
    
    if (!_foreColor) {
        
        _foreColor = [UIColor whiteColor];
    }
    
    return _foreColor;
}

- (CGFloat)radius {
    
    if (!_radius) {
        
        _radius = 32;
    }
    
    return _radius;
}

- (CGFloat)ratio {
    
    if (!_ratio) {
        
        _ratio = CGFLOAT_MIN;
        
        _clockwising = _clockwise;
    }
    
    return _ratio;
}

# pragma mark - Animation

- (void)update:(CADisplayLink *)displayLink
{
    NSTimeInterval duration = displayLink.duration;
    
    self.rotateDelta = (M_PI/3)/(self.duration/duration);
    self.rotateAngle += _clockwising?_rotateDelta:-_rotateDelta;
    
    CGFloat ratio = fmod(fabs(self.rotateAngle), M_PI/3)/(M_PI/3);
    
    if (self.ratio>ratio) {
        
        self.ratio = ratio;
        
        self.rotateDelta = 0;
        self.rotateAngle = 0;
        
        _clockwising = _clockwise;
        
    } else {
        
        self.ratio = ratio;
        
        [self setNeedsDisplay];
    }
}

- (void)drawRect:(CGRect)rect{

    CGFloat width = rect.size.width;
    CGFloat height = rect.size.height;
    
    CGPoint center = CGPointMake(width/2, height/2);
    
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    
        CGContextSaveGState(contextRef);
        CGContextClearRect(contextRef, rect);
    
    CGContextSetAllowsAntialiasing(contextRef, YES);
    CGContextSetShouldAntialias(contextRef, YES);
    
    CGMutablePathRef originPath = CGPathCreateMutable();
    
    CGFloat cRadius = self.radius*(1+self.ratio);
    
        CGPoint points[3];
    
    for (int i=0; i<3; i++) {
        
        CGFloat angle = M_PI/2+i*M_PI*2/3;
        
        CGSize delta = CGSizeMake(cos(angle)*cRadius, sin(angle)*cRadius);
        
        points[i] = CGPointMake(center.x+delta.width, center.y+delta.height);
    }
    
    CGPathAddLines(originPath, nil, points, 3);
    
    CGPathRef centerPath = createPathRotatedAroundCenter(originPath, center, self.rotateAngle);
    
    CGContextAddPath(contextRef, centerPath);
    
    cRadius*=(1+self.ratio);
    
    for (int i=0; i<3; i++) {
        
        CGFloat angle = M_PI/6 + i*M_PI*2/3 + self.rotateAngle;
        
        CGAffineTransform transform = CGAffineTransformIdentity;
        CGSize delta = CGSizeMake(cos(angle)*cRadius,sin(angle)*cRadius);
        transform = CGAffineTransformTranslate(transform, delta.width, delta.height);
        
    CGPathRef rotated = createPathRotatedAroundCenter(centerPath, center, angle+M_PI/6-self.rotateAngle);
    CGPathRef scaled = createPathScaledAroundCenter(rotated, center, 1-self.ratio);
    CGPathRef transformed = CGPathCreateCopyByTransformingPath(scaled, &transform);
        
        CGContextAddPath(contextRef, transformed);
        
        CGPathRelease(scaled);
        CGPathRelease(rotated);
        CGPathRelease(transformed);
    }
    
    CGPathRelease(originPath);
    CGPathRelease(centerPath);
    
    [self.foreColor setFill];
    
    CGContextFillPath(contextRef);
    CGContextRestoreGState(contextRef);
}

//http://stackoverflow.com/questions/13738364/rotate-cgpath-without-changing-its-position

static CGPathRef createPathRotatedAroundCenter(CGPathRef path, CGPoint center, CGFloat radians) {
    
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    transform = CGAffineTransformTranslate(transform, center.x, center.y);
    transform = CGAffineTransformRotate(transform, radians);
    transform = CGAffineTransformTranslate(transform, -center.x, -center.y);
    
    return CGPathCreateCopyByTransformingPath(path, &transform);
}

static CGPathRef createPathScaledAroundCenter(CGPathRef path, CGPoint center, CGFloat ratio) {
    
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    transform = CGAffineTransformTranslate(transform, center.x, center.y);
    transform = CGAffineTransformScale(transform, ratio, ratio);
    transform = CGAffineTransformTranslate(transform, -center.x, -center.y);
    
    return CGPathCreateCopyByTransformingPath(path, &transform);
}

@end
