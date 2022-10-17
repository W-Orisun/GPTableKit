//
//  GPTableView.m
//  GPTableKit
//
//  Created by Orisun on 2022/10/13.
//

#import "GPTableView.h"
#import "GPTableViewDelegateProxy.h"

@interface GPTableView ()

@property (nonatomic, strong) GPTableViewDelegateProxy *delegateProxy;

@end

@implementation GPTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame style:style]) {
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 150000 //兼容低版本Xcode
        if (@available(iOS 15.0, *)) {
            self.sectionHeaderTopPadding = 0;
        }
#endif
    }
    return self;
}

- (void)dealloc {
    [self setDelegate:nil];
}

#pragma mark - setter & getter
- (void)setDelegate:(id<UITableViewDelegate>)delegate {
    if (delegate == nil) {
        self.delegateProxy.target = nil;
        self.delegateProxy = nil;
        [super setDelegate:delegate];
    } else {
        if (self.delegateProxy == nil) {
            self.delegateProxy = [GPTableViewDelegateProxy alloc];
        }
        self.delegateProxy.target = delegate;
        [super setDelegate:self.delegateProxy];
    }
}

@end
