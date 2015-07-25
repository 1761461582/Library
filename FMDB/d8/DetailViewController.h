//
//  DetailViewController.h
//  d8
//
//  Created by hy on 15/7/24.
//  Copyright (c) 2015年 com.yuanchuanglian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

