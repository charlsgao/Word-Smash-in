//
//  MultiPlayerScene.m
//  SmashingWord_me
//
//  Created by Edward on 4/8/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "MultiPlayerScene.h"
#import "CCBReader.h"
#import "AppDelegate.h"

@implementation MultiPlayerScene
const bool TEST_MODE_M = false;                // A FLAG TO INDICATE WHETHER THE GAME IS IN TEST MODE

const int MAX_LETTER_ARRAY_M = 10;             // SIZE OF THE LETTER ARRAY
const int MAX_BUTTON_APPEAR_M = 9;             // MAXIMUM NUMBER OF BUTTONS APPEAR ON EACH TIME STEP
const int STARTING_MINUTES_M = 0;              // STAGE DURATION
const int STARTING_SECONDS_M = 30;             // STAGE DURATION
const int INCR_SCORE_M = 10;                   // score increment step

const int TOTAL_WORDS_IN_FILE_M = 20;          // MAXIMUM NUMBER OF WORDS IN A DICTIONARY FILE
const int RANGE_OF_WORD_LENGTH_M = 2;         // RANGE OF WORD LENGTH USED
const int START_OF_WORD_LENGTH_M = 3;
const bool easy_M = false;

NSString *l_M;
int tempTag;
int currMinute;
int currSeconds;
int temp_score;
NSString *STARTING_TIME_M = @"Time : 1:00";
BOOL STOP_M = false;
//NSString *letter[MAX_LETTER_ARRAY_M];
//int total_tests = 0;
//int successful_tests = 0;
//int failed_tests = 0;
//NSInteger score = 0;

NSMutableDictionary *word1Dict;
NSMutableDictionary *word2Dict;
NSMutableDictionary *word3Dict;
NSMutableDictionary *lettersDict;


//************** generating the words **********************
- (void) getWords
{
    int r1, r2, r3;
    int l1, l2, l3;
    NSString *fileName;
    
    r1 = rand() % TOTAL_WORDS_IN_FILE_M;
    l1 = rand() % RANGE_OF_WORD_LENGTH_M + START_OF_WORD_LENGTH_M;
    fileName = [NSString stringWithFormat:@"%i.txt", l1];
    word_1 = [self readDictionaryFile:r1 fileName:fileName];
    [word1 setString:word_1];
    
    r2 = rand() % TOTAL_WORDS_IN_FILE_M;
    l2 = rand() % RANGE_OF_WORD_LENGTH_M + START_OF_WORD_LENGTH_M;
    fileName = [NSString stringWithFormat:@"%i.txt", l2];
    while (r2==r1){ r2 = rand() % TOTAL_WORDS_IN_FILE_M;}
    word_2 = [self readDictionaryFile:r2 fileName:fileName];
    [word2 setString:word_2];
    
    r3 = rand() % TOTAL_WORDS_IN_FILE_M;
    l3 = rand() % RANGE_OF_WORD_LENGTH_M + START_OF_WORD_LENGTH_M;
    fileName = [NSString stringWithFormat:@"%i.txt", l3];
    while (r3==r1 || r3 == r2){ r3 = rand() % TOTAL_WORDS_IN_FILE_M;}
    word_3 = [self readDictionaryFile:r3 fileName:fileName];
    [word3 setString:word_3];
    /************** CHANGE boolean 'easy' ON TOP FOR EASY GAME ****************/
    if(easy_M)
    {
        r1 = rand() % 26;
        l1 = 1;
        fileName = [NSString stringWithFormat:@"%i.txt", l1];
        word_1 = [self readDictionaryFile:r1 fileName:fileName];
        [word1 setString:word_1];
        
        r2 = rand() % 26;
        l2 = 1;
        fileName = [NSString stringWithFormat:@"%i.txt", l2];
        while (r2==r1){ r2 = rand() % TOTAL_WORDS_IN_FILE_M;}
        word_2 = [self readDictionaryFile:r2 fileName:fileName];
        [word2 setString:word_2];
        
        r3 = rand() % 26;
        l3 = 1;
        fileName = [NSString stringWithFormat:@"%i.txt", l3];
        while (r3==r1 || r3 == r2){ r3 = rand() % TOTAL_WORDS_IN_FILE_M;}
        word_3 = [self readDictionaryFile:r3 fileName:fileName];
        [word3 setString:word_3];
    }
}

//************** readDictionaryFile  **********************
// This function will take 2 parameters lineNum and wordLength, read a file called fileName
// containing a dictionary of words and return the corresponding word given the
// line number.
- (NSString*) readDictionaryFile:(NSInteger)lineNum fileName:(NSString*)fileName
{
    
    NSFileManager *filemgr;
    filemgr = [NSFileManager defaultManager];
    
    NSString *home = NSHomeDirectory();
    
    NSString *destinationPath = [NSString stringWithFormat:@"%@/SmashingWord_me.app/%@", home, fileName];
    //NSLog(@"\nText File: %@\n", destinationPath);
    
    /*
     if ([filemgr fileExistsAtPath: destinationPath] == YES)
     NSLog (@"File exists");
     else
     NSLog (@"File not found!");
     */
    
    NSString *readText = [[NSString alloc] initWithContentsOfFile:destinationPath
                                                         encoding:NSUTF8StringEncoding
                                                            error:nil];
    NSArray *lines = [readText componentsSeparatedByString:@"\n"];
    
    //NSLog(@"%@ HAA", lines[lineNum]);
    
    return [lines[lineNum] lowercaseString];
}

