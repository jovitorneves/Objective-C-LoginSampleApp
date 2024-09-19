//
//  LoginViewController.m
//  LoginSampleApp
//
//  Created by J. Vitor Neves on 18/09/24.
//

#import "LoginViewController.h"
#import "LoginSampleApp-Swift.h"
#import "LoginViewManager.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    emailTF.accessibilityIdentifier = @"email";
    passwordTF.accessibilityIdentifier = @"password";
    loginBtn.accessibilityIdentifier = @"loginBtn";
    newRegisterBtn.accessibilityIdentifier = @"newRegisterBtn";
    passwordTF.delegate = self;
    [self navigationController].title = NSString.string;
}

- (IBAction)loginAction:(UIButton *)sender {
    LoginViewManager *loginViewManager = [[LoginViewManager alloc] init];
    
    [loginViewManager fetchUsersWithEmail:emailTF.text
                                 password:passwordTF.text
                               completion:^(NSArray<UserModel *> *users,
                                            NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSString *msg = @"";
            if (users.count > 0){
                msg = [@"Welcome, " stringByAppendingString: users.firstObject.name];
            } else {
                msg = error.domain;
            }
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Login"
                                                                               message:msg
                                                                        preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK"
                                                               style:UIAlertActionStyleDefault
                                                             handler:nil];
            [alert addAction:okAction];
            
            [self presentViewController: alert
                               animated: YES
                             completion: nil];
        });
    }];
}

- (IBAction)newRegisterAction:(UIButton *)sender {
    SignUpViewController *vc = [[SignUpViewController alloc] initWithNibName:@"SignUpViewController"
                                                                      bundle:nil];
    
    [self.navigationController pushViewController:vc
                                         animated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [passwordTF resignFirstResponder];
    
    return YES;
}

@end
