//
//  levelPage.h
//  Word Smash'in
//
//  Created by Denny Winoto on 3/14/13.
//  Copyright (c) 2013 Bing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface levelPage : UIViewController

@property (nonatomic, retain) IBOutletCollection(UIButton) NSArray *levelButton;

@property NSInteger level;

- (IBAction)select_action:(id)sender;

@end