-(void) hideButtons{
    [button[0] setNormalImage:[CCSprite spriteWithFile:@"transparent.png"]];
    [button[0] setSelectedImage:[CCSprite spriteWithFile:@"transparent.png"]];
    button[0].isEnabled=NO;
    [self sendHideButton:0];
    [button[1] setNormalImage:[CCSprite spriteWithFile:@"transparent.png"]];
    [button[1] setSelectedImage:[CCSprite spriteWithFile:@"transparent.png"]];
    button[1].isEnabled=NO;
    [self sendHideButton:1];
    [button[2] setNormalImage:[CCSprite spriteWithFile:@"transparent.png"]];
    [button[2] setSelectedImage:[CCSprite spriteWithFile:@"transparent.png"]];
    button[2].isEnabled=NO;
    [self sendHideButton:2];
    [button[3] setNormalImage:[CCSprite spriteWithFile:@"transparent.png"]];
    [button[3] setSelectedImage:[CCSprite spriteWithFile:@"transparent.png"]];
    button[3].isEnabled=NO;
    [self sendHideButton:3];
    [button[4] setNormalImage:[CCSprite spriteWithFile:@"transparent.png"]];
    [button[4] setSelectedImage:[CCSprite spriteWithFile:@"transparent.png"]];
    button[4].isEnabled=NO;
    [self sendHideButton:4];
    [button[5] setNormalImage:[CCSprite spriteWithFile:@"transparent.png"]];
    [button[5] setSelectedImage:[CCSprite spriteWithFile:@"transparent.png"]];
    button[5].isEnabled=NO;
    [self sendHideButton:5];
    [button[6] setNormalImage:[CCSprite spriteWithFile:@"transparent.png"]];
    [button[6] setSelectedImage:[CCSprite spriteWithFile:@"transparent.png"]];
    button[6].isEnabled=NO;
    [self sendHideButton:6];
    [button[7] setNormalImage:[CCSprite spriteWithFile:@"transparent.png"]];
    [button[7] setSelectedImage:[CCSprite spriteWithFile:@"transparent.png"]];
    button[7].isEnabled=NO;
    [self sendHideButton:7];
    [button[8] setNormalImage:[CCSprite spriteWithFile:@"transparent.png"]];
    [button[8] setSelectedImage:[CCSprite spriteWithFile:@"transparent.png"]];
    button[8].isEnabled=NO;
    [self sendHideButton:8];
}


//************** Timer action **********************
-(void)timerFired
{
    // time's up
    if (currMinute ==0 && currSeconds == 1){
        [self.timer invalidate];
        STOP_M = true;
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
        if(currMinute>-1){
            NSString* tempString = [NSString stringWithFormat:@"%@%d%@%02d",@"Time : ",currMinute,@":",currSeconds];
            [clock setString:tempString];
            [self sendTime:[tempString UTF8String]];
        }
        
    }
    
    // time's up
    else
    {
        [self.timer invalidate];
    }
}

- (void)onTick{
    
    if (!STOP_M){
        [self hideButtons];
        if(isPlayer1){
            int max_buttons = rand() % MAX_BUTTON_APPEAR_M + 1;
        
            for (int i=0; i<max_buttons; i++)
                [self generateButton];
        }
        
    }
    else{
        [self matchEnded];
        [self.aTimer invalidate];
    }
}

//When the game finishes
/*
-(void) endOfGame{
    [self hideButtons];
    [self countLetters];
    
    
    my_score = [self getScore:word1Dict];
    my_score += [self getScore:word2Dict];
    my_score += [self getScore:word3Dict];
    [self sendScore:my_score];
    if(isPlayer1)
        [self sendEndGame];

    word1Dict = nil;
    word2Dict = nil;
    word3Dict = nil;
    lettersDict = nil;
    
    if(my_score < opponent_score)
        scorePageMessage = @"You Lost!";
    else if(my_score > opponent_score)
        scorePageMessage = @"You Win!";
    else
        scorePageMessage = @"Tie";
    
    CCScene* scene = [CCBReader sceneWithNodeGraphFromFile:@"Score.ccbi"];
    [[CCDirector sharedDirector]replaceScene:[CCTransitionCrossFade transitionWithDuration:0.3 scene:scene]];
    [self init];
    
}*/

// calculate the score
-(NSInteger) getScore: (NSMutableDictionary*) dict{
    
    if ([dict count]== 0)
        return 0;
    
    Boolean hit = false;
    
    for (id wordkey in dict){ //for each key in the word dictionary
        //NSLog(@"wordkey: %@", wordkey);
        for (id letterkey in lettersDict){ //compare with each key in letter dictionary
            //NSLog(@"%@ %@ %i %i",wordkey, letterkey, [[dict objectForKey:wordkey] intValue], [[lettersDict objectForKey:letterkey] intValue]);
            if ([wordkey isEqualToString:letterkey] && ([[lettersDict objectForKey:letterkey] intValue] >= [[dict objectForKey:wordkey] intValue])){
                hit = true;
                
            }
        }
        if (!hit) return 0;
        else hit = false;
    }
    
    return INCR_SCORE_M;
}


//counting letters occurance in letter array
-(void) countLetters{
    
    NSInteger count = 0;
    
    for (int i=0; i<MAX_LETTER_ARRAY_M; i++){
        
        if ([lettersDict objectForKey:[NSString stringWithFormat:@"%c",(char)(select[i].tag+32)]]==nil && select[i].tag != 0){
            for (int j=i; j<MAX_LETTER_ARRAY_M; j++){
                if (select[i].tag == select[j].tag)
                    count++;
            }
            [lettersDict setObject:[NSString stringWithFormat:@"%i", count] forKey:[NSString stringWithFormat:@"%c",(char)(select[i].tag+32)]];
        }
        count = 0;  // reset count
    }
    /*
     for (id key in lettersDict) {
     NSLog(@"key: %@, value: %@", key, [lettersDict objectForKey:key]);
     }
     */
}

//counting letters occurance in a word
-(void)parseWord: (NSString*) str dictionary:(NSMutableDictionary*) dict{
    if (str == NULL){
        dict = NULL;
        return;
    }
    
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
     }*/
    
}

