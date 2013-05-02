//
//  GHUnitCocos2dBase_Multiplayer.m
//  SmashingWord_me
//
//  Created by Denny Winoto on 5/1/13.
//
//

#import "GHUnitCocos2dBase_Multiplayer.h"

@implementation GHUnitCocos2dBase_Multiplayer

- (BOOL) shouldRunOnMainThread
{
    // By default NO, but if you have a UI test or test dependent on running on the main thread return YES
    return YES;
}

- (void) setUpClass
{
    
	CC_DIRECTOR_INIT();
    
    //spc = [[SinglePlayerScene alloc] init];
    mpc = [[MultiPlayerScene alloc] init];
    
}

- (void) tearDownClass
{
	CC_DIRECTOR_END();
	// You have to do this or the test window will not get the focus back
	[window_ release];
}

- (void)testStrings {
    NSString *string1 = @"a string";
    GHTestLog(@"I can log to the GHUnit test console: %@", string1);
    
    // Assert string1 is not NULL, with no custom error description
    GHAssertNotNil(string1, nil);
    
    // Assert equal objects, add custom error description
    NSString *string2 = @"a string";
    GHAssertEqualObjects(string1, string2, @"A custom error message. string1 should be equal to: %@.", string2);
}


 - (void) testMulti_GetWords
 {
 [mpc getWords];
 GHAssertNotNil([mpc getWord1], @"Word1 should not be nil");
 }
 
 
 - (void) testMulti_RandomWords
 {
 [mpc getWords];
 GHAssertNotNil(word_1, @"Word1 should not be nil");
 GHAssertNotNil(word_2, @"Word2 should not be nil");
 GHAssertNotNil(word_3, @"Word3 should not be nil");
 
 }
 
 - (void) testMulti_Button0
 {
 //Initialize the buttons and select lists
 [mpc hideButtons];
 [mpc resetSelectArray];
 [[mpc getButton0] setNormalImage:[CCSprite spriteWithFile:@"A.png"]];
 [[mpc getButton0] setSelectedImage:[CCSprite spriteWithFile:@"A.png"]];
 [mpc getButton0].tag = 65;
 [mpc getButton0].isEnabled=YES;
 [mpc pressButton0:self];
 GHAssertEquals([mpc getButton0].tag, [mpc getSelect0].tag, @"button 0 and select 0 should have same tag values");
 
 }
 
 - (void) testMulti_Button1
 {
 //Initialize the buttons and select lists
 [mpc hideButtons];
 [mpc resetSelectArray];
 [[mpc getButton1] setNormalImage:[CCSprite spriteWithFile:@"B.png"]];
 [[mpc getButton1] setSelectedImage:[CCSprite spriteWithFile:@"B.png"]];
 [mpc getButton1].tag = 66;
 [mpc getButton1].isEnabled=YES;
 
 //Assume select[0] is occupied
 [mpc getSelect0].tag = 1;
 [mpc pressButton1:self];
 GHAssertEquals([mpc getButton1].tag, [mpc getSelect1].tag, @"button 0 and select 0 should have same tag values");
 
 }
 
 - (void) testMulti_Button0To8
 {
 //Initialize the buttons and select lists
 [mpc hideButtons];
 [mpc resetSelectArray];
 [[mpc getButton0] setNormalImage:[CCSprite spriteWithFile:@"A.png"]];
 [[mpc getButton0] setSelectedImage:[CCSprite spriteWithFile:@"A.png"]];
 [mpc getButton0].tag = 65;
 [mpc getButton0].isEnabled=YES;
 
 [[mpc getButton1] setNormalImage:[CCSprite spriteWithFile:@"B.png"]];
 [[mpc getButton1] setSelectedImage:[CCSprite spriteWithFile:@"B.png"]];
 [mpc getButton1].tag = 66;
 [mpc getButton1].isEnabled=YES;
 
 [[mpc getButton2] setNormalImage:[CCSprite spriteWithFile:@"C.png"]];
 [[mpc getButton2] setSelectedImage:[CCSprite spriteWithFile:@"C.png"]];
 [mpc getButton2].tag = 67;
 [mpc getButton2].isEnabled=YES;
 
 [[mpc getButton3] setNormalImage:[CCSprite spriteWithFile:@"D.png"]];
 [[mpc getButton3] setSelectedImage:[CCSprite spriteWithFile:@"D.png"]];
 [mpc getButton3].tag = 68;
 [mpc getButton3].isEnabled=YES;
 
 [[mpc getButton4] setNormalImage:[CCSprite spriteWithFile:@"E.png"]];
 [[mpc getButton4] setSelectedImage:[CCSprite spriteWithFile:@"E.png"]];
 [mpc getButton4].tag = 69;
 [mpc getButton4].isEnabled=YES;
 
 [[mpc getButton5] setNormalImage:[CCSprite spriteWithFile:@"F.png"]];
 [[mpc getButton5] setSelectedImage:[CCSprite spriteWithFile:@"F.png"]];
 [mpc getButton5].tag = 70;
 [mpc getButton5].isEnabled=YES;
 
 [[mpc getButton6] setNormalImage:[CCSprite spriteWithFile:@"G.png"]];
 [[mpc getButton6] setSelectedImage:[CCSprite spriteWithFile:@"G.png"]];
 [mpc getButton6].tag = 71;
 [mpc getButton6].isEnabled=YES;
 
 [[mpc getButton7] setNormalImage:[CCSprite spriteWithFile:@"H.png"]];
 [[mpc getButton7] setSelectedImage:[CCSprite spriteWithFile:@"H.png"]];
 [mpc getButton7].tag = 72;
 [mpc getButton7].isEnabled=YES;
 
 [[mpc getButton8] setNormalImage:[CCSprite spriteWithFile:@"I.png"]];
 [[mpc getButton8] setSelectedImage:[CCSprite spriteWithFile:@"I.png"]];
 [mpc getButton8].tag = 73;
 [mpc getButton8].isEnabled=YES;
 
 [mpc pressButton0:self];
 [mpc pressButton1:self];
 [mpc pressButton2:self];
 [mpc pressButton3:self];
 [mpc pressButton4:self];
 [mpc pressButton5:self];
 [mpc pressButton6:self];
 [mpc pressButton7:self];
 [mpc pressButton8:self];
 
 GHAssertEquals([mpc getButton0].tag, [mpc getSelect0].tag, @"button 0 and select 0 should have same tag values");
 GHAssertEquals([mpc getButton1].tag, [mpc getSelect1].tag, @"button 1 and select 1 should have same tag values");
 GHAssertEquals([mpc getButton2].tag, [mpc getSelect2].tag, @"button 2 and select 2 should have same tag values");
 GHAssertEquals([mpc getButton3].tag, [mpc getSelect3].tag, @"button 3 and select 3 should have same tag values");
 GHAssertEquals([mpc getButton4].tag, [mpc getSelect4].tag, @"button 4 and select 4 should have same tag values");
 GHAssertEquals([mpc getButton5].tag, [mpc getSelect5].tag, @"button 5 and select 5 should have same tag values");
 GHAssertEquals([mpc getButton6].tag, [mpc getSelect6].tag, @"button 6 and select 6 should have same tag values");
 GHAssertEquals([mpc getButton7].tag, [mpc getSelect7].tag, @"button 7 and select 7 should have same tag values");
 GHAssertEquals([mpc getButton8].tag, [mpc getSelect8].tag, @"button 8 and select 8 should have same tag values");
 
 }
 
 - (void) testMulti_Select9
 {
 //Initialize the buttons and select lists
 [mpc hideButtons];
 [mpc resetSelectArray];
 [[mpc getButton1] setNormalImage:[CCSprite spriteWithFile:@"B.png"]];
 [[mpc getButton1] setSelectedImage:[CCSprite spriteWithFile:@"B.png"]];
 [mpc getButton1].tag = 66;
 [mpc getButton1].isEnabled=YES;
 
 //Assume select[0] to select[8] is occupied
 [mpc getSelect0].tag = 1;
 [mpc getSelect1].tag = 1;
 [mpc getSelect2].tag = 1;
 [mpc getSelect3].tag = 1;
 [mpc getSelect4].tag = 1;
 [mpc getSelect5].tag = 1;
 [mpc getSelect6].tag = 1;
 [mpc getSelect7].tag = 1;
 [mpc getSelect8].tag = 1;
 
 [mpc pressButton1:self];
 GHAssertNotEquals([mpc getSelect9].tag, [mpc getSelect2].tag, @"select[9] and select[2] should have diff tags");
 GHAssertEquals([mpc getButton1].tag, [mpc getSelect9].tag, @"button 1 and select 9 should have same tag values");
 
 }
 
 - (void) testMulti_Button0BecomesDisabled
 {
 //Initialize the buttons and select lists
 [mpc hideButtons];
 [mpc resetSelectArray];
 [[mpc getButton0] setNormalImage:[CCSprite spriteWithFile:@"A.png"]];
 [[mpc getButton0] setSelectedImage:[CCSprite spriteWithFile:@"A.png"]];
 [mpc getButton0].tag = 65;
 [mpc getButton0].isEnabled=YES;
 
 [mpc pressButton0:self];
 GHAssertEquals([mpc getButton0].isEnabled, NO, @"After pressing button, button should be disabled");
 }
 
 - (void) testMulti_Button0To8_BecomesTransparent
 {
 //Initialize the buttons and select lists
 [mpc hideButtons];
 [mpc resetSelectArray];
 [[mpc getButton0] setNormalImage:[CCSprite spriteWithFile:@"A.png"]];
 [[mpc getButton0] setSelectedImage:[CCSprite spriteWithFile:@"A.png"]];
 [mpc getButton0].tag = 65;
 [mpc getButton0].isEnabled=YES;
 
 [[mpc getButton1] setNormalImage:[CCSprite spriteWithFile:@"B.png"]];
 [[mpc getButton1] setSelectedImage:[CCSprite spriteWithFile:@"B.png"]];
 [mpc getButton1].tag = 66;
 [mpc getButton1].isEnabled=YES;
 
 [[mpc getButton2] setNormalImage:[CCSprite spriteWithFile:@"C.png"]];
 [[mpc getButton2] setSelectedImage:[CCSprite spriteWithFile:@"C.png"]];
 [mpc getButton2].tag = 67;
 [mpc getButton2].isEnabled=YES;
 
 [[mpc getButton3] setNormalImage:[CCSprite spriteWithFile:@"D.png"]];
 [[mpc getButton3] setSelectedImage:[CCSprite spriteWithFile:@"D.png"]];
 [mpc getButton3].tag = 68;
 [mpc getButton3].isEnabled=YES;
 
 [[mpc getButton4] setNormalImage:[CCSprite spriteWithFile:@"E.png"]];
 [[mpc getButton4] setSelectedImage:[CCSprite spriteWithFile:@"E.png"]];
 [mpc getButton4].tag = 69;
 [mpc getButton4].isEnabled=YES;
 
 [[mpc getButton5] setNormalImage:[CCSprite spriteWithFile:@"F.png"]];
 [[mpc getButton5] setSelectedImage:[CCSprite spriteWithFile:@"F.png"]];
 [mpc getButton5].tag = 70;
 [mpc getButton5].isEnabled=YES;
 
 [[mpc getButton6] setNormalImage:[CCSprite spriteWithFile:@"G.png"]];
 [[mpc getButton6] setSelectedImage:[CCSprite spriteWithFile:@"G.png"]];
 [mpc getButton6].tag = 71;
 [mpc getButton6].isEnabled=YES;
 
 [[mpc getButton7] setNormalImage:[CCSprite spriteWithFile:@"H.png"]];
 [[mpc getButton7] setSelectedImage:[CCSprite spriteWithFile:@"H.png"]];
 [mpc getButton7].tag = 72;
 [mpc getButton7].isEnabled=YES;
 
 [[mpc getButton8] setNormalImage:[CCSprite spriteWithFile:@"I.png"]];
 [[mpc getButton8] setSelectedImage:[CCSprite spriteWithFile:@"I.png"]];
 [mpc getButton8].tag = 73;
 [mpc getButton8].isEnabled=YES;
 
 [mpc pressButton0:self];
 [mpc pressButton1:self];
 [mpc pressButton2:self];
 [mpc pressButton3:self];
 [mpc pressButton4:self];
 [mpc pressButton5:self];
 [mpc pressButton6:self];
 [mpc pressButton7:self];
 [mpc pressButton8:self];
 
 GHAssertEquals([mpc getButton0].isEnabled, NO, @"After pressing button0, button0 should be disabled");
 GHAssertEquals([mpc getButton1].isEnabled, NO, @"After pressing button1, button1 should be disabled");
 GHAssertEquals([mpc getButton2].isEnabled, NO, @"After pressing button2, button2 should be disabled");
 GHAssertEquals([mpc getButton3].isEnabled, NO, @"After pressing button3, button3 should be disabled");
 GHAssertEquals([mpc getButton4].isEnabled, NO, @"After pressing button4, button4 should be disabled");
 GHAssertEquals([mpc getButton5].isEnabled, NO, @"After pressing button5, button5 should be disabled");
 GHAssertEquals([mpc getButton6].isEnabled, NO, @"After pressing button6, button6 should be disabled");
 GHAssertEquals([mpc getButton7].isEnabled, NO, @"After pressing button7, button7 should be disabled");
 GHAssertEquals([mpc getButton8].isEnabled, NO, @"After pressing button8, button8 should be disabled");
 }
 

@end
