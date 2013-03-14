//
//  stagePage.h
//  Word Smash'in
//
//  Created by Daniel on 3/4/13.
//  Copyright (c) 2013 Bing. All rights reserved.
//

#import <UIKit/UIKit.h>

const int MAX_LETTERS = 10;

@interface stagePage : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *word1;
@property (weak, nonatomic) IBOutlet UILabel *word2;
@property (weak, nonatomic) IBOutlet UILabel *word3;

@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIButton *button3;
@property (weak, nonatomic) IBOutlet UIButton *button4;
@property (weak, nonatomic) IBOutlet UIButton *button5;
@property (weak, nonatomic) IBOutlet UIButton *button6;
@property (weak, nonatomic) IBOutlet UIButton *button7;
@property (weak, nonatomic) IBOutlet UIButton *button8;
@property (weak, nonatomic) IBOutlet UIButton *button9;

@property (weak, nonatomic) IBOutlet UIButton *startButton;

@property (weak, nonatomic) IBOutlet UIButton *w1;
@property (weak, nonatomic) IBOutlet UIButton *w2;
@property (weak, nonatomic) IBOutlet UIButton *w3;
@property (weak, nonatomic) IBOutlet UIButton *w4;
@property (weak, nonatomic) IBOutlet UIButton *w5;
@property (weak, nonatomic) IBOutlet UIButton *w6;
@property (weak, nonatomic) IBOutlet UIButton *w7;
@property (weak, nonatomic) IBOutlet UIButton *w8;
@property (weak, nonatomic) IBOutlet UIButton *w9;
@property (weak, nonatomic) IBOutlet UIButton *w10;

- (IBAction)wACTION:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *clock;

- (IBAction)start;
- (IBAction)buttonAction:(id)sender;


- (void) getWords;
- (void) hideButtons;
- (void) initialize;
- (void) displayLabel;
- (void) onTick;
- (void) generateButton;
- (void) timerFired;

@property (strong, nonatomic) NSArray *strArray;
@property (strong, nonatomic) NSTimer *aTimer;
@property (strong, nonatomic) NSTimer *timer;

//set timer
//@property (nonatomic, retain) NSTimer *aTimer;



@end
