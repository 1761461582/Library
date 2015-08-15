//
//  Images.h
//  a1
//
//  Created by hy on 15/08/15
//  Copyright (c) __ORGANIZATIONNAME__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@protocol Images @end
@interface Images : JSONModel

@property (nonatomic, copy) NSString *small;

@property (nonatomic, copy) NSString *large;

@property (nonatomic, copy) NSString *medium;

@end