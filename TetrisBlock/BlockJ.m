//
//  BlockJ.m
//  TetrisBlock
//
//  Created by Connor Kuehnle on 2/23/15.
//  Copyright (c) 2015 SSU. All rights reserved.
//

#import "BlockJ.h"
#import "SingleBlock.h"

@interface BlockJ ()

@property(nonatomic) SingleBlock *square1;
@property(nonatomic) SingleBlock *square2;
@property(nonatomic) SingleBlock *square3;
@property(nonatomic) SingleBlock *square4;

@end

@implementation BlockJ


- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    CGSize size = rect.size;
    CGPoint origin = rect.origin;
    
    CGFloat blockSize = size.width;
    
    CGRect frame1 = CGRectMake(origin.x, origin.y, blockSize, blockSize);
    CGRect frame2 = CGRectMake(origin.x, origin.y + blockSize, blockSize, blockSize);
    CGRect frame3 = CGRectMake(origin.x + blockSize, origin.y + blockSize, blockSize, blockSize);
    CGRect frame4 = CGRectMake(origin.x + blockSize * 2, origin.y + blockSize, blockSize, blockSize);
    
    self.square1 = [[SingleBlock alloc] initWithFrame:frame1];
    self.square2 = [[SingleBlock alloc] initWithFrame:frame2];
    self.square3 = [[SingleBlock alloc] initWithFrame:frame3];
    self.square4 = [[SingleBlock alloc] initWithFrame:frame4];
    
    [self addSubview:self.square1];
    [self addSubview:self.square2];
    [self addSubview:self.square3];
    [self addSubview:self.square4];
    
    [self.square1 setBackgroundColor:[UIColor whiteColor]];
    [self.square2 setBackgroundColor:[UIColor whiteColor]];
    [self.square3 setBackgroundColor:[UIColor whiteColor]];
    [self.square4 setBackgroundColor:[UIColor whiteColor]];

}


@end
