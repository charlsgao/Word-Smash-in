//
//  globalVar.m
//  SmashingWord_me
//
//  Created by Edward on 4/7/13.
//
//

#import "globalVar.h"

@implementation globalVar
NSInteger score = 0;
NSInteger score_p1 = 0;
NSInteger score_p2 = 0;
NSInteger penalty_score = 0;
NSString* scorePageMessage = @"";
double BUTTON_APPEAR_DURATION = 0;
BOOL isPlayer1 = YES;

BOOL TEST_MODE = NO;

//shop features
int money =99999;
int extraTimeCounter =0;
int freezeTimeCounter =0;
int slowdownTimeCounter =0;

int cloudCounter =0;
int increaseCounter =0;

@end
