//
//  SwipeView.m
//  Wakeup
//
//  Created by shinchen on 13-12-14.
//  Copyright (c) 2013年 Mobile_iOS. All rights reserved.
//

#import "SwipeView.h"

@interface SwipeView ()
@property (nonatomic, assign) CGRect appFrame;
@end

@implementation SwipeView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        int numOfPages = 4;
 
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        _scrollView.contentSize = CGSizeMake(frame.size.width * numOfPages, frame.size.height);
        _scrollView.pagingEnabled = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
		_scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.bounces = YES;
        _scrollView.delegate = self;
        _scrollView.contentInset = UIEdgeInsetsMake(0, 30, 0, 0);
        
        _appFrame = _scrollView.frame;
        
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor whiteColor];
        view.frame = CGRectMake(-30, 0, 30, frame.size.height);
        [_scrollView addSubview:view];
        
        for (int i = 0; i < numOfPages; ++i) {
            UIView *view = [[UIView alloc] init];
            if (i == 0) view.backgroundColor = [UIColor redColor];
            if (i == 1) view.backgroundColor = [UIColor greenColor];
            if (i == 2) view.backgroundColor = [UIColor grayColor];
            if (i == 3) view.backgroundColor = [UIColor yellowColor];
            view.frame = CGRectMake(i * frame.size.width, 0, frame.size.width, frame.size.height);
            [_scrollView addSubview:view];
        }
        
        [self addSubview:_scrollView];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    NSLog(@"normal: %f", scrollView.contentOffset.x);
    if (scrollView.contentOffset.x < -50) {
        NSLog(@"less: %f", scrollView.contentOffset.x);
        self.scrollView.contentOffset = CGPointMake(0, 0);
    }
}

@end
