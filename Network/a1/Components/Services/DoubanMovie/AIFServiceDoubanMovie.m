//
//  AIFServiceDoubanMovie.m
//  a1
//
//  Created by hy on 15/8/1.
//  Copyright (c) 2015年 com.yuanchuanglian. All rights reserved.
//

#import "AIFServiceDoubanMovie.h"

@implementation AIFServiceDoubanMovie
- (BOOL)isOnline
{
    return YES;
}

- (NSString *)onlineApiBaseUrl
{
    return @"https://api.douban.com/";
}

- (NSString *)onlineApiVersion
{
    return @"v2";
}

- (NSString *)onlinePrivateKey
{
    return @"";
}

- (NSString *)onlinePublicKey
{
    return @"";
}

- (NSString *)offlineApiBaseUrl
{
    return self.onlineApiBaseUrl;
}

- (NSString *)offlineApiVersion
{
    return self.onlineApiVersion;
}

- (NSString *)offlinePrivateKey
{
    return self.onlinePrivateKey;
}

- (NSString *)offlinePublicKey
{
    return self.onlinePublicKey;
}

@end
