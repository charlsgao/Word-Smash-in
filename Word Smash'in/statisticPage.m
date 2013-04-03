//
//  statisticPage.m
//  Word Smash'in
//
//  Created by Denny Winoto on 3/14/13.
//  Copyright (c) 2013 Bing. All rights reserved.
//

#import "statisticPage.h"
#import "stagePage.h"
#import "levelPage.h"
#import "scorePage.h"
#import "homePage.h"

@interface statisticPage ()

@end

@implementation statisticPage

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
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.word1.text = word_1;
    self.word2.text = word_2;
    self.word3.text = word_3;
    
    self.result1.text = [NSString stringWithFormat:@"%i", score_1];
    self.result2.text = [NSString stringWithFormat:@"%i", score_2];
    self.result3.text = [NSString stringWithFormat:@"%i", score_3];
    
    self.totalScore.text = [NSString stringWithFormat:@"%i", score];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)playAgain:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)levelPage:(id)sender
{
    levelPage *s = [self.storyboard instantiateViewControllerWithIdentifier:@"levelPage"];
    [self presentViewController:s animated:YES completion:nil];
}

- (IBAction)scorePage:(id)sender
{
    scorePage *s = [self.storyboard instantiateViewControllerWithIdentifier:@"scorePage"];
    [self presentViewController:s animated:YES completion:nil];
}

- (IBAction)homePage:(id)sender
{
    homePage *s = [self.storyboard instantiateViewControllerWithIdentifier:@"homePage"];
    [self presentViewController:s animated:YES completion:nil];
}

@end
