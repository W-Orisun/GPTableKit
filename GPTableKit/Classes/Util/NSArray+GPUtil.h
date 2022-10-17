//
//  NSArray+GPUtil.h
//  GPTableKit
//
//  Created by Orisun on 2022/10/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray<ObjectType> (GPUtil)

- (NSArray *)compactMap:(id(^)(ObjectType))lambda;
- (nullable ObjectType)safeObjectAtIndex:(NSUInteger)index;

@end

NS_ASSUME_NONNULL_END
