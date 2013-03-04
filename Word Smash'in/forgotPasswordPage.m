//
//  forgotPasswordPage.m
//  Word Smash'in
//
//  Created by Daniel on 3/2/13.
//  Copyright (c) 2013 Bing. All rights reserved.
//

#import "forgotPasswordPage.h"
#import "helpPage.h"

@interface forgotPasswordPage ()

@end

@implementation forgotPasswordPage

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


- (IBAction)request:(id)sender {
}

- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)help:(id)sender {
    helpPage *hg = [self.storyboard instantiateViewControllerWithIdentifier:@"helpPage"];
    [self presentViewController:hg animated:YES completion:nil];
}


- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    
    [theTextField resignFirstResponder];
    return YES;
}

@end