//generating a button to appear
- (void) generateButton{
    int buttonToAppear = rand()%9 + 1;
    [self getLetter];
    switch (buttonToAppear) {
        case 1:
            [button[0] setNormalImage:[CCSprite spriteWithFile:l_M]];
            [button[0] setSelectedImage:[CCSprite spriteWithFile:l_M]];
            button[0].tag = tempTag;
            button[0].isEnabled=YES;
            [self sendGenerateButton:0 :tempTag];
            break;
        case 2:
            [button[1] setNormalImage:[CCSprite spriteWithFile:l_M]];
            [button[1] setSelectedImage:[CCSprite spriteWithFile:l_M]];
            button[1].tag = tempTag;
            button[1].isEnabled=YES;
            [self sendGenerateButton:1 :tempTag];
            break;
        case 3:
            [button[2] setNormalImage:[CCSprite spriteWithFile:l_M]];
            [button[2] setSelectedImage:[CCSprite spriteWithFile:l_M]];
            button[2].tag = tempTag;
            button[2].isEnabled=YES;
            [self sendGenerateButton:2 :tempTag];
            break;
        case 4:
            [button[3] setNormalImage:[CCSprite spriteWithFile:l_M]];
            [button[3] setSelectedImage:[CCSprite spriteWithFile:l_M]];
            button[3].tag = tempTag;
            button[3].isEnabled=YES;
            [self sendGenerateButton:3 :tempTag];
            break;
        case 5:
            [button[4] setNormalImage:[CCSprite spriteWithFile:l_M]];
            [button[4] setSelectedImage:[CCSprite spriteWithFile:l_M]];
            button[4].tag = tempTag;
            button[4].isEnabled=YES;
            [self sendGenerateButton:4 :tempTag];
            break;
        case 6:
            [button[5] setNormalImage:[CCSprite spriteWithFile:l_M]];
            [button[5] setSelectedImage:[CCSprite spriteWithFile:l_M]];
            button[5].tag = tempTag;
            button[5].isEnabled=YES;
            [self sendGenerateButton:5 :tempTag];
            break;
        case 7:
            [button[6] setNormalImage:[CCSprite spriteWithFile:l_M]];
            [button[6] setSelectedImage:[CCSprite spriteWithFile:l_M]];
            button[6].tag = tempTag;
            button[6].isEnabled=YES;
            [self sendGenerateButton:6 :tempTag];
            break;
        case 8:
            [button[7] setNormalImage:[CCSprite spriteWithFile:l_M]];
            [button[7] setSelectedImage:[CCSprite spriteWithFile:l_M]];
            button[7].tag = tempTag;
            button[7].isEnabled=YES;
            [self sendGenerateButton:7 :tempTag];
            break;
        case 9:
            [button[8] setNormalImage:[CCSprite spriteWithFile:l_M]];
            [button[8] setSelectedImage:[CCSprite spriteWithFile:l_M]];
            button[8].tag = tempTag;
            button[8].isEnabled=YES;
            [self sendGenerateButton:8 :tempTag];
            break;
        default: break;
    }
    
}

//generating a letter to show on the button
- (void)getLetter{
    tempTag = (rand()%26) + 65;
    char c = (char)tempTag;
    l_M = [NSString stringWithFormat:@"%c"@".png" , c];
}


////////////////////////////////////////////////////////
//**************  start the game  ************************
-(void)start: (id)sender{
    //[self sendStartButton];
    [self getWords];
    //self.word1.text = @"Edwarda";
    [self parseWord: [word1 string] dictionary:word1Dict];
    [self sendWord1:[word_1 UTF8String]];
    [self parseWord: [word2 string] dictionary:word2Dict];
    [self sendWord2:[word_2 UTF8String]];
    [self parseWord: [word3 string] dictionary:word3Dict];
    [self sendWord3:[word_3 UTF8String]];
    
    [self.aTimer invalidate];
    [self.timer invalidate];
    self.timer = nil;
    self.aTimer = nil;
    
    currMinute = STARTING_MINUTES_M;
    currSeconds = STARTING_SECONDS_M;
    
    clock.color = ccBLACK;
    [clock setString: STARTING_TIME_M];
    //self.clock.backgroundColor=[UIColor clearColor];
    
    STOP_M = false;
    
    //stage timer
    self.timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerFired) userInfo:nil repeats:YES];
    
    
    //button appear timer
    self.aTimer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(onTick) userInfo:nil repeats:YES];
    
    [startButton setNormalImage:[CCSprite spriteWithFile:@"transparent.png"]];
    [startButton setNormalImage:[CCSprite spriteWithFile:@"transparent.png"]];
    startButton.isEnabled=NO;
    
    
}

-(void)pressButton0:(id)sender{
    for(int i = 0; i<10; i++){
        if(select[i].tag == 0){
            [button[0] setNormalImage:[CCSprite spriteWithFile:@"transparent.png"]];
            [button[0] setSelectedImage:[CCSprite spriteWithFile:@"transparent.png"]];
            button[0].isEnabled=NO;
            [self sendPressButton:0];
            [select[i] setNormalImage:[CCSprite spriteWithFile:[NSString stringWithFormat:@"%c"@".png", (char)button[0].tag]]];
            [select[i] setSelectedImage:[CCSprite spriteWithFile:[NSString stringWithFormat:@"%c"@".png", (char)button[0].tag]]];
            select[i].tag = button[0].tag;
            break;
        }
    }
}

-(void)pressButton1:(id)sender{
    for(int i = 0; i<10; i++){
        if(select[i].tag == 0){
            [button[1] setNormalImage:[CCSprite spriteWithFile:@"transparent.png"]];
            [button[1] setSelectedImage:[CCSprite spriteWithFile:@"transparent.png"]];
            button[1].isEnabled=NO;
            [self sendPressButton:1];
            [select[i] setNormalImage:[CCSprite spriteWithFile:[NSString stringWithFormat:@"%c"@".png", (char)button[1].tag]]];
            [select[i] setSelectedImage:[CCSprite spriteWithFile:[NSString stringWithFormat:@"%c"@".png", (char)button[1].tag]]];
            select[i].tag = button[1].tag;
            break;
        }
    }
}

-(void)pressButton2:(id)sender{
    for(int i = 0; i<10; i++){
        if(select[i].tag == 0){
            [button[2] setNormalImage:[CCSprite spriteWithFile:@"transparent.png"]];
            [button[2] setSelectedImage:[CCSprite spriteWithFile:@"transparent.png"]];
            button[2].isEnabled=NO;
            [self sendPressButton:2];
            [select[i] setNormalImage:[CCSprite spriteWithFile:[NSString stringWithFormat:@"%c"@".png", (char)button[2].tag]]];
            [select[i] setSelectedImage:[CCSprite spriteWithFile:[NSString stringWithFormat:@"%c"@".png", (char)button[2].tag]]];
            select[i].tag = button[2].tag;
            break;
        }
    }
}

-(void)pressButton3:(id)sender{
    for(int i = 0; i<10; i++){
        if(select[i].tag == 0){
            [button[3] setNormalImage:[CCSprite spriteWithFile:@"transparent.png"]];
            [button[3] setSelectedImage:[CCSprite spriteWithFile:@"transparent.png"]];
            button[3].isEnabled=NO;
            [self sendPressButton:3];
            [select[i] setNormalImage:[CCSprite spriteWithFile:[NSString stringWithFormat:@"%c"@".png", (char)button[3].tag]]];
            [select[i] setSelectedImage:[CCSprite spriteWithFile:[NSString stringWithFormat:@"%c"@".png", (char)button[3].tag]]];
            select[i].tag = button[3].tag;
            break;
        }
    }
}

