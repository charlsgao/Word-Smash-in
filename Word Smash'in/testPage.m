//
//  testPage.m
//  Word Smash'in
//
//  Created by Daniel on 3/4/13.
//  Copyright (c) 2013 Bing. All rights reserved.
//

#import "testPage.h"

@interface testPage ()

@end



@implementation testPage
NSTimer *timer;
int currMinute;
int currSeconds;



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
    
    
    //[self start];
    
    NSLog(@"fasdfsadfdsfdsf");
    //[super viewDidLoad];
	// Do any additional setup after loading the view.
}

-(IBAction)start
{
    [timer invalidate];
    timer = nil;
    self.progress.textColor=[UIColor redColor];
    [self.progress setText:@"Time : 0:10"];
    self.progress.backgroundColor=[UIColor clearColor];
    //[self.view addSubview:self.progress];
    currMinute=0;
    currSeconds=10;
    timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerFired) userInfo:nil repeats:YES];
    
}
-(void)timerFired
{
    if((currMinute>0 || currSeconds>=0) && currMinute>=0)
    {
        if(currSeconds==0)
        {
            currMinute-=1;
            currSeconds=60;
        }
        else if(currSeconds>0)
        {
            currSeconds-=1;
        }
        if(currMinute>-1)
            [self.progress setText:[NSString stringWithFormat:@"%@%d%@%02d",@"Time : ",currMinute,@":",currSeconds]];
    }
    else
    {
        [timer invalidate];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
