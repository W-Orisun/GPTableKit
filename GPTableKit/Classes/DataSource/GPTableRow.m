//
//  GPTableRow.m
//  GPTableKit
//
//  Created by Orisun on 2022/10/12.
//

#import "GPTableRow.h"

@implementation GPTableRow

- (instancetype)init {
    if (self = [super init]) {
        self.estimatedHeight = 44.0;
    }
    return self;
}

- (NSString *)reuseIdentifier {
    return NSStringFromClass([self class]);
}

- (NSIndexPath *)indexPath {
    NSUInteger section = [self.parent nodeIndex];
    NSUInteger row = [self nodeIndex];
    if (section != NSNotFound && row != NSNotFound) {
        return [NSIndexPath indexPathForRow:row inSection:section];
    } else {
        return nil;
    }
}

- (BOOL)autoAdjustCellHeight {
    return NO;
}

- (UITableViewCell *)createNewTableViewCellForRow {
    Class class = NSClassFromString([NSStringFromClass([self class]) stringByAppendingString:@"Cell"]);
    if (class) {
        return [[class alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[self reuseIdentifier]];
    } else {
        [NSException raise:NSInvalidArgumentException format:@"The %s MUST be implemented by subclass or consider use AIFTableViewCell", __FUNCTION__];
        return nil;
    }
}

- (UITableViewCell *)cellForTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[self reuseIdentifier]];
    self.tableView = tableView;
    if (!cell) {
        cell = [self createNewTableViewCellForRow];
    }
    return cell;
}

- (void)updateCell:(UITableViewCell *)cell indexPath:(NSIndexPath *)indexPath {
    
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end