-(void)pressButton4:(id)sender{
    for(int i = 0; i<10; i++){
        if(select[i].tag == 0){
            [button[4] setNormalImage:[CCSprite spriteWithFile:@"transparent.png"]];
            [button[4] setSelectedImage:[CCSprite spriteWithFile:@"transparent.png"]];
            button[4].isEnabled=NO;
            [self sendPressButton:4];
            [select[i] setNormalImage:[CCSprite spriteWithFile:[NSString stringWithFormat:@"%c"@".png", (char)button[4].tag]]];
            [select[i] setSelectedImage:[CCSprite spriteWithFile:[NSString stringWithFormat:@"%c"@".png", (char)button[4].tag]]];
            select[i].tag = button[4].tag;
            break;
        }
    }
}

-(void)pressButton5:(id)sender{
    for(int i = 0; i<10; i++){
        if(select[i].tag == 0){
            [button[5] setNormalImage:[CCSprite spriteWithFile:@"transparent.png"]];
            [button[5] setSelectedImage:[CCSprite spriteWithFile:@"transparent.png"]];
            button[5].isEnabled=NO;
            [self sendPressButton:5];
            [select[i] setNormalImage:[CCSprite spriteWithFile:[NSString stringWithFormat:@"%c"@".png", (char)button[5].tag]]];
            [select[i] setSelectedImage:[CCSprite spriteWithFile:[NSString stringWithFormat:@"%c"@".png", (char)button[5].tag]]];
            select[i].tag = button[5].tag;
            break;
        }
    }
}

-(void)pressButton6:(id)sender{
    for(int i = 0; i<10; i++){
        if(select[i].tag == 0){
            [button[6] setNormalImage:[CCSprite spriteWithFile:@"transparent.png"]];
            [button[6] setSelectedImage:[CCSprite spriteWithFile:@"transparent.png"]];
            button[6].isEnabled=NO;
            [self sendPressButton:6];
            [select[i] setNormalImage:[CCSprite spriteWithFile:[NSString stringWithFormat:@"%c"@".png", (char)button[6].tag]]];
            [select[i] setSelectedImage:[CCSprite spriteWithFile:[NSString stringWithFormat:@"%c"@".png", (char)button[6].tag]]];
            select[i].tag = button[6].tag;
            break;
        }
    }
}

-(void)pressButton7:(id)sender{
    for(int i = 0; i<10; i++){
        if(select[i].tag == 0){
            [button[7] setNormalImage:[CCSprite spriteWithFile:@"transparent.png"]];
            [button[7] setSelectedImage:[CCSprite spriteWithFile:@"transparent.png"]];
            button[7].isEnabled=NO;
            [self sendPressButton:7];
            [select[i] setNormalImage:[CCSprite spriteWithFile:[NSString stringWithFormat:@"%c"@".png", (char)button[7].tag]]];
            [select[i] setSelectedImage:[CCSprite spriteWithFile:[NSString stringWithFormat:@"%c"@".png", (char)button[7].tag]]];
            select[i].tag = button[7].tag;
            break;
        }
    }
}

-(void)pressButton8:(id)sender{
    for(int i = 0; i<10; i++){
        if(select[i].tag == 0){
            [button[8] setNormalImage:[CCSprite spriteWithFile:@"transparent.png"]];
            [button[8] setSelectedImage:[CCSprite spriteWithFile:@"transparent.png"]];
            button[8].isEnabled=NO;
            [self sendPressButton:8];
            [select[i] setNormalImage:[CCSprite spriteWithFile:[NSString stringWithFormat:@"%c"@".png", (char)button[8].tag]]];
            [select[i] setSelectedImage:[CCSprite spriteWithFile:[NSString stringWithFormat:@"%c"@".png", (char)button[8].tag]]];
            select[i].tag = button[8].tag;
            break;
        }
    }
}

-(void)unSelect0: (id)sender{
    [select[0] setNormalImage:[CCSprite spriteWithFile:@"transparent.png"]];
    [select[0] setSelectedImage:[CCSprite spriteWithFile:@"transparent.png"]];
    select[0].tag = 0;
}

-(void)unSelect1: (id)sender{
    [select[1] setNormalImage:[CCSprite spriteWithFile:@"transparent.png"]];
    [select[1] setSelectedImage:[CCSprite spriteWithFile:@"transparent.png"]];
    select[1].tag = 0;
}

-(void)unSelect2: (id)sender{
    [select[2] setNormalImage:[CCSprite spriteWithFile:@"transparent.png"]];
    [select[2] setSelectedImage:[CCSprite spriteWithFile:@"transparent.png"]];
    select[2].tag = 0;
}

-(void)unSelect3: (id)sender{
    [select[3] setNormalImage:[CCSprite spriteWithFile:@"transparent.png"]];
    [select[3] setSelectedImage:[CCSprite spriteWithFile:@"transparent.png"]];
    select[3].tag = 0;
}

-(void)unSelect4: (id)sender{
    [select[4] setNormalImage:[CCSprite spriteWithFile:@"transparent.png"]];
    [select[4] setSelectedImage:[CCSprite spriteWithFile:@"transparent.png"]];
    select[4].tag = 0;
}

-(void)unSelect5: (id)sender{
    [select[5] setNormalImage:[CCSprite spriteWithFile:@"transparent.png"]];
    [select[5] setSelectedImage:[CCSprite spriteWithFile:@"transparent.png"]];
    select[5].tag = 0;
}

-(void)unSelect6: (id)sender{
    [select[6] setNormalImage:[CCSprite spriteWithFile:@"transparent.png"]];
    [select[6] setSelectedImage:[CCSprite spriteWithFile:@"transparent.png"]];
    select[6].tag = 0;
}

-(void)unSelect7: (id)sender{
    [select[7] setNormalImage:[CCSprite spriteWithFile:@"transparent.png"]];
    [select[7] setSelectedImage:[CCSprite spriteWithFile:@"transparent.png"]];
    select[7].tag = 0;
}

-(void)unSelect8: (id)sender{
    [select[8] setNormalImage:[CCSprite spriteWithFile:@"transparent.png"]];
    [select[8] setSelectedImage:[CCSprite spriteWithFile:@"transparent.png"]];
    select[8].tag = 0;
}

-(void)unSelect9: (id)sender{
    [select[9] setNormalImage:[CCSprite spriteWithFile:@"transparent.png"]];
    [select[9] setSelectedImage:[CCSprite spriteWithFile:@"transparent.png"]];
    select[9].tag = 0;
}

