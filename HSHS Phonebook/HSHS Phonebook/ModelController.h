//
//  ModelController.h
//  HSHS Phonebook
//
//  Created by Shane Miller on 3/11/13.
//  Copyright (c) 2013 HSHS. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DataViewController;

@interface ModelController : NSObject <UIPageViewControllerDataSource>

- (DataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard;
- (NSUInteger)indexOfViewController:(DataViewController *)viewController;

@end
