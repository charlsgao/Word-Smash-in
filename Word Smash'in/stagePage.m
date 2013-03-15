//
//  stagePage.m
//  Word Smash'in
//
//  Created by Daniel on 3/4/13.
//  Copyright (c) 2013 Bing. All rights reserved.
//

#import "stagePage.h"

@interface stagePage ()

@end


@implementation stagePage

const bool TEST_MODE = false;                // A FLAG TO INDICATE WHETHER THE GAME IS IN TEST MODE

const int MAX_LETTER_ARRAY = 10;             // SIZE OF THE LETTER ARRAY
const int MAX_BUTTON_APPEAR = 9;             // MAXIMUM NUMBER OF BUTTONS APPEAR ON EACH TIME STEP
const int STARTING_MINUTES = 0;              // STAGE DURATION
const int STARTING_SECONDS = 5;              // STAGE DURATION

NSString *l;
int currMinute;
int currSeconds;
NSString *STARTING_TIME = @"Time : 0:05";
BOOL STOP = false;
BOOL isON[MAX_LETTER_ARRAY];



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    srand ( time(NULL) );//clear out random numbers
    
    self.strArray = [NSArray arrayWithObjects:@"hello",@"world",@"Edward",@"Bing",@"Wenhao",@"Denny",nil];
    
    
    self.BUTTON_APPEAR_DURATION =1.0;
    
    [self initialize];
    [self hideButtons];
    
    [super viewDidLoad];
    
    if (TEST_MODE)
        [self testMode];
	// Do any additional setup after loading the view.

}


//**************  start the game  ************************
-(IBAction)start{
    
    [self getWords];
    
    [self.aTimer invalidate];
    [self.timer invalidate];
    self.timer = nil;
    self.aTimer = nil;
    
    currMinute = STARTING_MINUTES;
    currSeconds = STARTING_SECONDS;
    
    self.clock.textColor=[UIColor redColor];
    [self.clock setText: STARTING_TIME];
    self.clock.backgroundColor=[UIColor clearColor];
    
    STOP = false;
    self.startButton.hidden = true;
    self.clock.hidden = false;
    
    
    //stage timer
    self.timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerFired) userInfo:nil repeats:YES];
    
    
    //button appear timer
    self.aTimer = [NSTimer scheduledTimerWithTimeInterval:self.BUTTON_APPEAR_DURATION target:self selector:@selector(onTick) userInfo:nil repeats:YES];
}


//************** generating the words **********************
- (void) getWords{
    int r1, r2, r3;
    r2=r3=-1;
    r1 = rand() % 5;
    self.word1.text = self.strArray[r1];
    
    r2 = rand()%5;
    while (r2==r1){ r2 = rand() % 5;}
    self.word2.text = self.strArray[r2];
    
    r3 = rand()%5;
    while (r3==r1 || r3 == r2){ r3 = rand() % 5;}
    self.word3.text = self.strArray[r3];
    
}


//************** initialize all variable **********************
- (void) initialize{
    
    l = @"";
    
    
    self.clock.hidden = true;
    
    self.word1.text = @"";
    self.word2.text = @"";
    self.word3.text = @"";
    
    //*************initialize the 10 letter spaces*************
    self.w1.hidden = true;
    self.w2.hidden = true;
    self.w3.hidden = true;
    self.w4.hidden = true;
    self.w5.hidden = true;
    self.w6.hidden = true;
    self.w7.hidden = true;
    self.w8.hidden = true;
    self.w9.hidden = true;
    self.w10.hidden = true;

    for(int i=0; i<MAX_LETTER_ARRAY; i++){
        isON[i] = false;
    }
   /*
    char character;
    
    for (int i=0;i<MAX_LETTERS;i++){
        character = (char)((rand()%26) + 65);
        letters[i] = [NSString stringWithFormat:@"%c" , character];
    }
    */
}

-(void) hideButtons{
    
    self.button1.hidden = true;
    self.button2.hidden = true;
    self.button3.hidden = true;
    self.button4.hidden = true;
    self.button5.hidden = true;
    self.button6.hidden = true;
    self.button6.hidden = true;
    self.button7.hidden = true;
    self.button8.hidden = true;
    self.button9.hidden = true;
}


//************** Timer action **********************
- (void)onTick{
    
    if (!STOP){
        [self hideButtons];
        int max_buttons = rand() % MAX_BUTTON_APPEAR + 1;
        
        for (int i=0; i<max_buttons; i++)
            [self generateButton];
    
    }
    else{
        [self hideButtons];
        self.clock.hidden = true;
        self.startButton.hidden = false;
        [self initialize];
        [self.aTimer invalidate];
    }
}

- (void) generateButton{
    char c;
    NSString *l;
    UIButton *b;
    c = (char)((rand()%26) + 65);
    l = [NSString stringWithFormat:@"%c" , c];
    int buttonToAppear = rand()%8 + 1;
    switch (buttonToAppear) {
        case 1: b = self.button1; break;
        case 2: b = self.button2; break;
        case 3: b = self.button3; break;
        case 4: b = self.button4; break;
        case 5: b = self.button5; break;
        case 6: b = self.button6; break;
        case 7: b = self.button7; break;
        case 8: b = self.button8; break;
        case 9: b = self.button9; break;
        default: break;
    }
    b.hidden = false;
    [b setTitle:l forState:UIControlStateNormal];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)buttonAction:(id)sender{
    UIButton *b = (UIButton*) sender;
    
    l = b.titleLabel.text;;
    [self displayLabel];
    b.hidden = true;
    
}

