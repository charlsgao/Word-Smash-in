//
//  levelPage.m
//  Word Smash'in
//
//  Created by Denny Winoto on 3/14/13.
//  Copyright (c) 2013 Bing. All rights reserved.
//

#import "levelPage.h"
#import "stagePage.h"


@interface levelPage ()

@end

@implementation levelPage


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
    self.level = 5;
    [self init_p];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)init_p
{
    UIButton *b;
    for (b in self.levelButton){
        if (b.tag <= self.level)
            b.hidden = false;
        else
            b.hidden = true;
    }

}

- (IBAction)select_action:(id)sender
{
    UIButton *b = (UIButton*) sender;
    double time = 1;
    
    for (int i=0; i<b.tag; i++)
        time -= 0.02;
    
    NSLog(@"%g" , time);
    
    /*
    for (UIButton *next in self.levelButton){
        if (next.tag == b.tag+1){
            next.hidden = false;
            [self.label setText:[NSString stringWithFormat:@"button%d", b.tag]];
        }
    }
    */
    BUTTON_APPEAR_DURATION = time ;
    stagePage *s = [self.storyboard instantiateViewControllerWithIdentifier:@"stagePage"];
    [self presentViewController:s animated:YES completion:nil];
    
    
     
}


@end