-(id)init{
    if((self=[super init])){
        my_score = 0;
        opponent_score = 0;
        srand ( time(NULL) );//clear out random numbers
        
        self.strArray = [NSArray arrayWithObjects:@"HELLO",@"WORLD",@"EDWARD",@"BING",@"WENHAO",@"DENNY",nil];
        
        //word1Dict= [NSMutableDictionary dictionary];
        word1Dict= [[NSMutableDictionary alloc] init];
        word2Dict= [[NSMutableDictionary alloc] init];
        word3Dict= [[NSMutableDictionary alloc] init];
        
        lettersDict= [[NSMutableDictionary alloc] init];
        
        bg = [CCSprite spriteWithFile:@"background.png"];
        [bg setPosition:ccp(160, 240)];
        [self addChild:bg z:0];
        //[self addChild:[CCMenuLayer node] z:1];
        
        [back setNormalImage:[CCSprite spriteWithFile:@"transparent.png"]];
        [back setSelectedImage:[CCSprite spriteWithFile:@"transparent.png"]];
        back.isEnabled=NO;
        
        ////////////////////////add 9 buttons and selected letters
        CCMenu *starMenu;
        button[0] = [CCMenuItemImage itemWithNormalImage:@"transparent.png" selectedImage:@"transparent.png" target:self selector:@selector(pressButton0:)];
        [button[0] setScale:0.7];
        button[0].tag = 0;
        button[0].isEnabled=NO;
        starMenu = [CCMenu menuWithItems:button[0], nil];
        starMenu.position = CGPointZero;
        [starMenu setPosition:ccp(50,150)];
        [self addChild:starMenu z:1];
        
        button[1] = [CCMenuItemImage itemWithNormalImage:@"transparent.png" selectedImage:@"transparent.png" target:self selector:@selector(pressButton1:)];
        [button[1] setScale:0.7];
        button[1].isEnabled=NO;
        starMenu = [CCMenu menuWithItems:button[1], nil];
        starMenu.position = CGPointZero;
        [starMenu setPosition:ccp(150,150)];
        [self addChild:starMenu z:1];
        
        button[2] = [CCMenuItemImage itemWithNormalImage:@"transparent.png" selectedImage:@"transparent.png" target:self selector:@selector(pressButton2:)];
        [button[2] setScale:0.7];
        button[2].isEnabled=NO;
        starMenu = [CCMenu menuWithItems:button[2], nil];
        starMenu.position = CGPointZero;
        [starMenu setPosition:ccp(250,150)];
        [self addChild:starMenu z:1];
        
        button[3] = [CCMenuItemImage itemWithNormalImage:@"transparent.png" selectedImage:@"transparent.png" target:self selector:@selector(pressButton3:)];
        [button[3] setScale:0.7];
        button[3].isEnabled=NO;
        starMenu = [CCMenu menuWithItems:button[3], nil];
        starMenu.position = CGPointZero;
        [starMenu setPosition:ccp(50,250)];
        [self addChild:starMenu z:1];
        
        button[4] = [CCMenuItemImage itemWithNormalImage:@"transparent.png" selectedImage:@"transparent.png" target:self selector:@selector(pressButton4:)];
        [button[4] setScale:0.7];
        button[4].isEnabled=NO;
        starMenu = [CCMenu menuWithItems:button[4], nil];
        starMenu.position = CGPointZero;
        [starMenu setPosition:ccp(150,250)];
        [self addChild:starMenu z:1];
        
        button[5] = [CCMenuItemImage itemWithNormalImage:@"transparent.png" selectedImage:@"transparent.png" target:self selector:@selector(pressButton5:)];
        [button[5] setScale:0.7];
        button[5].isEnabled=NO;
        starMenu = [CCMenu menuWithItems:button[5], nil];
        starMenu.position = CGPointZero;
        [starMenu setPosition:ccp(250,250)];
        [self addChild:starMenu z:1];
        
        button[6] = [CCMenuItemImage itemWithNormalImage:@"transparent.png" selectedImage:@"transparent.png" target:self selector:@selector(pressButton6:)];
        [button[6] setScale:0.7];
        button[6].isEnabled=NO;
        starMenu = [CCMenu menuWithItems:button[6], nil];
        starMenu.position = CGPointZero;
        [starMenu setPosition:ccp(50,350)];
        [self addChild:starMenu z:1];
        
        button[7] = [CCMenuItemImage itemWithNormalImage:@"transparent.png" selectedImage:@"transparent.png" target:self selector:@selector(pressButton7:)];
        [button[7] setScale:0.7];
        button[7].isEnabled=NO;
        starMenu = [CCMenu menuWithItems:button[7], nil];
        starMenu.position = CGPointZero;
        [starMenu setPosition:ccp(150,350)];
        [self addChild:starMenu z:1];
        
        button[8] = [CCMenuItemImage itemWithNormalImage:@"transparent.png" selectedImage:@"transparent.png" target:self selector:@selector(pressButton8:)];
        [button[8] setScale:0.7];
        button[8].isEnabled=NO;
        starMenu = [CCMenu menuWithItems:button[8], nil];
        starMenu.position = CGPointZero;
        [starMenu setPosition:ccp(250,350)];
        [self addChild:starMenu z:1];
        
        /////////////////////////
        select[0] = [CCMenuItemImage itemWithNormalImage:@"transparent.png" selectedImage:@"transparent.png" target:self selector:@selector(unSelect0:)];
        [select[0] setScale:0.4];
        starMenu = [CCMenu menuWithItems:select[0], nil];
        select[0].tag = 0;
        starMenu.position = CGPointZero;
        //[self addChild:starMenu];
        [starMenu setPosition:ccp(20,50)];
        [self addChild:starMenu z:1];
        
        select[1] = [CCMenuItemImage itemWithNormalImage:@"transparent.png" selectedImage:@"transparent.png" target:self selector:@selector(unSelect1:)];
        [select[1] setScale:0.4];
        starMenu = [CCMenu menuWithItems:select[1], nil];
        select[1].tag = 0;
        starMenu.position = CGPointZero;
        //[self addChild:starMenu];
        [starMenu setPosition:ccp(50,50)];
        [self addChild:starMenu z:1];
        
        select[2] = [CCMenuItemImage itemWithNormalImage:@"transparent.png" selectedImage:@"transparent.png" target:self selector:@selector(unSelect2:)];
        [select[2] setScale:0.4];
        starMenu = [CCMenu menuWithItems:select[2], nil];
        select[2].tag = 0;
        starMenu.position = CGPointZero;
        //[self addChild:starMenu];
        [starMenu setPosition:ccp(85,50)];
        [self addChild:starMenu z:1];
        
        select[3] = [CCMenuItemImage itemWithNormalImage:@"transparent.png" selectedImage:@"transparent.png" target:self selector:@selector(unSelect3:)];
        [select[3] setScale:0.4];
        starMenu = [CCMenu menuWithItems:select[3], nil];
        select[3].tag = 0;
        starMenu.position = CGPointZero;
        //[self addChild:starMenu];
        [starMenu setPosition:ccp(120,50)];
        [self addChild:starMenu z:1];
        
        select[4] = [CCMenuItemImage itemWithNormalImage:@"transparent.png" selectedImage:@"transparent.png" target:self selector:@selector(unSelect4:)];
        [select[4] setScale:0.4];
        starMenu = [CCMenu menuWithItems:select[4], nil];
        select[4].tag = 0;
        starMenu.position = CGPointZero;
        //[self addChild:starMenu];
        [starMenu setPosition:ccp(155,50)];
        [self addChild:starMenu z:1];
        
        select[5] = [CCMenuItemImage itemWithNormalImage:@"transparent.png" selectedImage:@"transparent.png" target:self selector:@selector(unSelect5:)];
        [select[5] setScale:0.4];
        starMenu = [CCMenu menuWithItems:select[5], nil];
        select[5].tag = 0;
        starMenu.position = CGPointZero;
        //[self addChild:starMenu];
        [starMenu setPosition:ccp(190,50)];
        [self addChild:starMenu z:1];
        
        select[6] = [CCMenuItemImage itemWithNormalImage:@"transparent.png" selectedImage:@"transparent.png" target:self selector:@selector(unSelect6:)];
        [select[6] setScale:0.4];
        starMenu = [CCMenu menuWithItems:select[6], nil];
        select[6].tag = 0;
        starMenu.position = CGPointZero;
        //[self addChild:starMenu];
        [starMenu setPosition:ccp(225,50)];
        [self addChild:starMenu z:1];
        
        select[7] = [CCMenuItemImage itemWithNormalImage:@"transparent.png" selectedImage:@"transparent.png" target:self selector:@selector(unSelect7:)];
        [select[7] setScale:0.4];
        starMenu = [CCMenu menuWithItems:select[7], nil];
        select[7].tag = 0;
        starMenu.position = CGPointZero;
        //[self addChild:starMenu];
        [starMenu setPosition:ccp(260,50)];
        [self addChild:starMenu z:1];
        
        select[8] = [CCMenuItemImage itemWithNormalImage:@"transparent.png" selectedImage:@"transparent.png" target:self selector:@selector(unSelect8:)];
        [select[8] setScale:0.4];
        starMenu = [CCMenu menuWithItems:select[8], nil];
        select[8].tag = 0;
        starMenu.position = CGPointZero;
        //[self addChild:starMenu];
        [starMenu setPosition:ccp(295,50)];
        [self addChild:starMenu z:1];
        
        select[9] = [CCMenuItemImage itemWithNormalImage:@"transparent.png" selectedImage:@"transparent.png" target:self selector:@selector(unSelect9:)];
        [select[9] setScale:0.4];
        starMenu = [CCMenu menuWithItems:select[9], nil];
        select[9].tag = 0;
        starMenu.position = CGPointZero;
        //[self addChild:starMenu];
        [starMenu setPosition:ccp(330,50)];
        [self addChild:starMenu z:1];
        
        ///////////////////////////////////////////////////
        ///////////////////start button
        
        
        ////////////////add clock and given words labels
        clock = [CCLabelTTF labelWithString:@"Time" fontName:@"Arial" fontSize:24];
        clock.position = ccp(250,420);
        clock.color = ccBLACK;
        [self addChild:clock z:1];
        
        word1 = [CCLabelTTF labelWithString:@"Word1:" fontName:@"Arial" fontSize:15];
        word1.position = ccp(50,460);
        word1.color = ccBLACK;
        [self addChild:word1 z:1];
        
        word2 = [CCLabelTTF labelWithString:@"Word2:" fontName:@"Arial" fontSize:15];
        word2.position = ccp(50,430);
        word2.color = ccBLACK;
        [self addChild:word2 z:1];
        
        word3 = [CCLabelTTF labelWithString:@"Word3:" fontName:@"Arial" fontSize:15];
        word3.position = ccp(50,400);
        word3.color = ccBLACK;
        [self addChild:word3 z:1];
        
        AppController * delegate = (AppController *) [UIApplication sharedApplication].delegate;
        [[GCHelper sharedInstance] findMatchWithMinPlayers:2 maxPlayers:2 viewController:delegate.navController delegate:self];
        
        
        ///////////////////
        isPlayer1 = YES;
        
        debugLabel = [CCLabelTTF labelWithString:@"" fontName:@"Arial" fontSize:15];
        debugLabel.position = ccp(200,200);
        debugLabel.color = ccBLACK;
        [self addChild:debugLabel z:1];
        
        ourRandom = arc4random();
        [self setGameState:kGameStateWaitingForStart];
        
    }
    return self;
}


