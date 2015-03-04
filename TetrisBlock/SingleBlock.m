//
//  SingleBlock.m
//  TetrisBlock
//
//  Created by AAK on 2/23/15.
//  Copyright (c) 2015 SSU. All rights reserved.
//

#import "SingleBlock.h"

@interface SingleBlock ()

@property (nonatomic) UIBezierPath * path;
@property (nonatomic) UIColor * blockColor;

@end

@implementation SingleBlock

-(void) drawRect:(CGRect)rect
{
    [super drawRect:rect];
    self.path = [[UIBezierPath alloc] init];
    self.path.lineWidth = 1.0;
    
    NSInteger radius = 5;
    
    /*
     rect.origin.x += 0.5;
     rect.origin.y += 0.5;
     rect.size.width -= 1.0;
     rect.size.height -= 1.0;
     */
    CGSize size = rect.size;
    CGPoint origin = rect.origin;
    
    
    CGPoint topLeft = CGPointMake(origin.x + radius, origin.y);
    
    [self.path moveToPoint: topLeft];
    
    
    CGPoint topRight = CGPointMake(origin.x + size.width - radius, origin.y);
    CGPoint topRightCenter = CGPointMake( topRight.x, topRight.y + radius);
    [self.path addLineToPoint: topRight];
    [self.path addArcWithCenter:topRightCenter radius:radius startAngle: - M_PI / 2.0 endAngle: 0  clockwise:YES];
    
    CGPoint bottomRight = CGPointMake(origin.x + size.width, origin.x + size.height - radius);
    CGPoint bottomRightCenter = bottomRight; bottomRightCenter.x -= radius;
    [self.path addLineToPoint: bottomRight];
    [self.path addArcWithCenter:bottomRightCenter radius:radius startAngle: 0 endAngle:M_PI /2.0 clockwise:YES];
    
    CGPoint bottomLeft = CGPointMake(origin.x + radius, origin.x + size.height);
    [self.path addLineToPoint: bottomLeft];
    CGPoint bottomLeftCenter = bottomLeft; bottomLeftCenter.y -= radius;
    [self.path addArcWithCenter:bottomLeftCenter radius:radius startAngle: M_PI / 2.0 endAngle: M_PI clockwise:YES];
    [self.path stroke];
    
    topLeft.x -= radius;
    topLeft.y += radius;
    [self.path addLineToPoint: topLeft];
    CGPoint topLeftCenter = topLeft; topLeftCenter.x += radius;
    [self.path addArcWithCenter:topLeftCenter radius:radius startAngle: M_PI endAngle: M_PI + M_PI / 2.0 clockwise:YES];
    
    [self.blockColor setFill];
    [[UIColor whiteColor] setStroke];
    
    [self.path fill];
    [self.path stroke];
}

-(void) setColor:(UIColor *)inColor{
    self.blockColor = inColor;
    
    
//    [[UIColor blueColor] setFill];
//    [self.path fill];
}
@end
