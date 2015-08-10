//
//  MovieDetailItem.h
//  a1
//
//  Created by hy on 15/8/7.
//  Copyright (c) 2015年 com.yuanchuanglian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieDetailItem : NSObject
@property (nonatomic, strong) NSString *ID;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *original_title;
@property (nonatomic, strong) NSString *genres;
@property (nonatomic, strong) NSString *postImageURL;
@property (nonatomic, strong) NSString *ratingString;
@property (nonatomic, strong) NSString *year;
@property (nonatomic, strong) NSString *reviews_count;
@property (nonatomic, strong) NSString *wish_count;
@property (nonatomic, strong) NSString *collect_count;
@property (nonatomic, strong) NSString *summary;
@property (nonatomic, strong) NSString *directorName;
@property (nonatomic, strong) NSString *directorAvantarImgURL;
@end
