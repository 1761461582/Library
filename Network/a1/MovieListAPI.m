//
//  MovieListAPI.m
//  a1
//
//  Created by hy on 15/7/30.
//  Copyright (c) 2015年 com.yuanchuanglian. All rights reserved.
//

#import "MovieListAPI.h"
@interface MovieListAPI()
@end

@implementation MovieListAPI

-(NSString*)serviceType
{
    //return kAIFServiceAnjukeREST_4;
    return @"admin/versionupgrade";
}

-(NSString*)methodName
{
    return @"admin/versionupgrade";
}

-(RTAPIManagerRequestType)requestType
{
    return RTAPIManagerRequestTypeRestGet;
}

@end
