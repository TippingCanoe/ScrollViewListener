//
//  UIScrollView+ScrollViewListener.m
//  ScrollViewListener
//
//  Created by Sudeep Sidhu on 3/13/2014.
//  Copyright (c) 2014 Tipping Canoe. All rights reserved.
//

#import "UIScrollView+ScrollViewListener.h"
#import "ScrollViewListener.h"
#import <objc/runtime.h>

@implementation UIScrollView (ScrollViewListener)

- (void)svl_setScrollViewListnerWithBlock:(void(^)(UIScrollView *scrollView, CGFloat distanceToTop, CGFloat distanceToBottom))block{
    
    ScrollViewListener *listener = [[ScrollViewListener alloc] initWithScrollView:self];
    [listener addListener:block];
    
    objc_setAssociatedObject(self, @selector(svl_scrollViewListener), listener, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (ScrollViewListener *)svl_scrollViewListener{
    return objc_getAssociatedObject(self, @selector(svl_scrollViewListener));
}

@end
