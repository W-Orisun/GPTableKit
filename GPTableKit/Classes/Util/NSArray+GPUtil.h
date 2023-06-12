//
//  NSArray+GPUtil.h
//  GPTableKit
//
//  Created by Orisun on 2022/10/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#define gp_guard(CONDITION) if (CONDITION) {}

@interface NSArray<ObjectType> (GPUtil)

- (NSArray *)gp_compactMap:(id(^)(ObjectType))lambda;
- (nullable ObjectType)gp_safeObjectAtIndex:(NSUInteger)index;

@end

NS_ASSUME_NONNULL_END
