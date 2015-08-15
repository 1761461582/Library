//
//  Subjects.h
//  a1
//
//  Created by hy on 15/08/15
//  Copyright (c) __ORGANIZATIONNAME__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"
#import "Casts.h"
#import "Directors.h"
#import "Rating.h"
#import "Images.h"

@protocol Subjects @end
@interface Subjects : JSONModel

@property (nonatomic, strong) Rating *rating;

@property (nonatomic, copy) NSString *id;

@property (nonatomic, copy) NSString *original_title;

@property (nonatomic, assign) NSInteger collect_count;

@property (nonatomic, strong) NSArray<Directors> *directors;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *year;

@property (nonatomic, strong) NSArray<Casts> *casts;

@property (nonatomic, strong) NSArray *genres;

@property (nonatomic, strong) Images *images;

@property (nonatomic, copy) NSString *subtype;

@property (nonatomic, copy) NSString *alt;

@end