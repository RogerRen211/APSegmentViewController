//
//  ViewController.h
//  APSegmentViewController
//
//  Created by RenRoger on 15/5/27.
//  Copyright (c) 2015年 RenRoger. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface APSegmentViewController : UIViewController

@property (nonatomic,strong) UISegmentedControl *segmentControl;

@property (nonatomic, copy) NSArray *viewControllers;

- (void)setViewControllers:(NSArray *)viewControllers animated:(BOOL)animated;

@property (nonatomic, weak) UIViewController *selectedViewController;

@property (nonatomic) NSUInteger selectedIndex;


@end

