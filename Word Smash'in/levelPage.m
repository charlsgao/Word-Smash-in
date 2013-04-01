//
//  levelPage.m
//  Word Smash'in
//
//  Created by Denny Winoto on 3/14/13.
//  Copyright (c) 2013 Bing. All rights reserved.
//

#import "levelPage.h"

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
    [self initialize];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initialize
{
    UIButton *b;
    for (b in self.levelButton){
        if (b.tag != 0)
            b.hidden = true;
        else
            b.hidden = false;
    }

}

- (IBAction)action:(id)sender
{
    UIButton *b = (UIButton*) sender;
    //[self.label setText:[NSString stringWithFormat:@"%d", b.tag]];
    
    for (UIButton *next in self.levelButton){
        if (next.tag == b.tag+1){
            next.hidden = false;
            [self.label setText:[NSString stringWithFormat:@"button%d", b.tag]];
        }
    }
    
}

@end