-(void)BackButtonPress:(id)sender{
    CCScene* scene = [CCBReader sceneWithNodeGraphFromFile:@"GameMenu.ccbi"];
    [[CCDirector sharedDirector]replaceScene:[CCTransitionCrossFade transitionWithDuration:0.3 scene:scene]];
}


- (void)setGameState:(GameState)state {
    
    gameState = state;
    if (gameState == kGameStateWaitingForMatch) {
        [debugLabel setString:@"Waiting for match"];
    } else if (gameState == kGameStateWaitingForRandomNumber) {
        [debugLabel setString:@"Waiting for rand #"];
    } else if (gameState == kGameStateWaitingForStart) {
        [debugLabel setString:@"Waiting for start"];
        back = [CCMenuItemImage itemWithNormalImage:@"backarrow.png" selectedImage:@"backarrow.png" target:self selector:@selector(BackButtonPress:)];
        CCMenu* starMenu = [CCMenu menuWithItems:back, nil];
        starMenu.position = CGPointZero;
        [starMenu setPosition:ccp(280,60)];
        [self addChild:starMenu z:1];

    } else if (gameState == kGameStateActive) {
        [debugLabel setString:@""];
        [back setNormalImage:[CCSprite spriteWithFile:@"transparent.png"]];
        [back setSelectedImage:[CCSprite spriteWithFile:@"transparent.png"]];
        back.isEnabled=NO;
    } else if (gameState == kGameStateDone) {
        [debugLabel setString:@"Done"];
    }
    
}

