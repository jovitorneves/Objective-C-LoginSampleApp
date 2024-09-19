//
//  SignUpViewController.swift
//  LoginSampleApp
//
//  Created by J. Vitor Neves on 18/09/24.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var fullNameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var repeatPasswordTF: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    
    private let signupManager: SignUpViewManager = SignUpViewManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func signupAction(_ sender: UIButton) {
        signupManager.signUp(withFullName: fullNameTF.text,
                             email: emailTF.text,
                             phone: phoneTF.text,
                             password: passwordTF.text,
                             repeatPassword: repeatPasswordTF.text) { [weak self] msg, success in
            guard let msg = msg else { return }
            self?.showAlert(msg: msg,
                            success: success)
        }
    }
    
    func showAlert(msg: String,
                   success: Bool) {
        
        let alert = UIAlertController(title: "SignUp!",
                                      message: msg,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK",
                                     style: .default,
                                     handler: { [weak self] alertView in
            if success {
                self?.navigationController?.popToRootViewController(animated: true)
            }
        })
        alert.addAction(okAction)
        
        self.present(alert,
                     animated: true)
    }
}