- (IBAction)wACTION:(id)sender{
    UIButton *b = (UIButton*) sender;
    b.hidden = true;
    
    if (b == self.w1)
        isON[0] = false;
    else if (b==self.w2)
        isON[1] = false;
    else if (b==self.w3)
        isON[2] = false;
    else if (b==self.w4)
        isON[3] = false;
    else if (b==self.w5)
        isON[4] = false;
    else if (b==self.w6)
        isON[5] = false;
    else if (b==self.w7)
        isON[6] = false;
    else if (b==self.w8)
        isON[7] = false;
    else if (b==self.w9)
        isON[8] = false;
    else if (b==self.w10)
        isON[9] = false;
}




- (void) displayLabel{
    
    int position=-1;
    
    //find the available position to place the letter
    for(int i=0; i<MAX_LETTER_ARRAY; i++){
        if (!isON[i]){
            position = i+1;
            isON[i] = true;
            break;
        }
    }
    
    switch (position){
        case 1: self.w1.hidden = false;[self.w1 setTitle:l forState:UIControlStateNormal];break;
        case 2: self.w2.hidden = false;[self.w2 setTitle:l forState:UIControlStateNormal];break;
        case 3: self.w3.hidden = false;[self.w3 setTitle:l forState:UIControlStateNormal];break;
        case 4: self.w4.hidden = false;[self.w4 setTitle:l forState:UIControlStateNormal];break;
        case 5: self.w5.hidden = false;[self.w5 setTitle:l forState:UIControlStateNormal];break;
        case 6: self.w6.hidden = false;[self.w6 setTitle:l forState:UIControlStateNormal];break;
        case 7: self.w7.hidden = false;[self.w7 setTitle:l forState:UIControlStateNormal];break;
        case 8: self.w8.hidden = false;[self.w8 setTitle:l forState:UIControlStateNormal];break;
        case 9: self.w9.hidden = false;[self.w9 setTitle:l forState:UIControlStateNormal];break;
        case 10: self.w10.hidden = false;[self.w10 setTitle:l forState:UIControlStateNormal];break;
        default: break;
    }
    
   
}


-(void)timerFired
{
    // time's up
    if (currMinute ==0 && currSeconds == 1){
        [self.timer invalidate];
        STOP = true;
    }
    
    // if the game is still playing....
    else if((currMinute>0 || currSeconds>=0) && currMinute>=0)
    {
        if(currSeconds==0)
        {
            currMinute-=1;
            currSeconds=59;
        }
        else if(currSeconds>0)
        {
            currSeconds-=1;
        }
        if(currMinute>-1)
            [self.clock setText:[NSString stringWithFormat:@"%@%d%@%02d",@"Time : ",currMinute,@":",currSeconds]];
    }
    
    // time's up
    else
    {
        [self.timer invalidate];
    }
    
    
}

-(void) testMode
{
    self.startButton.hidden = true;
    [self test_generateButton];
    [self test_hideButtons];
    [self test_displayLabel];
}
-(void) test_generateButton
{
    [self generateButton];
    
    if (self.button1.hidden == true || self.button2.hidden == true ||
        self.button3.hidden == true || self.button4.hidden == true ||
        self.button5.hidden == true || self.button6.hidden == true ||
        self.button7.hidden == true || self.button8.hidden == true ||
        self.button9.hidden == true)
        NSLog(@"Button(s) generated correctly!");
    else
        NSLog(@"Error, no buttons are generated!");
}

-(void) test_hideButtons
{
    [self hideButtons];
    if (self.button1.hidden == false)
        NSLog(@"Error, button1 is not hidden!");
    else if (self.button2.hidden == false)
        NSLog(@"Error, button2 is not hidden!");
    else if (self.button3.hidden == false)
        NSLog(@"Error, button3 is not hidden!");
    else if (self.button4.hidden == false)
        NSLog(@"Error, button4 is not hidden!");
    else if (self.button5.hidden == false)
        NSLog(@"Error, button5 is not hidden!");
    else if (self.button6.hidden == false)
        NSLog(@"Error, button6 is not hidden!");
    else if (self.button7.hidden == false)
        NSLog(@"Error, button7 is not hidden!");
    else if (self.button8.hidden == false)
        NSLog(@"Error, button8 is not hidden!");
    else if (self.button9.hidden == false)
        NSLog(@"Error, button9 is not hidden!");
    else
        NSLog(@"All buttons are hidden!");
}

-(void) test_displayLabel
{
    l = @"a";
    
    for(int i=0; i<MAX_LETTER_ARRAY; i++){
        [self displayLabel];
    }
    if (self.w1.hidden == false && self.w2.hidden == false &&
        self.w3.hidden == false && self.w4.hidden == false &&
        self.w5.hidden == false && self.w6.hidden == false &&
        self.w7.hidden == false && self.w8.hidden == false &&
        self.w9.hidden == false && self.w10.hidden == false){
        NSLog(@"All letters displayed correctly!");
    }
    else
        NSLog(@"Error, letter array buttons did not display properly!");
        
}

@end
