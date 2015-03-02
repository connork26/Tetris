//
//  Shape.h
//  TetrisBlock
//
//  Created by Connor Kuehnle on 2/23/15.
//  Copyright (c) 2015 SSU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Shape : UIView

- (void)drawRect:(CGRect)rect;
+(Shape *) initWithFrame: (CGRect *) frame andColor: (UIColor *) color;


@end
