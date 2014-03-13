//
//  UIScrollView+ScrollViewListener.h
//  ScrollViewListener
//
//  Created by Sudeep Sidhu on 3/13/2014.
//  Copyright (c) 2014 Tipping Canoe. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ScrollViewListener;
@interface UIScrollView (ScrollViewListener)

- (void)svl_setScrollViewListnerWithBlock:(void(^)(UIScrollView *scrollView, CGFloat distanceToTop, CGFloat distanceToBottom))block;
- (ScrollViewListener *)svl_scrollViewListener;

@end
