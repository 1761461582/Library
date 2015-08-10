//
//  MovieDetailAPI.m
//  a1
//
//  Created by hy on 15/8/7.
//  Copyright (c) 2015年 com.yuanchuanglian. All rights reserved.
//

#import "MovieDetailAPI.h"
@interface MovieDetailAPI()
@end

@implementation MovieDetailAPI
-(NSString*)serviceType
{
    return kAIFServiceDoubanMovie;
}

-(NSString*)methodName
{
    return @"movie/subject";
}

-(RTAPIManagerRequestType)requestType
{
    return RTAPIManagerRequestTypeGetWithURLFormat;
}
@end
