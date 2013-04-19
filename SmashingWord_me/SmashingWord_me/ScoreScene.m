//
//  ScoreScene.m
//  SmashingWord_me
//
//  Created by Edward on 4/3/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "ScoreScene.h"
#import "CCBReader.h"
@implementation ScoreScene
-(id)init{
    if((self=[super init])){
        NSInteger tempMyScore;
        NSInteger tempOppScore;
        bg = [CCSprite spriteWithFile:@"background.png"];
        [bg setPosition:ccp(160, 240)];
        [self addChild:bg z:0];
        
        if(!isSinglePlayer){
            if(isPlayer1){
                tempMyScore = score_p1;
                tempOppScore = score_p2;
            }
            else{
                tempMyScore = score_p2;
                tempOppScore = score_p1;
            }
            finalScore = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Your Score Is %i.\nYour Opponent Score Is %i.\n""%@", tempMyScore, tempOppScore, scorePageMessage]fontName:@"Arial" fontSize:24];
        }
        else{
            finalScore = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Your Score Is %i.", score]fontName:@"Arial" fontSize:24];
        }
<<<<<<< HEAD
        NSString *score_message = [NSString stringWithFormat:@"Your Score Is %i.\nYour Opponent Score Is %i.\n""%@", tempMyScore, tempOppScore, scorePageMessage];
        if (score_p2 == -1) {
            score_message = [NSString stringWithFormat:@"Your Score is %i!", score_p1];
        }
        finalScore = [CCLabelTTF labelWithString:score_message fontName:@"Arial" fontSize:24];
        finalScore.position = ccp(100,365);
=======
        finalScore.position = ccp(150,365);
>>>>>>> added highest score page
        finalScore.color = ccBLACK;
        [self addChild:finalScore z:1];
        
    }
    return self;
}
-(void)BackButtonPress:(id)sender{
    CCScene* scene = [CCBReader sceneWithNodeGraphFromFile:@"GameMenu.ccbi"];
    [[CCDirector sharedDirector]replaceScene:[CCTransitionCrossFade transitionWithDuration:0.3 scene:scene]];
}

@end
