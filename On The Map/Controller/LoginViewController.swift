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
            print("Username or Password is Empty.")
        }
        
            //getting login credentials from UdacityClient and UdacityConvenience
            //jsonBody error: 'Cannot convert value of type '[String : AnyObject].Type' to expected argument type '[AnyObject]'
        
        /*UdacityClient.sharedInstance().loginUser(username: UsernameTextField.text!, password: PasswordTextField.text!, url: URL(string: "https://www.udacity.com/api/session")!, jsonBody: [String: AnyObject]) { (success, errorString) in
                    if success {
                        self.completeLogin()
                    }else if errorString != nil{
                        self.showAlert(title: "Login Failed", message: errorString)
                    }else{
                        self.showAlert(title: "Login Failed", message: "Incorrect credentials were provided.")
                    }
            }*/
        
        
        /*guard let username = UsernameTextField.text, username != "" else {
            print("username is empty")
            newAlert(title: "Error!", message: "Please enter your username or email address!")
            return
        }
        guard let password = PasswordTextField.text, password != "" else {
            print("password is empty")
            createAlert(title: "Error!", message: "Please enter your password!")
            return
        }
        
        disableUI()*/
        
    }
    
    //MARK: Action for SignUp to open Safari
    @IBAction func signUpAction(_ sender: AnyObject) {
        
        let url = URL (string: "https://auth.udacity.com/sign-up")
        UIApplication.shared.openURL(url!)
        
        
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
        let controller = self.storyboard!.instantiateViewController(withIdentifier: "TabBarViewController") as! UITabBarController
        self.present(controller, animated: true, completion: nil)
        
    }
    
    
}
