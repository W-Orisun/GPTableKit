//
//  GPTableViewDelegateProxy.h
//  GPTableKit
//
//  Created by Orisun on 2022/10/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GPTableViewDelegateProxy : NSProxy <UITableViewDelegate>

@property (nonatomic, weak, nullable) id target;

@end

NS_ASSUME_NONNULL_END
