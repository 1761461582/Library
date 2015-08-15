//
//  MovieDetailByJSONModel.h
//  a1
//
//  Created by hy on 15/8/15.
//  Copyright (c) 2015年 com.yuanchuanglian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"
#import "Images.h"
#import "Rating.h"
#import "Casts.h"
#import "Directors.h"

@interface MovieDetailByJSONModel : JSONModel

@property (nonatomic, copy) NSString *subtype;

@property (nonatomic, copy) NSString *mobile_url;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *summary;

@property (nonatomic, copy) NSString *alt;

@property (nonatomic, strong) NSArray<Directors> *directors;

@property (nonatomic, assign) NSInteger collect_count;

@property (nonatomic, strong) Images *images;

@property (nonatomic, strong) NSArray *countries;

@property (nonatomic, assign) NSInteger wish_count;

@property (nonatomic, copy) NSString<Optional> *do_count;

@property (nonatomic, copy) NSString *original_title;

@property (nonatomic, copy) NSString *year;

@property (nonatomic, assign) NSInteger comments_count;

@property (nonatomic, copy) NSString<Optional> *schedule_url;

@property (nonatomic, copy) NSString<Optional> *seasons_count;

@property (nonatomic, copy) NSString *id;

@property (nonatomic, strong) NSArray *aka;

@property (nonatomic, assign) NSInteger reviews_count;

@property (nonatomic, strong) NSArray<Casts> *casts;

@property (nonatomic, copy) NSString<Optional> *douban_site;

@property (nonatomic, strong) NSArray *genres;

@property (nonatomic, copy) NSString<Optional> *current_season;

@property (nonatomic, assign) NSInteger ratings_count;

@property (nonatomic, strong) Rating *rating;

@property (nonatomic, copy) NSString<Optional> *episodes_count;

@end