- (void)sendData:(NSData *)data {
    NSError *error;
    BOOL success = [[GCHelper sharedInstance].match sendDataToAllPlayers:data withDataMode:GKMatchSendDataReliable error:&error];
    if (!success) {
        CCLOG(@"Error sending init packet");
        //[self matchEnded];
        [[GCHelper sharedInstance].match disconnect];
        [GCHelper sharedInstance].match = nil;
    }
}

- (void)sendRandomNumber {
    
    MessageRandomNumber message;
    message.message.messageType = kMessageTypeRandomNumber;
    message.randomNumber = ourRandom;
    NSData *data = [NSData dataWithBytes:&message length:sizeof(MessageRandomNumber)];
    [self sendData:data];
}

- (void)sendGameBegin {
    
    MessageGameBegin message;
    message.message.messageType = kMessageTypeGameBegin;
    NSData *data = [NSData dataWithBytes:&message length:sizeof(MessageGameBegin)];
    [self sendData:data];
    
}

- (void)sendPressButton:(int) position{
    
    MessagePressButton message;
    message.buttonPosition = position;
    message.message.messageType = kMessageTypePressButton;
    NSData *data = [NSData dataWithBytes:&message length:sizeof(MessagePressButton)];
    [self sendData:data];
    
}

-(void)sendGenerateButton:(int) position :(int) tag {
    MessageGenerateButton message;
    message.buttonPosition = position;
    message.letterTag = tag;
    message.message.messageType = kMessageTypeGenerateButton;
    NSData *data = [NSData dataWithBytes:&message length:sizeof(MessageGenerateButton)];
    [self sendData:data];
}

-(void)sendHideButton:(int) position{
    MessageHideButton message;
    message.buttonPosition = position;
    message.message.messageType = kMessageTypeHideButton;
    NSData *data = [NSData dataWithBytes:&message length:sizeof(MessageHideButton)];
    [self sendData:data];
}
/*
-(void)sendStartButton{
    MessageStartButton message;
    message.message.messageType = kMessageTypeGameBegin;
    NSData *data = [NSData dataWithBytes:&message length:sizeof(MessageStartButton)];
    [self sendData:data];
}*/

-(void)sendWord1:(const char*) words{
    MessageWord1 message;
    strcpy(message.word,words);
    message.message.messageType = kMessageTypeWord1;
    NSData *data = [NSData dataWithBytes:&message length:sizeof(MessageWord1)];
    [self sendData:data];
}

-(void)sendWord2:(const char*) words{
    MessageWord2 message;
    strcpy(message.word,words);
    message.message.messageType = kMessageTypeWord2;
    NSData *data = [NSData dataWithBytes:&message length:sizeof(MessageWord2)];
    [self sendData:data];}

-(void)sendWord3:(const char*) words{
    MessageWord3 message;
    strcpy(message.word,words);
    message.message.messageType = kMessageTypeWord3;
    NSData *data = [NSData dataWithBytes:&message length:sizeof(MessageWord3)];
    [self sendData:data];
}

-(void)sendTime:(const char*) times{
    MessageTime message;
    strcpy(message.time, times);
    message.message.messageType = kMessageTypeTime;
    NSData *data = [NSData dataWithBytes:&message length:sizeof(MessageTime)];
    [self sendData:data];
}

-(void)sendEndGame {
    MessageEndGame message;
    message.message.messageType = kMessageTypeEndGame;
    NSData *data = [NSData dataWithBytes:&message length:sizeof(MessageEndGame)];
    [self sendData:data];   
}

-(void)sendScore: (int) score {
    MessageScore message;
    message.message.messageType = kMessageTypeScore;
    message.score = score;
    NSData *data = [NSData dataWithBytes:&message length:sizeof(MessageScore)];
    [self sendData:data];
}

- (void)sendGameOver:(BOOL)player1Won {
    
    MessageGameOver message;
    message.message.messageType = kMessageTypeGameOver;
    message.player1Won = player1Won;
    NSData *data = [NSData dataWithBytes:&message length:sizeof(MessageGameOver)];
    [self sendData:data];
    
}


- (void)restartTapped:(id)sender {
    
    // Reload the current scene
    [[GCHelper sharedInstance] authenticateLocalUser];
    CCScene* scene = [CCBReader sceneWithNodeGraphFromFile:@"MultiPlayer.ccbi"];
    [[CCDirector sharedDirector] replaceScene:[CCTransitionZoomFlipX transitionWithDuration:0.5 scene:scene]];
    
}

// Helper code to show a menu to restart the level
// From Cat Nap tutorial



- (void)tryStartGame {
    
    if (isPlayer1 && gameState == kGameStateWaitingForStart) {
        [self setGameState:kGameStateActive];
        [self sendGameBegin];
        [self setupStringsWithOtherPlayerId:otherPlayerID];
    }
    
}


- (void)setupStringsWithOtherPlayerId:(NSString *)playerID {
    
    if (isPlayer1) {
        
        /*player1Label = [CCLabelBMFont labelWithString:[GKLocalPlayer localPlayer].alias fntFile:@"Arial.fnt"];
        [self addChild:player1Label];
        
        GKPlayer *player = [[GCHelper sharedInstance].playersDict objectForKey:playerID];
        player2Label = [CCLabelBMFont labelWithString:player.alias fntFile:@"Arial.fnt"];
        [self addChild:player2Label];*/
        CCLOG(@"ddasd");
        
    } else {
        /*
        player2Label = [CCLabelBMFont labelWithString:[GKLocalPlayer localPlayer].alias fntFile:@"Arial.fnt"];
        [self addChild:player2Label];
        
        GKPlayer *player = [[GCHelper sharedInstance].playersDict objectForKey:playerID];
        player1Label = [CCLabelBMFont labelWithString:player.alias fntFile:@"Arial.fnt"];
        [self addChild:player1Label];*/
        CCLOG(@"dsadas");
        
    }
    
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
    [otherPlayerID release];
    otherPlayerID = nil;
    
	// don't forget to call "super dealloc"
	[super dealloc];
}

#pragma mark GCHelperDelegate

- (void)matchStarted {
    CCLOG(@"Match started");
    if (receivedRandom) {
        [self setGameState:kGameStateWaitingForStart];
    } else {
        [self setGameState:kGameStateWaitingForRandomNumber];
    }
    [self sendRandomNumber];
    [self tryStartGame];
}

- (void)inviteReceived {
    [self restartTapped:nil];
}

