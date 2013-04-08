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
        bg = [CCSprite spriteWithFile:@"background.png"];
        [bg setPosition:ccp(160, 240)];
        [self addChild:bg z:0];
        
        finalScore = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Your Score Is \n "@"%i"@".", score] fontName:@"Arial" fontSize:24];
        finalScore.position = ccp(100,365);
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
