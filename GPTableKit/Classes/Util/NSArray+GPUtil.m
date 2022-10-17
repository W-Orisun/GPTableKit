//
//  NSArray+GPUtil.m
//  GPTableKit
//
//  Created by Orisun on 2022/10/12.
//

#import "NSArray+GPUtil.h"

@implementation NSArray (GPUtil)

- (NSArray *)compactMap:(id  _Nonnull (^)(id _Nonnull))lambda {
    if (!lambda) {
        return [NSArray array];
    }
    NSMutableArray *array = [NSMutableArray array];
    for (id obj in self) {
        id res = lambda(obj);
        if (res) {
            [array addObject:res];
        }
    }
    return [array copy];
}

- (id)safeObjectAtIndex:(NSUInteger)index {
    if (index >= 0 && index < self.count) {
        return self[index];
    }
    return nil;
}

@end
