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

@property (weak, nonatomic) IBOutlet UILabel *w1;
@property (weak, nonatomic) IBOutlet UILabel *w2;
@property (weak, nonatomic) IBOutlet UILabel *w3;
@property (weak, nonatomic) IBOutlet UILabel *w4;
@property (weak, nonatomic) IBOutlet UILabel *w5;
@property (weak, nonatomic) IBOutlet UILabel *w6;
@property (weak, nonatomic) IBOutlet UILabel *w7;
@property (weak, nonatomic) IBOutlet UILabel *w8;
@property (weak, nonatomic) IBOutlet UILabel *w9;
@property (weak, nonatomic) IBOutlet UILabel *w10;


- (IBAction)buttonAction:(id)sender;
- (void) hideButtons;
- (void) initialize;
- (void) displayLabel;
- (void) onTick;

@property (strong, nonatomic) NSArray *strArray;

//set timer
@property (nonatomic, retain) NSTimer *aTimer;



@end
