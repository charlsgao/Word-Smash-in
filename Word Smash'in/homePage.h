//
//  homePage.h
//  Word Smash'in
//
//  Created by Daniel on 3/2/13.
//  Copyright (c) 2013 Bing. All rights reserved.
//

#import <UIKit/UIKit.h>

// ERROR CODE CONSTANTS
static const int SUCCESS = 1;
static const int ERR_BAD_CREDENTIALS = -1;
static const int ERR_BAD_INPUT = -2;
//static const int ERR_BAD_USERNAME = -3;
//static const int ERR_BAD_PASSWORD = -4;

// ERROR CODE CONSTANTS
//static const int SUCCESS = 1;
static const int ERR_USER_EXISTS = -5;
//static const int ERR_BAD_INPUT = -6;
static const int ERR_BAD_EMAIL = -7;

// ERROR CODE CONSTANTS
//static const int SUCCESS = 1;
static const int ERR_EMAIL_EMPTY = -3;
static const int ERR_EMAIL_NOT_EXISTS = -4;

@interface homePage : UIViewController
- (IBAction)single:(UIButton *)sender;
- (IBAction)multi:(UIButton *)sender;
- (IBAction)shop:(UIButton *)sender;
- (IBAction)help:(id)sender;

@end
