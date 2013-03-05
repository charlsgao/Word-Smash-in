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

//@synthesize strArrray = _strArray;
//@synthesize word2 = _word2;
//@synthesize word3 = _word3;

@implementation stagePage

NSString *letters[10];
static int count;
NSString *l;
const double SECOND = 0.7;
const int MAX_BUTTON_APPEAR = 3;
const bool LETTER_SPACE_CYCLE_ENABLE = true;
//NSTimer *aTimer, *timer;
const int STARTING_MINUTES = 0;
const int STARTING_SECONDS = 10;
int currMinute;
int currSeconds;
NSString *STARTING_TIME = @"Time : 0:10";
BOOL STOP = false;


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
    [self initialize];
    [self hideButtons];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.

    
    
    //self.aTimer = [NSTimer scheduledTimerWithTimeInterval:SECOND target:self selector:@selector(onTick) userInfo:nil repeats:YES];
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
    self.aTimer = [NSTimer scheduledTimerWithTimeInterval:SECOND target:self selector:@selector(onTick) userInfo:nil repeats:YES];
    
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
    
    count = 1;
    l = @"";
    
    
    self.clock.hidden = true;
    
    self.word1.text = @"";
    self.word2.text = @"";
    self.word3.text = @"";
    
    //*************initialize the 10 letter spaces*************
    self.w1.text = @"";
    self.w2.text = @"";
    self.w3.text = @"";
    self.w4.text = @"";
    self.w5.text = @"";
    self.w6.text = @"";
    self.w7.text = @"";
    self.w8.text = @"";
    self.w9.text = @"";
    self.w10.text = @"";
    
    char character;
    
    for (int i=0;i<MAX_LETTERS;i++){
        character = (char)((rand()%26) + 65);
        letters[i] = [NSString stringWithFormat:@"%c" , character];
    }
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

- (void) displayLabel{
    switch (count){
        case 1: self.w1.text = l;break;
        case 2: self.w2.text = l;break;
        case 3: self.w3.text = l;break;
        case 4: self.w4.text = l;break;
        case 5: self.w5.text = l;break;
        case 6: self.w6.text = l;break;
        case 7: self.w7.text = l;break;
        case 8: self.w8.text = l;break;
        case 9: self.w9.text = l;break;
        case 10: self.w10.text = l;break;
        default: break;
    }
    
    count++;
    if (count > MAX_LETTERS)
        if (LETTER_SPACE_CYCLE_ENABLE)
            count=1;
}


-(void)timerFired
{
    
    if (currMinute ==0 && currSeconds == 1){
        [self.timer invalidate];
        STOP = true;
    }
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
    else
    {
        [self.timer invalidate];
    }
    
    
}


@end
