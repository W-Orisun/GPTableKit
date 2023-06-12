//
//  GPNode.m
//  GPTableKit
//
//  Created by Orisun on 2022/10/12.
//

#import "GPNode.h"

@interface GPNode () {
    NSMutableArray *_children;
}
@property (nonatomic, weak, nullable, readwrite) GPNode *parent;
@end

@implementation GPNode

#pragma mark - add
- (void)addChild:(GPNode *)node {
    if ([node isKindOfClass:[GPNode class]]) {
        node.parent = self;
        if (!_children) {
            _children = [NSMutableArray array];
        }
        [_children addObject:node];
    }
}

- (void)addChildren:(NSArray<GPNode *> *)nodes {
    [nodes enumerateObjectsUsingBlock:^(GPNode * _Nonnull node, NSUInteger idx, BOOL * _Nonnull stop) {
        [self addChild:node];
    }];
}

#pragma mark - insert
- (void)insertChild:(GPNode *)node atIndex:(NSUInteger)index {
    if ([node isKindOfClass:[GPNode class]] && index >= 0 && index <= _children.count) {
        node.parent = self;
        if (!_children) {
            _children = [NSMutableArray array];
        }
        [_children insertObject:node atIndex:index];
    }
}

- (void)insertChildren:(NSArray<GPNode *> *)nodes atIndex:(NSUInteger)index {
    [nodes enumerateObjectsUsingBlock:^(GPNode * _Nonnull node, NSUInteger idx, BOOL * _Nonnull stop) {
        [self insertChild:node atIndex:index + idx];
    }];
}

- (void)insertChild:(GPNode *)node beforeNode:(GPNode *)siblingNode {
    if ([siblingNode isKindOfClass:[GPNode class]] && _children) {
        NSUInteger index = [_children indexOfObject:siblingNode];
        if (index != NSNotFound) {
            [self insertChild:node atIndex:index];
        }
    }
}

- (void)insertChild:(GPNode *)node afterNode:(GPNode *)siblingNode {
    if ([siblingNode isKindOfClass:[GPNode class]] && _children) {
        NSUInteger index = [_children indexOfObject:siblingNode];
        if (index != NSNotFound) {
            [self insertChild:node atIndex:index + 1];
        }
    }
}

- (void)insertChildren:(NSArray<GPNode *> *)nodes beforeNode:(GPNode *)siblingNode {
    if ([siblingNode isKindOfClass:[GPNode class]] && _children) {
        NSUInteger index = [_children indexOfObject:siblingNode];
        if (index != NSNotFound) {
            [self insertChildren:nodes atIndex:index];
        }
    }
}

- (void)insertChildren:(NSArray<GPNode *> *)nodes afterNode:(GPNode *)siblingNode {
    if ([siblingNode isKindOfClass:[GPNode class]] && _children) {
        NSUInteger index = [_children indexOfObject:siblingNode];
        if (index != NSNotFound) {
            [self insertChildren:nodes atIndex:index + 1];
        }
    }
}

#pragma mark - remove
- (void)removeChild:(GPNode *)node {
    if ([node isKindOfClass:[GPNode class]] && [_children containsObject:node]) {
        [_children removeObject:node];
        node.parent = nil;
    }
}

- (void)removeChildAtIndex:(NSUInteger)index {
    if (index >= 0 && index < _children.count) {
        [_children removeObjectAtIndex:index];
    }
}

- (void)removeAllChildren {
    for (GPNode *node in _children) {
        node.parent = nil;
    }
    _children = [NSMutableArray array];
}

- (void)removeFromParent {
    [self.parent removeChild:self];
}

#pragma mark - util
- (NSUInteger)nodeIndex {
    if (self.parent) {
        return [self.parent.children indexOfObject:self];
    }
    return NSNotFound;
}

- (GPNode *)firstChild {
    return [_children firstObject];
}

- (GPNode *)lastChild {
    return [_children lastObject];
}

- (BOOL)isFirstChild {
    return self.parent.children.firstObject == self;
}

- (BOOL)isLastChild {
    return self.parent.children.lastObject == self;
}

- (NSArray<GPNode *> *)siblings {
    if ([self nodeIndex] == NSNotFound) {
        return [NSArray array];
    }
    NSMutableArray *array = [self.parent.children mutableCopy];
    [array removeObject:self];
    return [array copy];
}

- (GPNode *)nextSibling {
    NSUInteger index = [self nodeIndex];
    if (index == NSNotFound) {
        return nil;
    }
    if (self.parent.children.count > index + 1) {
        return self.parent.children[index + 1];
    }
    return nil;
}

- (GPNode *)previousSibling {
    NSUInteger index = [self nodeIndex];
    if (index == NSNotFound) {
        return nil;
    }
    if (index > 0) {
        return self.parent.children[index - 1];
    }
    return nil;
}

- (NSUInteger)count {
    return _children.count;
}

#pragma mark - subscript
- (GPNode *)objectAtIndexedSubscript:(NSUInteger)index {
    if (index >= 0 && index < _children.count) {
        return _children[index];
    }
    return nil;
}

#pragma mark - getter & setter
- (NSArray<GPNode *> *)children {
    if (!_children) {
        _children = [NSMutableArray array];
    }
    return [_children copy];
}

- (void)setChildren:(NSArray<GPNode *> *)children {
    [self removeAllChildren];
    [self addChildren:children];
}

- (void)dealloc {
    [self removeAllChildren];
}

@end
