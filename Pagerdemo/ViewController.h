//
//  ViewController.h
//  Pagerdemo
//
//  Created by webwerks on 3/28/15.
//  Copyright (c) 2015 Pradeep. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewController : UIViewController <UIPageViewControllerDataSource,UIPageViewControllerDelegate>

@property (strong, nonatomic) UIPageViewController *pageViewController;

@end

