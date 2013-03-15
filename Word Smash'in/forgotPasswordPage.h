//
//  forgotPasswordPage.h
//  Word Smash'in
//
//  Created by Daniel on 3/2/13.
//  Copyright (c) 2013 Bing. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface forgotPasswordPage : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (nonatomic, strong) IBOutlet UITextView *messageText;

@property (copy, nonatomic) NSString *email;
@property (nonatomic, strong) NSDictionary *errCode; // ERROR CODE Dictionary
@property (nonatomic, strong) NSString *urlString; // Server URL


- (IBAction)emailTextEntered:(id)sender;
- (IBAction)requestButtonTapped:(id)sender;
- (IBAction)backButtonTapped:(id)sender;
- (IBAction)helpButtonTapped:(id)sender;

- (NSDictionary*)HTTPResponseAndRequest:(NSString*)url_addition;
- (void)responseAction:(NSDictionary*)response;

@end
