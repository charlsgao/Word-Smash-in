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
const int STARTING_SECONDS = 30;             // STAGE DURATION
const int INCR_SCORE = 10;                   // score increment step


NSString *l;
int currMinute;
int currSeconds;
NSString *STARTING_TIME = @"Time : 1:00";
BOOL STOP = false;
NSString *letter[MAX_LETTER_ARRAY];
int total_tests = 0;
int successful_tests = 0;
int failed_tests = 0;
NSInteger score = 0;

NSMutableDictionary *word1Dict;
NSMutableDictionary *word2Dict;
NSMutableDictionary *word3Dict;

NSMutableDictionary *lettersDict;


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
    
    self.strArray = [NSArray arrayWithObjects:@"HELLO",@"WORLD",@"EDWARD",@"BING",@"WENHAO",@"DENNY",nil];
    
    
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
    //self.word1.text = @"Edwarda";
    [self parseWord: self.word1.text dictionary:word1Dict];
    [self parseWord: self.word2.text dictionary:word2Dict];
    [self parseWord: self.word3.text dictionary:word3Dict];
    
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
    
    for (int i=0;i<MAX_LETTERS;i++){
        letter[i] = nil;
    }
    
    word1Dict= [NSMutableDictionary dictionary];
    word2Dict= [NSMutableDictionary dictionary];
    word3Dict= [NSMutableDictionary dictionary];
    
    lettersDict= [NSMutableDictionary dictionary];
    
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
        [self endOfGame];
        [self.aTimer invalidate];
    }
}

//When the game finishes
-(void) endOfGame{
    [self hideButtons];
    self.clock.hidden = true;
    self.startButton.hidden = false;
    [self countLetters];
    
    score = [self getScore:word1Dict];
    score += [self getScore:word2Dict];
    score += [self getScore:word3Dict];
    /*
    for (int i =0; i<MAX_LETTER_ARRAY;i++)
        NSLog(@"%@", letter[i]);
    */
    NSLog(@"%i", score);
    
    word1Dict = nil;
    word2Dict = nil;
    word3Dict = nil;
    lettersDict = nil;
    [self initialize];
}

// calculate the score
-(NSInteger) getScore: (NSMutableDictionary*) dict{
    Boolean hit = false;
    //NSInteger score = 0;
    
    for (id wordkey in dict){ //for each key in the word dictionary
        for (id letterkey in lettersDict){ //compare with each key in letter dictionary
            if ([wordkey isEqualToString:letterkey] && ([[lettersDict objectForKey:letterkey] intValue] >= [[dict objectForKey:wordkey] intValue])){
                hit = true;
            }
        }
        if (!hit) return 0;
        else hit = false;
    }

    return INCR_SCORE;
}


//counting letters occurance in letter array
-(void) countLetters{
    
    NSInteger count = 0;
    
    for (int i=0; i<MAX_LETTER_ARRAY; i++){
        
        if ([lettersDict objectForKey:letter[i]]==nil && letter[i]!=nil){
            for (int j=i; j<MAX_LETTER_ARRAY; j++){
                if ([letter[i] isEqualToString:letter[j]])
                    count++;
            }
            [lettersDict setObject:[NSString stringWithFormat:@"%i", count] forKey:letter[i]];
        }
        count = 1;  // reset count
    }
    
    for (id key in lettersDict) {
        NSLog(@"key: %@, value: %@", key, [lettersDict objectForKey:key]);
    }
}

//counting letters occurance in a word
-(void)parseWord: (NSString*) str dictionary:(NSMutableDictionary*) dict{
    if (str == NULL)
        return;
    
    NSString *key, *value;
    NSInteger numberOfChar=0;
    NSInteger i = 0;
    char c;
    
    for (i=0; i<[str length];i++){
        
        c = [str characterAtIndex:i];
        key = [NSString stringWithFormat:@"%c",c];
        if ([dict objectForKey:key]==nil){        //if c is not one of the key in dictionary
            //numberOfChar = [self occurrencesOfCharacter: &c nsstring:str];
            numberOfChar = [[str componentsSeparatedByString:key] count] - 1;
            value = [NSString stringWithFormat:@"%d", numberOfChar];
            [dict setObject:value forKey: key];
        }
    }
   /*
   for (id key in dict) {
        NSLog(@"key: %@, value: %@", key, [dict objectForKey:key]);
    }
    */
}




//generating a button to appear
- (void) generateButton{
    UIButton *b;
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
    
    [self getLetter];
    
    b.hidden = false;
    [b setTitle:l forState:UIControlStateNormal];
    
}

