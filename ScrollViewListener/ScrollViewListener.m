//
//  ScrollViewListener.m
//  ScrollViewListener
//
//  Created by Sudeep Sidhu on 3/13/2014.
//  Copyright (c) 2014 Tipping Canoe. All rights reserved.
//

#import "ScrollViewListener.h"

@implementation ScrollViewListener

typedef void (^PageScrollListenerBlock)(UIScrollView *scrollView, CGFloat distanceToTop, CGFloat distanceToBottom);

- (id)initWithScrollView:(UIScrollView *)sv{
    self = [super init];
    
    if (self) {
        [self setScrollView:sv];
        listeners = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)setScrollView:(UIScrollView *)scrollView{
    [self removeObserverAndListeners];
    _scrollView = scrollView;
    [_scrollView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)addListener:(void (^)(UIScrollView *scrollView, CGFloat distanceToTop, CGFloat distanceToBottom))listenBlock{
    
    if (listenBlock) {
        PageScrollListenerBlock newBlock = [listenBlock copy];
        [listeners addObject:newBlock];
    }
}

- (void)removeObserverAndListeners{
    [_scrollView removeObserver:self forKeyPath:@"contentOffset"];
    [listeners removeAllObjects];
}

- (void)dealloc{
    [self removeObserverAndListeners];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if(([keyPath isEqualToString:@"contentOffset"]) && object == _scrollView){
        
        CGFloat distToBottom = _scrollView.contentSize.height - (_scrollView.contentOffset.y + _scrollView.frame.size.height + _scrollView.contentInset.bottom);
        CGFloat distToTop = _scrollView.contentOffset.y + _scrollView.contentInset.top;
        
        for (PageScrollListenerBlock block in listeners) {
            block(object, distToTop, distToBottom);
        }
    }
}


@end
