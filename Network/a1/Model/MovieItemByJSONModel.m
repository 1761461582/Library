//
//  MovieItemByJSONModel.m
//  a1
//
//  Created by hy on 15/8/11.
//  Copyright (c) 2015年 com.yuanchuanglian. All rights reserved.
//

#import "MovieItemByJSONModel.h"

@implementation MovieItemByJSONModel
+(JSONKeyMapper*)keyMapper
{
    //左边一列代表JSON文件的结构，右边一列代表数据结构
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"id": @"ID",
                                                       @"title": @"title",
                                                       @"original_title": @"original_title",
                                                       @"year": @"year",
                                                       @"summary": @"summary",
                                                       @"wish_count": @"wish_count",
                                                       @"collect_count": @"collect_count",
                                                       @"reviews_count": @"reviews_count",
                                                       @"images.large": @"postImageURL",
                                                       @"rating.average": @"ratingString"
                                                       }];
}

@end
