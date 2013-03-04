//
//  homePage.m
//  Word Smash'in
//
//  Created by Daniel on 3/2/13.
//  Copyright (c) 2013 Bing. All rights reserved.
//

#import "homePage.h"
#import "helpPage.h"

@interface homePage ()

@end

@implementation homePage

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)single:(UIButton *)sender {
}

- (IBAction)multi:(UIButton *)sender {
}

- (IBAction)shop:(UIButton *)sender {
}

- (IBAction)help:(id)sender {
    helpPage *hg = [self.storyboard instantiateViewControllerWithIdentifier:@"helpPage"];
    [self presentViewController:hg animated:YES completion:nil];
}
@end
