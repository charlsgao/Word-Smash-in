//
//  forgotPasswordPage.h
//  Word Smash'in
//
//  Created by Daniel on 3/2/13.
//  Copyright (c) 2013 Bing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface forgotPasswordPage : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *emailText;
- (IBAction)request:(id)sender;
- (IBAction)back:(id)sender;
- (IBAction)help:(id)sender;


@end
