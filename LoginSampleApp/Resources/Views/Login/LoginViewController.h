//
//  LoginViewController.h
//  LoginSampleApp
//
//  Created by J. Vitor Neves on 18/09/24.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController <UITextFieldDelegate>
{
    __weak IBOutlet UIView *emailView;
    __weak IBOutlet UITextField *emailTF;
    __weak IBOutlet UIView *passwordView;
    __weak IBOutlet UITextField *passwordTF;
    __weak IBOutlet UIButton *loginBtn;
    __weak IBOutlet UIButton *newRegisterBtn;
}

@end

