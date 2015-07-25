//
//  TimelineMgr.h
//  d8
//
//  Created by hy on 15/7/24.
//  Copyright (c) 2015年 com.yuanchuanglian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimelineMgr : NSObject

-(BOOL)InitMgr;
-(NSArray*)GetTimelineList;
-(BOOL)AddTimelineObject:(NSDate*)object;
@end
