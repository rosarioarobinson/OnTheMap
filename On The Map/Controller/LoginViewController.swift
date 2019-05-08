//
//  LoginViewController.swift
//  On The Map
//
//  Created by Rosario A Robinson on 11/13/18.
//  Copyright © 2018 Rosario Robinson. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: Properties
    
    var appDelegate: AppDelegate!
    
    //MARK: Outlets

    @IBOutlet weak var UsernameTextField: UITextField!
    
    @IBOutlet weak var PasswordTextField: UITextField!
    
    @IBOutlet weak var LogInButton: UIButton!
    
    @IBOutlet weak var SignUpButton: UIButton!
    
    
    //MARK: Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //app delegate
        appDelegate = UIApplication.shared.delegate as! AppDelegate
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        // Subscribe to keyboard notifications to allow the view to raise when necessary
        subscribeToKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unsubscribeFromKeyboardNotifications()
    }
    
    @IBAction func LogInPressed(_ sender: AnyObject) {
        
        if UsernameTextField.text!.isEmpty || PasswordTextField.text!.isEmpty {
            self.displayError("Username or Password is Empty.")
            return
        }
        
        //getting login credentials from UdacityClient and UdacityConvenience
        //note: removed URL and jsonBody parameters
        
        UdacityClient.sharedInstance().loginUser(usernameLogin: UsernameTextField.text ?? "", passwordLogin: PasswordTextField.text ?? "") { (success, errorString) in
            DispatchQueue.main.async {
                if (success != nil) {
                    self.completeLogin()
                } else {
                    //error added from displayError function
                    self.displayError("")
                }
            }
            }
        
        
    }
    
    //MARK: Action for SignUp to open Safari
    @IBAction func signUpAction(_ sender: AnyObject) {
        
        let url = URL (string: "https://auth.udacity.com/sign-up")
        UIApplication.shared.openURL(url!)
        
        
    }
    
    func displayError(_ errorString: String?) {
        // create the alert
        let alert = UIAlertController(title: "Error!", message: "Login Has Failed.", preferredStyle: UIAlertControllerStyle.alert)
        // add an action
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    
    //subscribe to keyboard notifications
    func subscribeToKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(LoginViewController.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(LoginViewController.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    // unsubscribe to keyboard notifications
    func unsubscribeFromKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillHide, object: nil)
    }
    
    
    //allows keyboard to move frame upwards
    @objc func keyboardWillShow(notification: NSNotification) {
        
    }
    
    //hides the keyboard
    @objc func keyboardWillHide(notification: NSNotification) {
        view.frame.origin.y = 0
    }
    
    
    private func completeLogin() {
        /*UsernameTextField.text! = ""
        PasswordTextField.text! = ""*/
        let controller = self.storyboard!.instantiateViewController(withIdentifier: "MainNavBar") as! UINavigationController
        self.present(controller, animated: true, completion: nil)
        
    }
    
    func setUIEnabled(_ enabled: Bool) {
        LogInButton.isEnabled = enabled
        UsernameTextField.isEnabled = enabled
        PasswordTextField.isEnabled = enabled
        
        
    }
    
    
}
