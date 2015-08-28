//
//  Casts.h
//  a1
//
//  Created by hy on 15/08/15
//  Copyright (c) __ORGANIZATIONNAME__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"
#import "Avatars.h"

@protocol Casts @end
@interface Casts : JSONModel

@property (nonatomic, copy) NSString<Optional> *id;

@property (nonatomic, copy) NSString<Optional> *alt;

@property (nonatomic, strong) Avatars<Optional> *avatars;//25+1

@property (nonatomic, copy) NSString *name;

@end