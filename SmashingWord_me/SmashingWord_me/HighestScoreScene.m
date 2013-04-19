//
//  HighestScoreScene.m
//  SmashingWord_me
//
//  Created by Edward on 4/18/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "HighestScoreScene.h"
#import "CCBReader.h"

@implementation HighestScoreScene

-(id)init{
    if((self=[super init])){
        bg = [CCSprite spriteWithFile:@"background1.png"];
        [bg setPosition:ccp(160, 240)];
        [self addChild:bg z:0];
        
        single = [CCLabelTTF labelWithString: @"Single Top 10" fontName:@"Arial" fontSize:15];
        single.position = ccp(70,430);
        single.color = ccBLACK;
        [self addChild:single z:1];
        
        multi = [CCLabelTTF labelWithString: @"Multi Top 10" fontName:@"Arial" fontSize:15];
        multi.position = ccp(210,430);
        multi.color = ccBLACK;
        [self addChild:multi z:1];
        
        for(int i=0; i<10; i++){
            singleTopTen[i] = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%i", i+1] fontName:@"Arial" fontSize:15];
            singleTopTen[i].position = ccp(30,400-i*30);
            singleTopTen[i].color = ccBLACK;
            [self addChild:singleTopTen[i] z:1];
            
            multiTopTen[i] = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%i", i+1] fontName:@"Arial" fontSize:15];
            multiTopTen[i].position = ccp(180,400-i*30);
            multiTopTen[i].color = ccBLACK;
            [self addChild:multiTopTen[i] z:1];
            
        }
        
    }
    return self;
}

-(void)BackButtonPress:(id)sender{
    CCScene* scene = [CCBReader sceneWithNodeGraphFromFile:@"GameMenu.ccbi"];
    [[CCDirector sharedDirector]replaceScene:[CCTransitionCrossFade transitionWithDuration:0.3 scene:scene]];
}
@end
