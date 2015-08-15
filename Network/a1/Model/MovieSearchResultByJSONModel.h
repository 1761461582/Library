//
//  MovieSearchResultByJSONModel.h
//  a1
//
//  Created by hy on 15/08/15
//  Copyright (c) __ORGANIZATIONNAME__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"
#import "Subjects.h"

@interface MovieSearchResultByJSONModel : JSONModel

@property (nonatomic, strong) NSArray<Subjects> *subjects;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) NSInteger count;

@property (nonatomic, assign) NSInteger total;

@property (nonatomic, assign) NSInteger start;

@end