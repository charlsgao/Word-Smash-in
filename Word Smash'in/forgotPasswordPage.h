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
- (IBAction)request:(UIButton *)sender;
- (IBAction)back:(UIButton *)sender;

@end
