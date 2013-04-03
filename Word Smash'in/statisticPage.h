//
//  statisticPage.h
//  Word Smash'in
//
//  Created by Denny Winoto on 3/14/13.
//  Copyright (c) 2013 Bing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface statisticPage : UIViewController

@property (nonatomic) IBOutlet UILabel *word1;
@property (nonatomic) IBOutlet UILabel *word2;
@property (nonatomic) IBOutlet UILabel *word3;

@property (nonatomic) IBOutlet UILabel *result1;
@property (nonatomic) IBOutlet UILabel *result2;
@property (nonatomic) IBOutlet UILabel *result3;

@property (nonatomic) IBOutlet UILabel *totalScore;

- (IBAction)playAgain:(id)sender;
- (IBAction)levelPage:(id)sender;
- (IBAction)scorePage:(id)sender;
- (IBAction)homePage:(id)sender;

@end
