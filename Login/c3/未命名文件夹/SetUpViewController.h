//
//  SetUpViewController.h
//  c3
//
//  Created by hy on 15/7/9.
//  Copyright (c) 2015年 com.yuanchuanglian. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol SetUpDelegate <NSObject>

-(void)setUpWithSuccess;
-(void)setUpWithFailure;

@end

@interface SetUpViewController : UIViewController
{
    id<SetUpDelegate> _delegate;
}

@property (nonatomic,strong) id delegate;
@end