- (void)matchEnded {
    CCLOG(@"Match ended");
    //[[GCHelper sharedInstance].match disconnect];
    //[GCHelper sharedInstance].match = nil;
    //[self endScene:kEndReasonDisconnect];
    if(isPlayer1)
        [self hideButtons];
    [self countLetters];
    
    
    my_score = [self getScore:word1Dict];
    my_score += [self getScore:word2Dict];
    my_score += [self getScore:word3Dict];
    [self sendScore:my_score];
    if(isPlayer1)
        [self sendEndGame];
    /*
     for (int i =0; i<MAX_LETTER_ARRAY_M;i++)
     NSLog(@"%@", letter[i]);
     */
    //NSLog(@"%i", score);
    
    word1Dict = nil;
    word2Dict = nil;
    word3Dict = nil;
    lettersDict = nil;
    
    if(my_score < opponent_score)
        scorePageMessage = @"You Lost!";
    else if(my_score > opponent_score)
        scorePageMessage = @"You Win!";
    else
        scorePageMessage = @"Tie";
    
    if(isPlayer1){
        score_p1 = my_score;
        score_p2 = opponent_score;
    }
    else{
        score_p1 = opponent_score;
        score_p2 = my_score;
    }
    
    //[self init];

}

- (void)match:(GKMatch *)match didReceiveData:(NSData *)data fromPlayer:(NSString *)playerID {
    
    // Store away other player ID for later
    if (otherPlayerID == nil) {
        otherPlayerID = [playerID retain];
    }
    
    Message *message = (Message *) [data bytes];
    if (message->messageType == kMessageTypeRandomNumber) {
        
        MessageRandomNumber * messageInit = (MessageRandomNumber *) [data bytes];
        CCLOG(@"Received random number: %ud, ours %ud", messageInit->randomNumber, ourRandom);
        bool tie = false;
        
        if (messageInit->randomNumber == ourRandom) {
            CCLOG(@"TIE!");
            tie = true;
            ourRandom = arc4random();
            [self sendRandomNumber];
        } else if (ourRandom > messageInit->randomNumber) {
            CCLOG(@"We are player 1");
            isPlayer1 = YES;
            if(isPlayer1){
                startButton = [CCMenuItemImage itemWithNormalImage:@"start.png" selectedImage:@"start.png" target:self selector:@selector(start:)];
                [startButton setScale:0.5];
                CCMenu* starMenu = [CCMenu menuWithItems:startButton, nil];
                starMenu.position = CGPointZero;
                [starMenu setPosition:ccp(300,455)];
                [self addChild:starMenu z:1];
            }
        } else {
            CCLOG(@"We are player 2");
            isPlayer1 = NO;
        }
        
        if (!tie) {
            receivedRandom = YES;
            if (gameState == kGameStateWaitingForRandomNumber) {
                [self setGameState:kGameStateWaitingForStart];
            }
            [self tryStartGame];
        }
        
    } else if (message->messageType == kMessageTypeGameBegin) {
        
        [self setGameState:kGameStateActive];
        [self setupStringsWithOtherPlayerId:playerID];
        
    } else if (message->messageType == kMessageTypeGenerateButton) {
        
        MessageGenerateButton * tempMessage = (MessageGenerateButton*) [data bytes];
        //CCLOG(@"Received button information to generate");
        if(!isPlayer1){
            [button[tempMessage->buttonPosition] setNormalImage:[CCSprite spriteWithFile:[NSString stringWithFormat:@"%c"@".png", (char)tempMessage->letterTag]]];
            [button[tempMessage->buttonPosition] setSelectedImage:[CCSprite spriteWithFile:[NSString stringWithFormat:@"%c"@".png", (char)tempMessage->letterTag]]];
            button[tempMessage->buttonPosition].tag = tempMessage->letterTag;
            button[tempMessage->buttonPosition].isEnabled = YES;
        }
    } else if(message->messageType == kMessageTypePressButton) {
        MessagePressButton * tempMessage = (MessagePressButton *) [data bytes];
        //CCLOG(@"Received button information to hide");
        [button[tempMessage->buttonPosition] setNormalImage:[CCSprite spriteWithFile:@"transparent.png"]];
        [button[tempMessage->buttonPosition] setSelectedImage:[CCSprite spriteWithFile:@"transparent.png"]];
        button[tempMessage->buttonPosition].isEnabled = NO;
        
    } else if(message->messageType == kMessageTypeHideButton) {
        MessageHideButton * tempMessage = (MessageHideButton *) [data bytes];
        //CCLOG(@"Hide button information");
        [button[tempMessage->buttonPosition] setNormalImage:[CCSprite spriteWithFile:@"transparent.png"]];
        [button[tempMessage->buttonPosition] setSelectedImage:[CCSprite spriteWithFile:@"transparent.png"]];
        button[tempMessage->buttonPosition].isEnabled = NO;
    }
    
    else if(message->messageType == kMessageTypeWord1){
        //NSLog(@"sdasdddddda111");
        MessageWord1 * tempMessage = (MessageWord1*) [data bytes];
        NSString* tempString = [NSString stringWithUTF8String:tempMessage->word];
        [word1 setString: tempString];
        [self parseWord: tempString dictionary:word1Dict];

    }
    
    else if(message->messageType == kMessageTypeWord2){
        MessageWord2 * tempMessage = (MessageWord2*) [data bytes];
        NSString* tempString = [NSString stringWithUTF8String:tempMessage->word];
        [word2 setString: tempString];
        [self parseWord: tempString dictionary:word2Dict];

    }
    
    else if(message->messageType == kMessageTypeWord3){
        MessageWord3 * tempMessage = (MessageWord3*) [data bytes];
        NSString* tempString = [NSString stringWithUTF8String:tempMessage->word];
        [word3 setString: tempString];
        [self parseWord: tempString dictionary:word3Dict];

    }
    
    else if(message->messageType == kMessageTypeTime){
        MessageTime * tempMessage = (MessageTime*) [data bytes];
        NSString* tempString = [NSString stringWithUTF8String:tempMessage->time];
        [clock setString: tempString];
    }
    else if(message->messageType == kMessageTypeEndGame){
        //MessageEndGame * tempMessage = (MessageEndGame*) [data bytes];
        [self matchEnded];
    }
    
    else if(message->messageType == kMessageTypeScore) {
        MessageScore* tempMessage = (MessageScore*) [data bytes];
        opponent_score = tempMessage->score;
        CCScene* scene = [CCBReader sceneWithNodeGraphFromFile:@"Score.ccbi"];
        [[CCDirector sharedDirector]replaceScene:[CCTransitionCrossFade transitionWithDuration:0.3 scene:scene]];
    }

}



@end
