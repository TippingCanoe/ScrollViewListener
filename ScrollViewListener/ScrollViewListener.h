//
//  ScrollViewListener.h
//  ScrollViewListener
//
//  Created by Sudeep Sidhu on 3/13/2014.
//  Copyright (c) 2014 Tipping Canoe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ScrollViewListener : NSObject{
    NSMutableArray *listeners;
}

@property (nonatomic,copy) void(^listenBlock)(UIScrollView *scrollView, CGFloat distanceToTop, CGFloat distanceToBottom);
@property (nonatomic,strong) UIScrollView *scrollView;

- (id)initWithScrollView:(UIScrollView *)sv;
- (void)addListener:(void (^)(UIScrollView *scrollView, CGFloat distanceToTop, CGFloat distanceToBottom))listenBlock;

@end
