//
//  UCBViewController.m
//  Word Smash'in
//
//  Created by Bing on 3/1/13.
//  Copyright (c) 2013 Bing. All rights reserved.
//

#import "UCBViewController.h"
#import "loginPage.h"
#import "registerPage.h"
#import "helpPage.h"


@interface UCBViewController ()

@end

@implementation UCBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)login:(id)sender {
    loginPage *lg = [self.storyboard instantiateViewControllerWithIdentifier:@"loginPage"];
    [self presentViewController:lg animated:YES completion:nil];
}

- (IBAction)reg:(id)sender {
    registerPage *rg = [self.storyboard instantiateViewControllerWithIdentifier:@"registerPage"];
    [self presentViewController:rg animated:YES completion:nil];
}
- (IBAction)score:(id)sender {
}

- (IBAction)help:(id)sender {
    helpPage *hg = [self.storyboard instantiateViewControllerWithIdentifier:@"helpPage"];
    [self presentViewController:hg animated:YES completion:nil];
}
@end
