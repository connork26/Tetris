//
//  SingleBlock.m
//  TetrisBlock
//
//  Created by AAK on 2/23/15.
//  Copyright (c) 2015 SSU. All rights reserved.
//

#import "SingleBlock.h"

@implementation SingleBlock

-(void) drawRect:(CGRect)rect
{
    [super drawRect:rect];
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [[UIColor orangeColor] setStroke];
    path.lineWidth = 1.0;
    
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
    
    [path moveToPoint: topLeft];
    
    
    CGPoint topRight = CGPointMake(origin.x + size.width - radius, origin.y);
    CGPoint topRightCenter = CGPointMake( topRight.x, topRight.y + radius);
    [path addLineToPoint: topRight];
    [path addArcWithCenter:topRightCenter radius:radius startAngle: - M_PI / 2.0 endAngle: 0  clockwise:YES];
    
    CGPoint bottomRight = CGPointMake(origin.x + size.width, origin.x + size.height - radius);
    CGPoint bottomRightCenter = bottomRight; bottomRightCenter.x -= radius;
    [path addLineToPoint: bottomRight];
    [path addArcWithCenter:bottomRightCenter radius:radius startAngle: 0 endAngle:M_PI /2.0 clockwise:YES];
    
    CGPoint bottomLeft = CGPointMake(origin.x + radius, origin.x + size.height);
    [path addLineToPoint: bottomLeft];
    CGPoint bottomLeftCenter = bottomLeft; bottomLeftCenter.y -= radius;
    [path addArcWithCenter:bottomLeftCenter radius:radius startAngle: M_PI / 2.0 endAngle: M_PI clockwise:YES];
    [path stroke];
    
    topLeft.x -= radius;
    topLeft.y += radius;
    [path addLineToPoint: topLeft];
    CGPoint topLeftCenter = topLeft; topLeftCenter.x += radius;
    [path addArcWithCenter:topLeftCenter radius:radius startAngle: M_PI endAngle: M_PI + M_PI / 2.0 clockwise:YES];
    
    [[UIColor orangeColor] setFill];
    [[UIColor blackColor] setStroke];
    
    [path fill];
    [path stroke];
}

@end
