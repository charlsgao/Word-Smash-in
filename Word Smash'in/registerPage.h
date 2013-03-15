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
@property (nonatomic, strong) IBOutlet UITextView *messageText;

@property (copy, nonatomic) NSString *username;
@property (copy, nonatomic) NSString *password;
@property (copy, nonatomic) NSString *email;

@property (nonatomic, strong) NSDictionary *errCode; // ERROR CODE Dictionary
@property (nonatomic, strong) NSString *urlString; // Server URL

- (IBAction)usernameTextEntered:(id)sender;
- (IBAction)passwordTextEntered:(id)sender;
- (IBAction)emailTextEntered:(id)sender;
- (IBAction)addButtonTapped:(id)sender;
- (IBAction)backButtonTapped:(id)sender;
- (IBAction)helpButtonTapped:(id)sender;

- (NSDictionary*)HTTPResponseAndRequest:(NSString*)url_addition;
- (void)responseAction:(NSDictionary*)response;


@end
