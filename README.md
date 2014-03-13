ScrollViewListener
==================

Block based observing of a UIScrollView's contentOffset

## Usage

```objective-c
[vc.collectionView svl_setScrollViewListenerWithBlock:^(UIScrollView *scrollView, CGFloat distanceToTop, CGFloat distanceToBottom) {
    if (distanceToBottom < 150){
        [data getNext:^{

        }];
    }else if (distanceToTop < 150){
		[data getPrev:^{
        
        }];
    }
}];
```

or


```objective-c
ScrollViewListener *scrollViewListener = [[ScrollViewListener alloc] initWithScrollView:vc.collectionView];

[scrollViewListener addListener:^(UIScrollView *scrollView, CGFloat distanceToTop, CGFloat distanceToBottom) {
    if (distanceToBottom < 150){
        [data getNext:^{

        }];
    }else if (distanceToTop < 150){
		[data getPrev:^{
        
        }];
    }
}];
```


## Credits

ScrollViewListener was originally created by [Jeff Friesen](https://github.com/robotafterall) and [Sudeep Sidhu](https://github.com/sudeepsidhu) in the development of apps for [Tipping Canoe](https://github.com/TippingCanoe).

## License

ScrollViewListener is available under the MIT license. See the LICENSE file for more info.