//
//  GPTableViewDelegateProxy.m
//  GPTableKit
//
//  Created by Orisun on 2022/10/14.
//

#import "GPTableViewDelegateProxy.h"
#import "GPTableDataSource.h"
#import "GPTableSection.h"
#import "GPTableRow.h"

@implementation GPTableViewDelegateProxy

/// 实现此实例方法以应对tableView调用[delegate respondsToSelector:]，从而不调用methodSignatureForSelector、forwardInvocation
- (BOOL)respondsToSelector:(SEL)aSelector {
    SEL selectors[] = {
        @selector(tableView:willDisplayCell:forRowAtIndexPath:),
        @selector(tableView:willDisplayHeaderView:forSection:),
        @selector(tableView:willDisplayFooterView:forSection:),
        @selector(tableView:didEndDisplayingCell:forRowAtIndexPath:),
        @selector(tableView:didEndDisplayingHeaderView:forSection:),
        @selector(tableView:didEndDisplayingFooterView:forSection:),
        @selector(tableView:heightForRowAtIndexPath:),
        @selector(tableView:heightForHeaderInSection:),
        @selector(tableView:heightForFooterInSection:),
        @selector(tableView:estimatedHeightForRowAtIndexPath:),
        @selector(tableView:viewForHeaderInSection:),
        @selector(tableView:viewForFooterInSection:),
        @selector(tableView:didSelectRowAtIndexPath:),
        NULL
    };
    for (SEL *p = selectors; *p != NULL; ++p) {
        if (aSelector == *p) {
            return YES;
        }
    }
    return [self.target respondsToSelector:aSelector];
}

/// 描述给定selector的参数和返回值类型
- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    if (self.target) {
        return [self.target methodSignatureForSelector:sel];
    }
    return [super methodSignatureForSelector:sel];
}

/// 将消息转发到对应的对象
- (void)forwardInvocation:(NSInvocation *)invocation {
    if (self.target) {
        [invocation invokeWithTarget:self.target];
    }
}

#pragma mark - delegate

// Display customization

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([tableView.dataSource isKindOfClass:[GPTableDataSource class]]) {
        GPTableDataSource *dataSource = tableView.dataSource;
        GPTableRow *row = [dataSource rowAtIndexPath:indexPath];
        [row tableView:tableView willDisplayCell:cell forRowAtIndexPath:indexPath];
    }
    
    if (self.target && [self.target respondsToSelector:@selector(tableView:willDisplayCell:forRowAtIndexPath:)]) {
        [self.target tableView:tableView willDisplayCell:cell forRowAtIndexPath:indexPath];
    }
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
    if ([tableView.dataSource isKindOfClass:[GPTableDataSource class]]) {
        GPTableDataSource *dataSource = tableView.dataSource;
        GPTableSection *tableSection = [dataSource sectionAtIndex:section];
        [tableSection tableView:tableView willDisplayHeaderView:view forSection:section];
    }
    
    if (self.target && [self.target respondsToSelector:@selector(tableView:willDisplayHeaderView:forSection:)]) {
        [self.target tableView:tableView willDisplayHeaderView:view forSection:section];
    }
}

- (void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section {
    if ([tableView.dataSource isKindOfClass:[GPTableDataSource class]]) {
        GPTableDataSource *dataSource = tableView.dataSource;
        GPTableSection *tableSection = [dataSource sectionAtIndex:section];
        [tableSection tableView:tableView willDisplayFooterView:view forSection:section];
    }
    
    if (self.target && [self.target respondsToSelector:@selector(tableView:willDisplayFooterView:forSection:)]) {
        [self.target tableView:tableView willDisplayFooterView:view forSection:section];
    }
}

- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([tableView.dataSource isKindOfClass:[GPTableDataSource class]]) {
        GPTableDataSource *dataSource = tableView.dataSource;
        GPTableRow *row = [dataSource rowAtIndexPath:indexPath];
        [row tableView:tableView didEndDisplayingCell:cell forRowAtIndexPath:indexPath];
    }
    
    if (self.target && [self.target respondsToSelector:@selector(tableView:didEndDisplayingCell:forRowAtIndexPath:)]) {
        [self.target tableView:tableView didEndDisplayingCell:cell forRowAtIndexPath:indexPath];
    }
}

- (void)tableView:(UITableView *)tableView didEndDisplayingHeaderView:(UIView *)view forSection:(NSInteger)section {
    if ([tableView.dataSource isKindOfClass:[GPTableDataSource class]]) {
        GPTableDataSource *dataSource = tableView.dataSource;
        GPTableSection *tableSection = [dataSource sectionAtIndex:section];
        [tableSection tableView:tableView didEndDisplayingHeaderView:view forSection:section];
    }
    
    if (self.target && [self.target respondsToSelector:@selector(tableView:didEndDisplayingHeaderView:forSection:)]) {
        [self.target tableView:tableView didEndDisplayingHeaderView:view forSection:section];
    }
}

