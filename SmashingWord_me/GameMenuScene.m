//
//  GameMenuScene.m
//  SmashingWord_me
//
//  Created by Edward on 3/19/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "GameMenuScene.h"
#import "CCBReader.h"

@implementation GameMenuScene
-(void)HowToPlayButtonPress: (id)sender{
    CCScene* scene =  [CCBReader sceneWithNodeGraphFromFile:@"HowToPlay.ccbi"];
    [[CCDirector sharedDirector]replaceScene:[CCTransitionCrossFade transitionWithDuration:0.3 scene:scene]];
}

-(void)SinglePlayerButtonPress: (id)sender{
    CCScene* scene = [CCBReader sceneWithNodeGraphFromFile:@"LevelSelect.ccbi"];
    [[CCDirector sharedDirector]replaceScene:[CCTransitionCrossFade transitionWithDuration:0.3 scene:scene]];
}
@end
