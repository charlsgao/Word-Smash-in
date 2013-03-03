//
//  registerPage.h
//  Word Smash'in
//
//  Created by Daniel on 3/2/13.
//  Copyright (c) 2013 Bing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface registerPage : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;

@property (copy, nonatomic) NSString *username;
@property (copy, nonatomic) NSString *psd;
@property (copy, nonatomic) NSString *email;

- (IBAction)addUser:(id)sender;


@end
