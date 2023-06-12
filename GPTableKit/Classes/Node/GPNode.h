//
//  GPNode.h
//  GPTableKit
//
//  Created by Orisun on 2022/10/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GPNode : NSObject

@property (nonatomic, weak, nullable, readonly) GPNode *parent;
@property (nonatomic, strong) NSArray<GPNode *> *children;

- (void)addChild:(GPNode *)node;
- (void)addChildren:(NSArray<GPNode *> *)nodes;

/// Index is safe without out of range exception.
- (void)insertChild:(GPNode *)node atIndex:(NSUInteger)index;
/// Index is safe without out of range exception.
- (void)insertChildren:(NSArray<GPNode *> *)nodes atIndex:(NSUInteger)index;
- (void)insertChild:(GPNode *)node beforeNode:(GPNode *)siblingNode;
- (void)insertChild:(GPNode *)node afterNode:(GPNode *)siblingNode;
- (void)insertChildren:(NSArray<GPNode *> *)nodes beforeNode:(GPNode *)siblingNode;
- (void)insertChildren:(NSArray<GPNode *> *)nodes afterNode:(GPNode *)siblingNode;

/// Index is safe without out of range exception.
- (void)removeChildAtIndex:(NSUInteger)index;
- (void)removeChild:(GPNode *)node;
- (void)removeAllChildren;
- (void)removeFromParent;

- (NSUInteger)nodeIndex;
- (nullable GPNode *)firstChild;
- (nullable GPNode *)lastChild;
- (BOOL)isFirstChild;
- (BOOL)isLastChild;
- (NSArray<GPNode *> *)siblings;
- (nullable GPNode *)nextSibling;
- (nullable GPNode *)previousSibling;
- (NSUInteger)count;

- (nullable GPNode *)objectAtIndexedSubscript:(NSUInteger)index;

@end

NS_ASSUME_NONNULL_END
