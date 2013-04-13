//
//  MultiPlayerScene.h
//  SmashingWord_me
//
//  Created by Edward on 4/8/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
//#import "globalVar.h"
#import "GCHelper.h"


typedef enum {
    kMessageTypeRandomNumber = 0,
    kMessageTypeGameBegin,
    kMessageTypePressButton,
    kMessageTypeGenerateButton,
    kMessageTypeGameOver
} MessageType;

typedef struct {
    MessageType messageType;
} Message;

typedef struct {
    Message message;
    uint32_t randomNumber;
} MessageRandomNumber;

typedef struct {
    Message message;
} MessageGameBegin;

typedef struct {
    Message message;
    int buttonPosition;
} MessagePressButton;

typedef struct {
    Message message;
    int buttonPosition;
    int letterTag;
}MessageGenerateButton;

typedef struct {
    Message message;
    BOOL player1Won;
} MessageGameOver;

typedef enum {
    kEndReasonWin,
    kEndReasonLose,
    kEndReasonDisconnect
} EndReason;

typedef enum {
    kGameStateWaitingForMatch = 0,
    kGameStateWaitingForRandomNumber,
    kGameStateWaitingForStart,
    kGameStateActive,
    kGameStateDone
} GameState;

//score=0;
NSString *word_1;
NSString *word_2;
NSString *word_3;

NSInteger score_1;
NSInteger score_2;
NSInteger score_3;

/*
// HelloWorldLayer
@interface HelloWorldLayer : CCLayer <GCHelperDelegate>
{
    CCSpriteBatchNode *batchNode;
    CCSprite *cat;
    PlayerSprite *player1;
    PlayerSprite *player2;
    BOOL isPlayer1;
    CCLabelBMFont *debugLabel;
    GameState gameState;
    
    uint32_t ourRandom;
    BOOL receivedRandom;
    NSString *otherPlayerID;
    
    CCLabelBMFont *player1Label;
    CCLabelBMFont *player2Label;
    
}*/


@interface MultiPlayerScene : CCLayer <GCHelperDelegate>{ 
    CCMenuItemImage* startButton;
    CCMenuItemImage* button[9];
    CCMenuItemImage* select[10];
    CCLabelTTF* clock;
    CCLabelTTF* word1;
    CCLabelTTF* word2;
    CCLabelTTF* word3;
    CCSprite* bg;
    
    BOOL isPlayer1;
    GameState gameState;
    CCLabelTTF *debugLabel;
    uint32_t ourRandom;
    BOOL receivedRandom;
    NSString *otherPlayerID;
    
    CCLabelBMFont *player1Label;
    CCLabelBMFont *player2Label;
    
    NSInteger score_m[2];
}

@property (strong, nonatomic) NSTimer *aTimer;              //stage timer
@property (strong, nonatomic) NSTimer *timer;               //button appear duration timer
//@property double BUTTON_APPEAR_DURATION;
@property (strong, nonatomic) NSArray *strArray;
@end

