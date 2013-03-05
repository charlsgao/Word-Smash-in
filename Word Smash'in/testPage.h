//
//  testPage.h
//  Word Smash'in
//
//  Created by Daniel on 3/4/13.
//  Copyright (c) 2013 Bing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface testPage : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *progress;


-(IBAction)start;
- (void) timerFired;
@end
