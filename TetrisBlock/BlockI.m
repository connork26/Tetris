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

@property(nonatomic) UIColor * color;



@end

@implementation BlockI


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    [super drawRect:rect];
    CGSize size = rect.size;
    CGPoint origin = rect.origin;
    
    CGFloat blockSize = size.width;
    
    CGRect rect1 =  CGRectMake(origin.x, origin.y, blockSize, blockSize);
    self.square1 = [[SingleBlock alloc] initWithFrame:rect1];
    
    CGRect rect2 = CGRectMake(origin.x, origin.y+blockSize, blockSize, blockSize);
    self.square2 = [[SingleBlock alloc] initWithFrame:rect2];
    
    CGRect rect3 = CGRectMake(origin.x, origin.y+(blockSize*2), blockSize, blockSize);
    self.square3 = [[SingleBlock alloc] initWithFrame:rect3];
    
    CGRect rect4 = CGRectMake(origin.x, origin.y+(blockSize*3), blockSize, blockSize);
    self.square4 = [[SingleBlock alloc] initWithFrame:rect4];
    
    
    [self addSubview:self.square1];
    [self addSubview:self.square2];
    [self addSubview:self.square3];
    [self addSubview:self.square4];
    
    [self.square1 setBackgroundColor:[UIColor whiteColor]];
    [self.square2 setBackgroundColor:[UIColor whiteColor]];
    [self.square3 setBackgroundColor:[UIColor whiteColor]];
    [self.square4 setBackgroundColor:[UIColor whiteColor]];
    
    [self.square1 setColor:[UIColor colorWithRed:67 green:198 blue:219 alpha:0]];
    [self.square2 setColor:[UIColor colorWithRed:67 green:198 blue:219 alpha:0]];
    [self.square3 setColor:[UIColor colorWithRed:67 green:198 blue:219 alpha:0]];
    [self.square4 setColor:[UIColor colorWithRed:67 green:198 blue:219 alpha:0]];
}

+(BlockI *) initWithFrame: (CGRect *) frame andColor: (UIColor *) inColor{
    self->color = inColor;

}



@end