//generating a letter to show on the button
- (void)getLetter{
    char c;
    c = (char)((rand()%26) + 65);
    l = [NSString stringWithFormat:@"%c" , c];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//action for tabbing the 9-grid buttons
- (IBAction)buttonAction:(id)sender{
    UIButton *b = (UIButton*) sender;
    
    l = b.titleLabel.text;;
    [self displayLabel];
    b.hidden = true;
    
}

//action for letter array buttons
- (IBAction)wACTION:(id)sender{
    UIButton *b = (UIButton*) sender;
    b.hidden = true;
    
    if (b == self.w1)
        letter[0] = nil;
    else if (b==self.w2)
        letter[1] = nil;
    else if (b==self.w3)
        letter[2] = nil;
    else if (b==self.w4)
        letter[3] = nil;
    else if (b==self.w5)
        letter[4] = nil;
    else if (b==self.w6)
        letter[5] = nil;
    else if (b==self.w7)
        letter[6] = nil;
    else if (b==self.w8)
        letter[7] = nil;
    else if (b==self.w9)
        letter[8] = nil;
    else if (b==self.w10)
        letter[9] = nil;
}




- (void) displayLabel{
    
    int position=-1;
    
    //find the available position to place the letter
    for(int i=0; i<MAX_LETTER_ARRAY; i++){
        if (letter[i] == nil){
            position = i+1;
            letter[i] = l;
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



/************************************************************
                        TEST CASES
 ***********************************************************/

-(void) testMode
{
    [self test_displayLabel];
    [self test_generateButton];
    [self test_hideButtons];
    [self test_simulate_getting_1_char];
    [self test_simulate_getting_2_char];
    [self test_simulate_getting_5_char];
    [self test_simulate_getting_9_char];
    NSLog(@"Total Number of Tests: %i", total_tests);
    NSLog(@"Successful Tests: %i", successful_tests);
    NSLog(@"Failed Tests: %i", failed_tests);
    
}

-(bool) cmp_char_vals: (NSMutableArray*)holder Value:(NSArray*) value fromButton:(NSMutableArray*) button
{
    int i = 0;
    //if number of holder is not equal to the number of obtained characters, return false
    if ([holder count] != [value count] || [holder count] != [button count]){
        return false;
    }
    
    //Iterate through the lists and ensure that the holder titles matches with the data its holding
    for (UIButton*h in holder){
        if(h.titleLabel.text != value[i] && ((UIButton*) button[i]).hidden != true){
            return false;
        }
        i++;
    }
    return true;
}

-(void) test_simulate_getting_9_char
{
    total_tests ++;
    self.startButton.hidden = true;
    [self.button3 setTitle:@"A" forState:UIControlStateNormal];
    [self buttonAction:(UIButton*)self.button3];
    [self.button7 setTitle:@"B" forState:UIControlStateNormal];
    [self buttonAction:(UIButton*)self.button7];
    [self.button2 setTitle:@"C" forState:UIControlStateNormal];
    [self buttonAction:(UIButton*)self.button2];
    [self.button5 setTitle:@"X" forState:UIControlStateNormal];
    [self buttonAction:(UIButton*)self.button5];
    [self.button1 setTitle:@"Y" forState:UIControlStateNormal];
    [self buttonAction:(UIButton*)self.button1];
    [self.button6 setTitle:@"Z" forState:UIControlStateNormal];
    [self buttonAction:(UIButton*)self.button6];
    [self.button9 setTitle:@"J" forState:UIControlStateNormal];
    [self buttonAction:(UIButton*)self.button9];
    [self.button4 setTitle:@"Q" forState:UIControlStateNormal];
    [self buttonAction:(UIButton*)self.button4];
    [self.button8 setTitle:@"K" forState:UIControlStateNormal];
    [self buttonAction:(UIButton*)self.button8];
    
    
    //Store the holders with values in an array
    NSMutableArray *holder_array = [NSMutableArray array];
    [holder_array addObject:self.w1];
    [holder_array addObject:self.w2];
    [holder_array addObject:self.w3];
    [holder_array addObject:self.w4];
    [holder_array addObject:self.w5];
    [holder_array addObject:self.w6];
    [holder_array addObject:self.w7];
    [holder_array addObject:self.w8];
    [holder_array addObject:self.w9];
    
    //Store the values in an array
    NSArray *value_array = [NSArray arrayWithObjects:@"A", @"B", @"C", @"X", @"Y", @"Z", @"J", @"Q", @"K", nil];
    
    //Store the clicked buttons in an aray
    NSMutableArray *button_array = [NSMutableArray array];
    [button_array addObject:self.button3];
    [button_array addObject:self.button7];
    [button_array addObject:self.button2];
    [button_array addObject:self.button5];
    [button_array addObject:self.button1];
    [button_array addObject:self.button6];
    [button_array addObject:self.button9];
    [button_array addObject:self.button4];
    [button_array addObject:self.button8];
    
    //Iterate through the lists of holders, values, and buttons and ensure that they have the expected corresponding values
    if ([self cmp_char_vals:holder_array Value:value_array fromButton:button_array]){
        NSLog(@"Passed test_simulate_getting_9_char!");
        successful_tests ++;
    }
    else{
        NSLog(@"Error, letter appeared does not match expected!");
        failed_tests ++;
    }
    [self reset];
}

-(void) test_simulate_getting_5_char
{
    total_tests ++;
    self.startButton.hidden = true;
    [self.button3 setTitle:@"A" forState:UIControlStateNormal];
    [self buttonAction:(UIButton*)self.button3];
    [self.button7 setTitle:@"B" forState:UIControlStateNormal];
    [self buttonAction:(UIButton*)self.button7];
    [self.button2 setTitle:@"C" forState:UIControlStateNormal];
    [self buttonAction:(UIButton*)self.button2];
    [self.button5 setTitle:@"Y" forState:UIControlStateNormal];
    [self buttonAction:(UIButton*)self.button5];
    [self.button1 setTitle:@"Z" forState:UIControlStateNormal];
    [self buttonAction:(UIButton*)self.button1];
    
    //Store the holders with values in an array
    NSMutableArray *holder_array = [NSMutableArray array];
    [holder_array addObject:self.w1];
    [holder_array addObject:self.w2];
    [holder_array addObject:self.w3];
    [holder_array addObject:self.w4];
    [holder_array addObject:self.w5];
    
    //Store the values in an array
    NSArray *value_array = [NSArray arrayWithObjects:@"A", @"B", @"C", @"Y", @"Z", nil];
    
    //Store the clicked buttons in an aray
    NSMutableArray *button_array = [NSMutableArray array];
    [button_array addObject:self.button3];
    [button_array addObject:self.button7];
    [button_array addObject:self.button2];
    [button_array addObject:self.button5];
    [button_array addObject:self.button1];
    
    //Iterate through the lists of holders, values, and buttons and ensure that they have the expected corresponding values
    if ([self cmp_char_vals:holder_array Value:value_array fromButton:button_array]){
        NSLog(@"Passed test_simulate_getting_5_char!");
        successful_tests ++;
    }
    else{
        NSLog(@"Error, letter appeared does not match expected!");
        failed_tests ++;
    }
    [self reset];
}

-(void) test_simulate_getting_2_char
{
    total_tests ++;
    self.startButton.hidden = true;
    [self.button3 setTitle:@"C" forState:UIControlStateNormal];
    [self buttonAction:(UIButton*)self.button3];
    [self.button7 setTitle:@"A" forState:UIControlStateNormal];
    [self buttonAction:(UIButton*)self.button7];
    
    //Store the holders with values in an array
    NSMutableArray *holder_array = [NSMutableArray array];
    [holder_array addObject:self.w1];
    [holder_array addObject:self.w2];
    
    //Store the values in an array
    NSArray *value_array = [NSArray arrayWithObjects:@"C", @"A", nil];
    
    //Store the clicked buttons in an aray
    NSMutableArray *button_array = [NSMutableArray array];
    [button_array addObject:self.button3];
    [button_array addObject:self.button7];
    
    //Iterate through the lists of holders, values, and buttons and ensure that they have the expected corresponding values
    if ([self cmp_char_vals:holder_array Value:value_array fromButton:button_array]){
        NSLog(@"Passed test_simulate_getting_2_char!");
        successful_tests ++;
    }
    else{
        NSLog(@"Error, letter appeared does not match expected!");
        failed_tests ++;
    }
    [self reset];
}

-(void) test_simulate_getting_1_char
{
    total_tests ++;
    self.startButton.hidden = true;
    [self.button2 setTitle:@"B" forState:UIControlStateNormal];
    [self buttonAction:(UIButton*)self.button2];
    
    //Store the holders with values in an array
    NSMutableArray *holder_array = [NSMutableArray array];
    [holder_array addObject:self.w1];
    
    //Store the values in an array
    NSArray *value_array = [NSArray arrayWithObject:@"B"];
    
    //Store the clicked buttons in an aray
    NSMutableArray *button_array = [NSMutableArray array];
    [button_array addObject:self.button2];
    
    //Iterate through the lists of holders, values, and buttons and ensure that they have the expected corresponding values
    if ([self cmp_char_vals:holder_array Value:value_array fromButton:button_array]){
        NSLog(@"Passed test_simulate_getting_1_char!");
        successful_tests ++;
    }
    else{
        NSLog(@"Error, letter appeared does not match expected!");
        failed_tests ++;
    }
    [self reset];
    
}



//self.startButton.hidden = true;
//[self test_generateButton];
//[self test_hideButtons];
//[self test_displayLabel];

-(void) test_generateButton
{
    total_tests ++;
    [self generateButton];
    
    if (self.button1.hidden == true || self.button2.hidden == true ||
        self.button3.hidden == true || self.button4.hidden == true ||
        self.button5.hidden == true || self.button6.hidden == true ||
        self.button7.hidden == true || self.button8.hidden == true ||
        self.button9.hidden == true){
        NSLog(@"Button(s) generated correctly!");
        successful_tests ++;
    }
    else{
        NSLog(@"Error, no buttons are generated!");
        failed_tests ++;
    }
    [self reset];
}

-(void) test_hideButtons
{
    total_tests ++;
    bool pass=false;
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
    else{
        pass = true;
        NSLog(@"All buttons are hidden!");
    }
    if (pass){
        successful_tests ++;
    }
    else{
        failed_tests ++;
    }
    [self reset];
}

-(void) test_displayLabel
{
    total_tests ++;
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
        successful_tests ++;
    }
    else{
        NSLog(@"Error, letter array buttons did not display properly!");
        failed_tests ++;
    }
    [self reset];
}

-(void) reset{
    [self initialize];
    [self hideButtons];
}

@end
