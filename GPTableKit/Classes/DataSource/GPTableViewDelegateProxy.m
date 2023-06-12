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
#import "GPTableView.h"

@implementation GPTableViewDelegateProxy

/// 实现此实例方法以应对tableView调用[delegate respondsToSelector:]，从而不调用methodSignatureForSelector、forwardInvocation
- (BOOL)respondsToSelector:(SEL)aSelector {
    SEL selectors[] = {
        @selector(tableView:heightForRowAtIndexPath:),
        @selector(tableView:estimatedHeightForRowAtIndexPath:),
        @selector(tableView:didSelectRowAtIndexPath:),
        @selector(tableView:viewForHeaderInSection:),
        @selector(tableView:viewForFooterInSection:),
        @selector(tableView:heightForHeaderInSection:),
        @selector(tableView:heightForFooterInSection:),
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
- (CGFloat)tableView:(GPTableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
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

- (CGFloat)tableView:(GPTableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
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

- (void)tableView:(GPTableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
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

- (UIView *)tableView:(GPTableView *)tableView viewForHeaderInSection:(NSInteger)section {
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

- (UIView *)tableView:(GPTableView *)tableView viewForFooterInSection:(NSInteger)section {
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

- (CGFloat)tableView:(GPTableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (self.target && [self.target respondsToSelector:@selector(tableView:heightForHeaderInSection:)]) {
        return [self.target tableView:tableView heightForHeaderInSection:section];
    }
    if ([tableView.dataSource isKindOfClass:[GPTableDataSource class]]) {
        GPTableDataSource *dataSource = (id)tableView.dataSource;
        GPTableSection *tableSection = [dataSource sectionAtIndex:section];
        if ([tableSection autoAdjustHeaderHeight]) {
            return UITableViewAutomaticDimension;
        } else {
            return [tableSection tableView:tableView heightForHeaderInSection:section];
        }
    }
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(GPTableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (self.target && [self.target respondsToSelector:@selector(tableView:heightForFooterInSection:)]) {
        return [self.target tableView:tableView heightForFooterInSection:section];
    }
    if ([tableView.dataSource isKindOfClass:[GPTableDataSource class]]) {
        GPTableDataSource *dataSource = (id)tableView.dataSource;
        GPTableSection *tableSection = [dataSource sectionAtIndex:section];
        if ([tableSection autoAdjustFooterHeight]) {
            return UITableViewAutomaticDimension;
        } else {
            return [tableSection tableView:tableView heightForFooterInSection:section];
        }
    }
    return CGFLOAT_MIN;
}

@end
