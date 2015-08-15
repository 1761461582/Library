//
//  Rating.h
//  a1
//
//  Created by hy on 15/08/15
//  Copyright (c) __ORGANIZATIONNAME__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"
#import <CoreGraphics/CoreGraphics.h>

@protocol Rating @end
@interface Rating : JSONModel

@property (nonatomic, copy) NSString *stars;

@property (nonatomic, assign) CGFloat average;

@property (nonatomic, assign) NSInteger min;

@property (nonatomic, assign) NSInteger max;

@end