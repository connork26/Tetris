//
//  ViewController.m
//  TetrisBlock
//
//  Created by AAK on 2/23/15.
//  Copyright (c) 2015 SSU. All rights reserved.
//

#import "ViewController.h"
#import "SingleBlock.h"

/*
 Launch the app and then tap on the display. The square that is displayed will start moving
 down. While in motion, a right swipe stops the downward move, moves the square right,
 and then resumes moving downward again.
 */

@interface ViewController () {
    CGPoint blockInitCenter;
    NSInteger blockWidth;
}

@property(nonatomic) UITapGestureRecognizer *tapGesture;
@property(nonatomic) SingleBlock *squareShape;
@property(nonatomic) SingleBlock *squareShape2;
@property BOOL inMotion;
@property(nonatomic) UISwipeGestureRecognizer *rightSwipe;
@property(nonatomic) UIView *blockView;

@end

const NSInteger downAnimationInitDuration = 5.0;
const NSInteger sideAnimationDuration = 1.0;
const CGFloat margins = 10.0;
const NSInteger widthInBlocks = 10;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect appFrame = [[UIScreen mainScreen] applicationFrame];
    NSInteger gameViewWidth = (appFrame.size.width - 2 * margins);
    blockWidth = gameViewWidth / widthInBlocks;
    
    NSInteger width = blockWidth, height = width;
    
    CGRect frame = CGRectMake(margins, 50, width, height);
    self.squareShape = [[SingleBlock alloc] initWithFrame:frame];
    [self.squareShape setBackgroundColor:[UIColor clearColor]];
    blockInitCenter = self.squareShape.center;
    
    self.blockView = [[UIView alloc] initWithFrame: self.squareShape.frame];
    [self.blockView addSubview:self.squareShape];
    
    [self.view addSubview:self.blockView];
    
    CGRect frame2 = CGRectMake(blockWidth + margins, 50, width, height);
    self.squareShape2 = [[SingleBlock alloc] initWithFrame:frame2];
    [self.squareShape2 setBackgroundColor:[UIColor clearColor]];
    
    [self.blockView addSubview:self.squareShape2];
    
    self.tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [self.view addGestureRecognizer:self.tapGesture];
    self.inMotion = NO;
    
    self.rightSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipeRight:)];
    [self.rightSwipe setDirection:UISwipeGestureRecognizerDirectionRight];
    [self.view addGestureRecognizer:self.rightSwipe];
}


-(void) didSwipeRight: (UISwipeGestureRecognizer *) sender
{
    CALayer *layer = self.squareShape.layer;
    CFTimeInterval pausedTime = [layer convertTime:CACurrentMediaTime() fromLayer:nil];
    
    layer.speed = 0.0;
    layer.timeOffset = pausedTime;
    CGPoint center = self.blockView.center;
    center.x += blockWidth;
    [UIView animateWithDuration: sideAnimationDuration animations:^{
        self.blockView.center = center;
    } completion:^(BOOL finished) {
        CFTimeInterval pausedTime = [layer timeOffset];
        layer.speed = 1.0;
        layer.timeOffset = 0.0;
        layer.beginTime = 0.0;
        CFTimeInterval timeSincePause = [layer convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
        layer.beginTime = timeSincePause;
    }];
    
    NSLog(@"left swipe");
}

-(void) handleTap: (UITapGestureRecognizer *) sender
{
    if( self.inMotion ) {
        return;
    }
    self.inMotion = YES;
    self.squareShape.center = blockInitCenter;
    CGPoint center = self.squareShape.center;
    CGPoint newCenter = CGPointMake(center.x, center.y + 350);
    [UIView animateWithDuration: downAnimationInitDuration delay:0.0
                        options:UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         self.squareShape.center = newCenter;
                     } completion:^(BOOL finished) {
                         NSLog(@"Animation complete with status: %@", @(finished));
                         [self.view removeGestureRecognizer:self.rightSwipe];
                         [self.view removeGestureRecognizer:self.tapGesture];
                     }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
