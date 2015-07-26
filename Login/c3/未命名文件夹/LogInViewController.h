//
//  ViewController.h
//  c2
//
//  Created by hy on 15/7/5.
//  Copyright (c) 2015年 com.yuanchuanglian. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LogInDelegate <NSObject>

-(void)logInWithSuccess;
-(void)logInWithFailure;

@end

@interface LogInViewController : UIViewController
{
    id<LogInDelegate> _delegate;
}

@property (nonatomic,strong) id delegate;

@end

