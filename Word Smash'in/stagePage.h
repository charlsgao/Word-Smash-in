//
//  stagePage.h
//  Word Smash'in
//
//  Created by Daniel on 3/4/13.
//  Copyright (c) 2013 Bing. All rights reserved.
//

#import <UIKit/UIKit.h>

double BUTTON_APPEAR_DURATION;

NSString *word_1;
NSString *word_2;
NSString *word_3;

NSInteger score_1;
NSInteger score_2;
NSInteger score_3;

double BUTTON_APPEAR_DURATION;  // THE TIME THAT THE BUTTON APPEAR, GETTING SMALLER AND SMALLER ALONG WITH THE LEVEL INCREASES

NSInteger score;
//const int MAX_LETTERS = 10;

@interface stagePage : UIViewController
@property (nonatomic) IBOutlet UILabel *word1;
@property (nonatomic) IBOutlet UILabel *word2;
@property (nonatomic) IBOutlet UILabel *word3;

@property (nonatomic) IBOutlet UIButton *button1;
@property (nonatomic) IBOutlet UIButton *button2;
@property (nonatomic) IBOutlet UIButton *button3;
@property (nonatomic) IBOutlet UIButton *button4;
@property (nonatomic) IBOutlet UIButton *button5;
@property (nonatomic) IBOutlet UIButton *button6;
@property (nonatomic) IBOutlet UIButton *button7;
@property (nonatomic) IBOutlet UIButton *button8;
@property (nonatomic) IBOutlet UIButton *button9;
@property (nonatomic) IBOutletCollection(UIButton) NSArray *buttonCollection;

@property (nonatomic) IBOutlet UIButton *startButton;

@property (nonatomic) IBOutlet UIButton *w1;
@property (nonatomic) IBOutlet UIButton *w2;
@property (nonatomic) IBOutlet UIButton *w3;
@property (nonatomic) IBOutlet UIButton *w4;
@property (nonatomic) IBOutlet UIButton *w5;
@property (nonatomic) IBOutlet UIButton *w6;
@property (nonatomic) IBOutlet UIButton *w7;
@property (nonatomic) IBOutlet UIButton *w8;
@property (nonatomic) IBOutlet UIButton *w9;
@property (nonatomic) IBOutlet UIButton *w10;
@property (nonatomic, retain) IBOutletCollection(UIButton) NSArray *wCollection;

@property (nonatomic) IBOutlet UILabel *clock;
@property (nonatomic) IBOutlet UILabel *scoreLabel;

- (IBAction)start;
- (IBAction)buttonAction:(id)sender;
- (IBAction)wACTION:(id)sender;

- (void) getWords;
- (NSString*) readDictionaryFile:(NSInteger)lineNum fileName:(NSString*)fileName;
- (void) hideButtons;
- (void) initialize;
- (void) displayLabel;
- (void) onTick;
- (void) generateButton;
- (void) timerFired;
- (void) testMode;

@property (nonatomic) NSArray *strArray;
@property (nonatomic) NSTimer *aTimer;              //stage timer
@property (nonatomic) NSTimer *timer;               //button appear duration timer

//test cases
-(void) test_generateButton;  // test case to test the generateButton function is working properly
-(void) test_hideButtons;     // test case to test the hideButton funciton is working properly
-(void) test_displayLabel;    // test case to test the tabbed letters display correctly
//-(void) test_tabButton1;      // test tabbing button1, first letter in letter array will appear

@end
