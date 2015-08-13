//
//  MovieItemByJSONModel.h
//  a1
//
//  Created by hy on 15/8/11.
//  Copyright (c) 2015年 com.yuanchuanglian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@interface MovieItemByJSONModel : JSONModel
@property (nonatomic, strong) NSString *ID;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *original_title;
@property (nonatomic, strong) NSString *postImageURL;
@property (nonatomic, strong) NSString *ratingString;
@property (nonatomic, strong) NSString *year;
@property (nonatomic, strong) NSString *reviews_count;
@property (nonatomic, strong) NSString *wish_count;
@property (nonatomic, strong) NSString *collect_count;
@property (nonatomic, strong) NSString *summary;
@end