- (void)tableView:(UITableView *)tableView didEndDisplayingFooterView:(UIView *)view forSection:(NSInteger)section {
    if ([tableView.dataSource isKindOfClass:[GPTableDataSource class]]) {
        GPTableDataSource *dataSource = tableView.dataSource;
        GPTableSection *tableSection = [dataSource sectionAtIndex:section];
        [tableSection tableView:tableView didEndDisplayingFooterView:view forSection:section];
    }
    
    if (self.target && [self.target respondsToSelector:@selector(tableView:didEndDisplayingFooterView:forSection:)]) {
        [self.target tableView:tableView didEndDisplayingFooterView:view forSection:section];
    }
}

// Variable height support

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.target respondsToSelector:@selector(tableView:heightForRowAtIndexPath:)]) {
        return [self.target tableView:tableView heightForRowAtIndexPath:indexPath];
    }
    if ([tableView.dataSource isKindOfClass:[GPTableDataSource class]]) {
        GPTableDataSource *dataSource = tableView.dataSource;
        GPTableRow *row = [dataSource rowAtIndexPath:indexPath];
        if ([row autoAdjustCellHeight]) {
            return UITableViewAutomaticDimension;
        } else {
            return [row cellHeight];
        }
    }
    return 44.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (self.target && [self.target respondsToSelector:@selector(tableView:heightForHeaderInSection:)]) {
        return [self.target tableView:tableView heightForHeaderInSection:section];
    }
    if ([tableView.dataSource isKindOfClass:[GPTableDataSource class]]) {
        GPTableDataSource *dataSource = (id)tableView.dataSource;
        GPTableSection *tableSection = [dataSource sectionAtIndex:section];
        if ([tableSection autoAdjustHeaderHeight]) {
            return UITableViewAutomaticDimension;
        } else {
            return [tableSection headerHeight];
        }
    }
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (self.target && [self.target respondsToSelector:@selector(tableView:heightForFooterInSection:)]) {
        return [self.target tableView:tableView heightForFooterInSection:section];
    }
    if ([tableView.dataSource isKindOfClass:[GPTableDataSource class]]) {
        GPTableDataSource *dataSource = (id)tableView.dataSource;
        GPTableSection *tableSection = [dataSource sectionAtIndex:section];
        if ([tableSection autoAdjustFooterHeight]) {
            return UITableViewAutomaticDimension;
        } else {
            return [tableSection footerHeight];
        }
    }
    return CGFLOAT_MIN;
}

// estimatedHeight

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.target respondsToSelector:@selector(tableView:estimatedHeightForRowAtIndexPath:)]) {
        return [self.target tableView:tableView estimatedHeightForRowAtIndexPath:indexPath];
    }
    if ([tableView.dataSource isKindOfClass:[GPTableDataSource class]]) {
        GPTableDataSource *dataSource = tableView.dataSource;
        GPTableRow *row = [dataSource rowAtIndexPath:indexPath];
        return row.estimatedHeight;
    }
    return 0;
}

// Section header & footer information.

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (self.target && [self.target respondsToSelector:@selector(tableView:viewForHeaderInSection:)]) {
        return [self.target tableView:tableView viewForHeaderInSection:section];
    }
    if ([tableView.dataSource isKindOfClass:[GPTableDataSource class]]) {
        GPTableDataSource *dataSource = (id)tableView.dataSource;
        GPTableSection *tableSection = [dataSource sectionAtIndex:section];
        return [tableSection tableView:tableView viewForHeaderInSection:section];
    }
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if (self.target && [self.target respondsToSelector:@selector(tableView:viewForFooterInSection:)]) {
        return [self.target tableView:tableView viewForFooterInSection:section];
    }
    if ([tableView.dataSource isKindOfClass:[GPTableDataSource class]]) {
        GPTableDataSource *dataSource = (id)tableView.dataSource;
        GPTableSection *tableSection = [dataSource sectionAtIndex:section];
        return [tableSection tableView:tableView viewForFooterInSection:section];
    }
    return nil;
}

// Selection

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if ([tableView.dataSource isKindOfClass:[GPTableDataSource class]]) {
        GPTableDataSource *dataSource = tableView.dataSource;
        GPTableRow *row = [dataSource rowAtIndexPath:indexPath];
        if (row.selectedBlock) {
            row.selectedBlock(tableView, indexPath);
        }
    }
    
    if ([self.target respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)]) {
        [self.target tableView:tableView didSelectRowAtIndexPath:indexPath];
    }
}

@end
