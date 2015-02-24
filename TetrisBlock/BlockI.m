//
//  BlockI.m
//  TetrisBlock
//
//  Created by Connor Kuehnle on 2/23/15.
//  Copyright (c) 2015 SSU. All rights reserved.
//

#import "BlockI.h"
#import "SingleBlock.h"
#import "Shape.h"

@interface BlockI() {

}

@property(nonatomic) SingleBlock *square1;
@property(nonatomic) SingleBlock *square2;
@property(nonatomic) SingleBlock *square3;
@property(nonatomic) SingleBlock *square4;

@property(nonatomic) UIView *blockView;



@end

@implementation BlockI


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
}


@end
