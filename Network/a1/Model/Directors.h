//
//  Directors.h
//  a1
//
//  Created by hy on 15/08/15
//  Copyright (c) __ORGANIZATIONNAME__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"
#import "Avatars.h"

@protocol Directors @end
@interface Directors : JSONModel

@property (nonatomic, copy) NSString *id;

@property (nonatomic, copy) NSString *alt;

@property (nonatomic, strong) Avatars *avatars;

@property (nonatomic, copy) NSString *name;

@end