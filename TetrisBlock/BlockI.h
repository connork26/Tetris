//
//  BlockI.h
//  TetrisBlock
//
//  Created by Connor Kuehnle on 2/23/15.
//  Copyright (c) 2015 SSU. All rights reserved.
//

#import "Shape.h"

@interface BlockI : Shape

- (void)drawRect:(CGRect)rect;
+(BlockI *) initWithFrame: (CGRect *) frame andColor: (UIColor *) color;


@end
