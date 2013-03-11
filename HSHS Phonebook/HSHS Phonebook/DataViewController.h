//
//  DataViewController.h
//  HSHS Phonebook
//
//  Created by Shane Miller on 3/11/13.
//  Copyright (c) 2013 HSHS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DataViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *dataLabel;
@property (strong, nonatomic) id dataObject;

@end
