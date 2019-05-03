//
//  CatonMonitor.h
//  toolDemo
//
//  Created by 贾硕 on 2019/4/27.
//  Copyright © 2019 贾硕. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CatonMonitor : NSObject

+ (instancetype)shareInstance;

- (void)beginMonitor; //开始监视卡顿
- (void)endMonitor;   //停止监视卡顿

@end

NS_ASSUME_NONNULL_END
