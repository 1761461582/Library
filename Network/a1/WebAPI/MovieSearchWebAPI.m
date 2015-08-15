//
//  MovieSearchWebAPI.m
//  a1
//
//  Created by hy on 15/8/15.
//  Copyright (c) 2015年 com.yuanchuanglian. All rights reserved.
//

#import "MovieSearchWebAPI.h"

@implementation MovieSearchWebAPI
-(NSString*)serviceType
{
    return kAIFServiceDoubanMovie;
}

-(NSString*)methodName
{
    return @"movie/search";
}

-(RTAPIManagerRequestType)requestType
{
    return RTAPIManagerRequestTypeGet;
}
@end
