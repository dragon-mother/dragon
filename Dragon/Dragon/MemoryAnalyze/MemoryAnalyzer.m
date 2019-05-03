//
//  MemoryAnalyzer.m
//  Dragon
//
//  Created by 贾硕 on 2019/5/3.
//  Copyright © 2019 贾硕. All rights reserved.
//

#import "MemoryAnalyzer.h"
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#import <mach/mach.h>

#define NUM_ENTRIES 1024

@implementation MemoryAnalyzer

- (instancetype)init {
    if (self = [super init]) {
        
    }
    return self;
}

- (NSInteger)getUsedMemory {
    return getUsedMemory();
}

- (NSInteger)getFreeMemory {
    return getFreeMemory();
}


/**
 当前 App 占用了多少内存
 */
vm_size_t getUsedMemory() {
    task_basic_info_data_t info;
    mach_msg_type_number_t size = sizeof(info);
    kern_return_t kerr = task_info(mach_task_self(), TASK_BASIC_INFO, (task_info_t)&info, &size);
    
    if (kerr == KERN_SUCCESS) {
        return info.resident_size;
    } else {
        return 0;
    }
}


/**
 获取空闲内存
 */
vm_size_t getFreeMemory() {
    mach_port_t host = mach_host_self();
    mach_msg_type_number_t size = sizeof(vm_statistics_data_t) / sizeof(integer_t);
    vm_size_t pagesize;
    vm_statistics_data_t vmstat;
    
    host_page_size(host, &pagesize);
    host_statistics(host, HOST_VM_INFO, (host_info_t) &vmstat, &size);
    
    return vmstat.free_count * pagesize;
}

@end
