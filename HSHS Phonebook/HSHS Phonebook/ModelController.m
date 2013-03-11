//
//  ModelController.m
//  HSHS Phonebook
//
//  Created by Shane Miller on 3/11/13.
//  Copyright (c) 2013 HSHS. All rights reserved.
//

#import "ModelController.h"

#import "DataViewController.h"

/*
 A controller object that manages a simple model -- a collection of month names.
 
 The controller serves as the data source for the page view controller; it therefore implements pageViewController:viewControllerBeforeViewController: and pageViewController:viewControllerAfterViewController:.
 It also implements a custom method, viewControllerAtIndex: which is useful in the implementation of the data source methods, and in the initial configuration of the application.
 
 There is no need to actually create view controllers for each page in advance -- indeed doing so incurs unnecessary overhead. Given the data model, these methods create, configure, and return a new view controller on demand.
 */

@interface ModelController()
@property (readonly, strong, nonatomic) NSMutableArray *pageData;
@end

@implementation ModelController

- (id)init
{
    self = [super init];
    if (self) {
        // Create the data model.
        //NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        //_pageData =  [[dateFormatter monthSymbols] copy];
        _pageData = [[NSMutableArray alloc] init];
        [_pageData addObject:@"Contents"];
        [_pageData addObject:@"Favorites"];
        [_pageData addObject:@"Search"];
        [_pageData addObject:@"A"];
        [_pageData addObject:@"B"];
        [_pageData addObject:@"C"];
        [_pageData addObject:@"D"];
        [_pageData addObject:@"E"];
        [_pageData addObject:@"F"];
        [_pageData addObject:@"G"];
        [_pageData addObject:@"H"];
        [_pageData addObject:@"I"];
        [_pageData addObject:@"J"];
        [_pageData addObject:@"K"];
        [_pageData addObject:@"L"];
        [_pageData addObject:@"M"];
        [_pageData addObject:@"N"];
        [_pageData addObject:@"O"];
        [_pageData addObject:@"P"];
        [_pageData addObject:@"Q"];
        [_pageData addObject:@"R"];
        [_pageData addObject:@"S"];
        [_pageData addObject:@"T"];
        [_pageData addObject:@"U"];
        [_pageData addObject:@"V"];
        [_pageData addObject:@"W"];
        [_pageData addObject:@"X"];
        [_pageData addObject:@"Y"];
        [_pageData addObject:@"Z"];
    }
    return self;
}

- (DataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard
{   
    // Return the data view controller for the given index.
    if (([self.pageData count] == 0) || (index >= [self.pageData count])) {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    DataViewController *dataViewController = [storyboard instantiateViewControllerWithIdentifier:@"DataViewController"];
    dataViewController.dataObject = self.pageData[index];
    return dataViewController;
}

- (NSUInteger)indexOfViewController:(DataViewController *)viewController
{   
     // Return the index of the given data view controller.
     // For simplicity, this implementation uses a static array of model objects and the view controller stores the model object; you can therefore use the model object to identify the index.
    return [self.pageData indexOfObject:viewController.dataObject];
}

#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:(DataViewController *)viewController];
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index storyboard:viewController.storyboard];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:(DataViewController *)viewController];
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.pageData count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index storyboard:viewController.storyboard];
}

@end
