//
//  MovieItem.h
//  a1
//
//  Created by hy on 15/8/2.
//  Copyright (c) 2015年 com.yuanchuanglian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieItem : NSObject
@property (nonatomic, strong) NSString *ID;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *original_title;
@property (nonatomic, strong) NSString *genres;
@property (nonatomic, strong) NSString *postImageURL;
@property (nonatomic, strong) NSString *ratingString;
@property (nonatomic, strong) NSString *year;
@end
