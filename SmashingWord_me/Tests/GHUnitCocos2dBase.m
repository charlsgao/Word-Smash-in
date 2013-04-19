//
//  GHUnitCocos2dBase.m
//  SmashingWord_me
//
//  Created by Denny Winoto on 4/18/13.
//
//

#import "GHUnitCocos2dBase.h"



@implementation GHUnitCocos2dBase

- (BOOL) shouldRunOnMainThread
{
    // By default NO, but if you have a UI test or test dependent on running on the main thread return YES
    return YES;
}

- (void) setUpClass
{
    
	CC_DIRECTOR_INIT();
    
    spc = [[SinglePlayerScene alloc] init];

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

- (void) testSample
{
    NSString *line = [spc readDictionaryFile:1 fileName:@"test.txt"];
    GHAssertTrue([line isEqualToString: @"hello"], @"Not equal to hello");
}

- (void) testGetWords
{
    [spc getWords];
    GHAssertNotNil([spc getWord1], @"Word1 should not be nil");
}

- (void) testButton0
{
    //Initialize the buttons and select lists
    [spc hideButtons];
    [spc resetSelectArray];
    [[spc getButton0] setNormalImage:[CCSprite spriteWithFile:@"A.png"]];
    [[spc getButton0] setSelectedImage:[CCSprite spriteWithFile:@"A.png"]];
    [spc getButton0].tag = 65;
    [spc getButton0].isEnabled=YES;
    [spc pressButton0:self];
    GHAssertEquals([spc getButton0].tag, [spc getSelect0].tag, @"button 0 and select 0 should have same tag values");
    
}

- (void) testButton1
{
    //Initialize the buttons and select lists
    [spc hideButtons];
    [spc resetSelectArray];
    [[spc getButton1] setNormalImage:[CCSprite spriteWithFile:@"B.png"]];
    [[spc getButton1] setSelectedImage:[CCSprite spriteWithFile:@"B.png"]];
    [spc getButton1].tag = 66;
    [spc getButton1].isEnabled=YES;
    
    //Assume select[0] is occupied
    [spc getSelect0].tag = 1;
    [spc pressButton1:self];
    GHAssertEquals([spc getButton1].tag, [spc getSelect1].tag, @"button 0 and select 0 should have same tag values");
    
}

- (void) testButton0To8
{
    //Initialize the buttons and select lists
    [spc hideButtons];
    [spc resetSelectArray];
    [[spc getButton0] setNormalImage:[CCSprite spriteWithFile:@"A.png"]];
    [[spc getButton0] setSelectedImage:[CCSprite spriteWithFile:@"A.png"]];
    [spc getButton0].tag = 65;
    [spc getButton0].isEnabled=YES;

    [[spc getButton1] setNormalImage:[CCSprite spriteWithFile:@"B.png"]];
    [[spc getButton1] setSelectedImage:[CCSprite spriteWithFile:@"B.png"]];
    [spc getButton1].tag = 66;
    [spc getButton1].isEnabled=YES;

    [[spc getButton2] setNormalImage:[CCSprite spriteWithFile:@"C.png"]];
    [[spc getButton2] setSelectedImage:[CCSprite spriteWithFile:@"C.png"]];
    [spc getButton2].tag = 67;
    [spc getButton2].isEnabled=YES;
    
    [[spc getButton3] setNormalImage:[CCSprite spriteWithFile:@"D.png"]];
    [[spc getButton3] setSelectedImage:[CCSprite spriteWithFile:@"D.png"]];
    [spc getButton3].tag = 68;
    [spc getButton3].isEnabled=YES;
    
    [[spc getButton4] setNormalImage:[CCSprite spriteWithFile:@"E.png"]];
    [[spc getButton4] setSelectedImage:[CCSprite spriteWithFile:@"E.png"]];
    [spc getButton4].tag = 69;
    [spc getButton4].isEnabled=YES;
    
    [[spc getButton5] setNormalImage:[CCSprite spriteWithFile:@"F.png"]];
    [[spc getButton5] setSelectedImage:[CCSprite spriteWithFile:@"F.png"]];
    [spc getButton5].tag = 70;
    [spc getButton5].isEnabled=YES;
    
    [[spc getButton6] setNormalImage:[CCSprite spriteWithFile:@"G.png"]];
    [[spc getButton6] setSelectedImage:[CCSprite spriteWithFile:@"G.png"]];
    [spc getButton6].tag = 71;
    [spc getButton6].isEnabled=YES;
    
    [[spc getButton7] setNormalImage:[CCSprite spriteWithFile:@"H.png"]];
    [[spc getButton7] setSelectedImage:[CCSprite spriteWithFile:@"H.png"]];
    [spc getButton7].tag = 72;
    [spc getButton7].isEnabled=YES;
    
    [[spc getButton8] setNormalImage:[CCSprite spriteWithFile:@"I.png"]];
    [[spc getButton8] setSelectedImage:[CCSprite spriteWithFile:@"I.png"]];
    [spc getButton8].tag = 73;
    [spc getButton8].isEnabled=YES;
    
    [spc pressButton0:self];
    [spc pressButton1:self];
    [spc pressButton2:self];
    [spc pressButton3:self];
    [spc pressButton4:self];
    [spc pressButton5:self];
    [spc pressButton6:self];
    [spc pressButton7:self];
    [spc pressButton8:self];
    
    GHAssertEquals([spc getButton0].tag, [spc getSelect0].tag, @"button 0 and select 0 should have same tag values");
    GHAssertEquals([spc getButton1].tag, [spc getSelect1].tag, @"button 1 and select 1 should have same tag values");
    GHAssertEquals([spc getButton2].tag, [spc getSelect2].tag, @"button 2 and select 2 should have same tag values");
    GHAssertEquals([spc getButton3].tag, [spc getSelect3].tag, @"button 3 and select 3 should have same tag values");
    GHAssertEquals([spc getButton4].tag, [spc getSelect4].tag, @"button 4 and select 4 should have same tag values");
    GHAssertEquals([spc getButton5].tag, [spc getSelect5].tag, @"button 5 and select 5 should have same tag values");
    GHAssertEquals([spc getButton6].tag, [spc getSelect6].tag, @"button 6 and select 6 should have same tag values");
    GHAssertEquals([spc getButton7].tag, [spc getSelect7].tag, @"button 7 and select 7 should have same tag values");
    GHAssertEquals([spc getButton8].tag, [spc getSelect8].tag, @"button 8 and select 8 should have same tag values");
    
}

- (void) testSelect9
{
    //Initialize the buttons and select lists
    [spc hideButtons];
    [spc resetSelectArray];
    [[spc getButton1] setNormalImage:[CCSprite spriteWithFile:@"B.png"]];
    [[spc getButton1] setSelectedImage:[CCSprite spriteWithFile:@"B.png"]];
    [spc getButton1].tag = 66;
    [spc getButton1].isEnabled=YES;
    
    //Assume select[0] to select[8] is occupied
    [spc getSelect0].tag = 1;
    [spc getSelect1].tag = 1;
    [spc getSelect2].tag = 1;
    [spc getSelect3].tag = 1;
    [spc getSelect4].tag = 1;
    [spc getSelect5].tag = 1;
    [spc getSelect6].tag = 1;
    [spc getSelect7].tag = 1;
    [spc getSelect8].tag = 1;
    
    [spc pressButton1:self];
    GHAssertNotEquals([spc getSelect9].tag, [spc getSelect2].tag, @"select[9] and select[2] should have diff tags");
    GHAssertEquals([spc getButton1].tag, [spc getSelect9].tag, @"button 1 and select 9 should have same tag values");
    
}

- (void) testButton0BecomesDisabled
{
    //Initialize the buttons and select lists
    [spc hideButtons];
    [spc resetSelectArray];
    [[spc getButton0] setNormalImage:[CCSprite spriteWithFile:@"A.png"]];
    [[spc getButton0] setSelectedImage:[CCSprite spriteWithFile:@"A.png"]];
    [spc getButton0].tag = 65;
    [spc getButton0].isEnabled=YES;
    
    [spc pressButton0:self];
    GHAssertEquals([spc getButton0].isEnabled, NO, @"After pressing button, button should be disabled");
}

- (void) testButton0To8_BecomesTransparent
{
    //Initialize the buttons and select lists
    [spc hideButtons];
    [spc resetSelectArray];
    [[spc getButton0] setNormalImage:[CCSprite spriteWithFile:@"A.png"]];
    [[spc getButton0] setSelectedImage:[CCSprite spriteWithFile:@"A.png"]];
    [spc getButton0].tag = 65;
    [spc getButton0].isEnabled=YES;
    
    [[spc getButton1] setNormalImage:[CCSprite spriteWithFile:@"B.png"]];
    [[spc getButton1] setSelectedImage:[CCSprite spriteWithFile:@"B.png"]];
    [spc getButton1].tag = 66;
    [spc getButton1].isEnabled=YES;
    
    [[spc getButton2] setNormalImage:[CCSprite spriteWithFile:@"C.png"]];
    [[spc getButton2] setSelectedImage:[CCSprite spriteWithFile:@"C.png"]];
    [spc getButton2].tag = 67;
    [spc getButton2].isEnabled=YES;
    
    [[spc getButton3] setNormalImage:[CCSprite spriteWithFile:@"D.png"]];
    [[spc getButton3] setSelectedImage:[CCSprite spriteWithFile:@"D.png"]];
    [spc getButton3].tag = 68;
    [spc getButton3].isEnabled=YES;
    
    [[spc getButton4] setNormalImage:[CCSprite spriteWithFile:@"E.png"]];
    [[spc getButton4] setSelectedImage:[CCSprite spriteWithFile:@"E.png"]];
    [spc getButton4].tag = 69;
    [spc getButton4].isEnabled=YES;
    
    [[spc getButton5] setNormalImage:[CCSprite spriteWithFile:@"F.png"]];
    [[spc getButton5] setSelectedImage:[CCSprite spriteWithFile:@"F.png"]];
    [spc getButton5].tag = 70;
    [spc getButton5].isEnabled=YES;
    
    [[spc getButton6] setNormalImage:[CCSprite spriteWithFile:@"G.png"]];
    [[spc getButton6] setSelectedImage:[CCSprite spriteWithFile:@"G.png"]];
    [spc getButton6].tag = 71;
    [spc getButton6].isEnabled=YES;
    
    [[spc getButton7] setNormalImage:[CCSprite spriteWithFile:@"H.png"]];
    [[spc getButton7] setSelectedImage:[CCSprite spriteWithFile:@"H.png"]];
    [spc getButton7].tag = 72;
    [spc getButton7].isEnabled=YES;
    
    [[spc getButton8] setNormalImage:[CCSprite spriteWithFile:@"I.png"]];
    [[spc getButton8] setSelectedImage:[CCSprite spriteWithFile:@"I.png"]];
    [spc getButton8].tag = 73;
    [spc getButton8].isEnabled=YES;
    
    [spc pressButton0:self];
    [spc pressButton1:self];
    [spc pressButton2:self];
    [spc pressButton3:self];
    [spc pressButton4:self];
    [spc pressButton5:self];
    [spc pressButton6:self];
    [spc pressButton7:self];
    [spc pressButton8:self];
    
    GHAssertEquals([spc getButton0].isEnabled, NO, @"After pressing button0, button0 should be disabled");
    GHAssertEquals([spc getButton1].isEnabled, NO, @"After pressing button1, button1 should be disabled");
    GHAssertEquals([spc getButton2].isEnabled, NO, @"After pressing button2, button2 should be disabled");
    GHAssertEquals([spc getButton3].isEnabled, NO, @"After pressing button3, button3 should be disabled");
    GHAssertEquals([spc getButton4].isEnabled, NO, @"After pressing button4, button4 should be disabled");
    GHAssertEquals([spc getButton5].isEnabled, NO, @"After pressing button5, button5 should be disabled");
    GHAssertEquals([spc getButton6].isEnabled, NO, @"After pressing button6, button6 should be disabled");
    GHAssertEquals([spc getButton7].isEnabled, NO, @"After pressing button7, button7 should be disabled");
    GHAssertEquals([spc getButton8].isEnabled, NO, @"After pressing button8, button8 should be disabled");
}

@end