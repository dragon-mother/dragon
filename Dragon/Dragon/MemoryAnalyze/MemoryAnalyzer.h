//
//  MemoryAnalyzer.h
//  Dragon
//
//  Created by 贾硕 on 2019/5/3.
//  Copyright © 2019 贾硕. All rights reserved.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface MemoryAnalyzer : NSObject

- (NSInteger)getUsedMemory;

- (NSInteger)getFreeMemory;

@end

NS_ASSUME_NONNULL_END
