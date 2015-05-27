//
//  ViewController.m
//  APSegmentViewController
//
//  Created by RenRoger on 15/5/27.
//  Copyright (c) 2015年 RenRoger. All rights reserved.
//

#import "APSegmentViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"

@interface APSegmentViewController ()

@end

@implementation APSegmentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *topBarView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 60)];
    topBarView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:topBarView];
    self.segmentControl = [[UISegmentedControl alloc] initWithItems:@[@"回话",@"列表"]];
    self.segmentControl.tintColor = [UIColor whiteColor];
    self.segmentControl.frame = CGRectMake(100, 20, 100, 30);
    [self.segmentControl addTarget:self action:@selector(selectedIndedChanged:) forControlEvents:UIControlEventValueChanged];
    [topBarView addSubview:self.segmentControl];
    
    FirstViewController *firstvc = [[FirstViewController alloc] init];
    SecondViewController *secondvc = [SecondViewController new];
    self.viewControllers = @[firstvc,secondvc];
    [self setSelectedIndex:0];
    
}

- (void)selectedIndedChanged:(UISegmentedControl*)segmentControl{
    self.selectedIndex = segmentControl.selectedSegmentIndex;
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex{
    UIViewController *selectedViewController = [self.viewControllers objectAtIndex:selectedIndex];
    UIViewController *originalViewController = self.selectedViewController;
    self.selectedViewController = selectedViewController;
    [self changeFromViewController:originalViewController toViewController:selectedViewController];
}

- (void)changeFromViewController:(UIViewController*)fromViewController toViewController:(UIViewController*)toViewController{
    if (fromViewController == toViewController) {
        return;
    }
    
    //第一次进来，直接给正确的Frame，不需要动画效果
    if (toViewController && [self isViewLoaded] && (fromViewController == nil)) {
        [self.view insertSubview:toViewController.view atIndex:0];
        return;
    }
    
    if (fromViewController && [self isViewLoaded]) {
        [self.view insertSubview:fromViewController.view atIndex:0];
    }
    if (toViewController && [self isViewLoaded]) {
        [self.view insertSubview:toViewController.view atIndex:0];
    }
    if (fromViewController != nil) {
        [fromViewController.view removeFromSuperview];
    }
}

- (void)setViewControllers:(NSArray *)viewControllers animated:(BOOL)animated{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
