//
//  ViewController.swift
//  Basic
//
//  Created by Cumulations Technologies Private Limited on 19/11/22.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    static let cornerRadius: CGFloat = 20
    let logInTextLabel : UILabel = {
        let label               = UILabel()
        label.text              = "Log In"
        label.textColor         = UIColor.appColors(colorName: .labelGreen)
        label.font              = UIFont(name: "Sono-Bold", size: 16)
        label.textAlignment     = .center
        return label
    }()
    
    let emailTextField : UITextField = {
        let email                = UITextField()
        email.placeholder        = "Please enter your email"
        email.font               = UIFont(name: "Sono-Regular", size: 14)
        email.keyboardAppearance = .default
        email.keyboardType       = .alphabet
        email.autocorrectionType = .no
        email.leftViewMode       = .always
        email.leftView           = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        email.layer.borderWidth  = 2
        email.layer.borderColor  = UIColor.appColors(colorName: .labelGreen)?.cgColor ?? UIColor.green as! CGColor
        email.layer.cornerRadius = cornerRadius
        return email
    }()
    
    let passTextField : UITextField = {
        let password                = UITextField()
        password.placeholder        = "Please enter password"
        password.font               = UIFont(name: "Sono-Regular", size: 14)
        password.keyboardAppearance = .default
        password.keyboardType       = .alphabet
        password.autocorrectionType = .no
        password.leftViewMode       = .always
        password.leftView           = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        password.isSecureTextEntry  = true
        password.layer.borderWidth  = 2
        password.layer.borderColor  = UIColor.appColors(colorName: .labelGreen)?.cgColor ?? UIColor.green as! CGColor
        password.layer.cornerRadius = cornerRadius
        return password
    }()
    
    let logInUpButton : UIButton = {
        let button                = UIButton()
        button.backgroundColor    = UIColor.appColors(colorName: .labelGreen)
        button.titleLabel?.font   = UIFont(name: "Sono-Bold", size: 16)
        button.layer.cornerRadius = cornerRadius
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitle("Log In", for: .normal)
        return button
    }()
    override func loadView() {
        super.loadView()
        print("loadView-1")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("viewdidload-1")
        
        view.addSubview(logInTextLabel)
        view.addSubview(emailTextField)
        view.addSubview(passTextField)
        view.addSubview(logInUpButton)
        
        logInUpButton.addTarget(self, action: #selector(logInButtonTapped), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear-1")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear-1")
        emailTextField.becomeFirstResponder()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        logInTextLabel.frame    = CGRect(x: 20, y: 50, width: view.width-40, height: 40)
        emailTextField.frame    = CGRect(x: logInTextLabel.left, y: logInTextLabel.bottom + 20, width: logInTextLabel.width, height: logInTextLabel.height)
        passTextField.frame     = CGRect(x: logInTextLabel.left, y: emailTextField.bottom + 20, width: logInTextLabel.width, height: logInTextLabel.height)
        logInUpButton.frame     = CGRect(x: logInTextLabel.left, y: passTextField.bottom + 20, width: logInTextLabel.width, height: logInTextLabel.height)
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear-1")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear-1")
    }
    deinit{
       //we can clean up any memory or we can nill out the variables
    
    }

    
    @objc func logInButtonTapped(){
        
        guard let email = emailTextField.text, !email.isEmpty,
              let password = passTextField.text, !password.isEmpty else{
            print("please enter fields")
            return
        }
        /*
         1. Get auth instance
         2. Sign in
         3. If not able to sign in, direct to sign up using fn directToRegisterScreen
         4. If able to sign in, direct to homescreen
         */
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            
            guard let strongSelf = self else{
                return
            }
            guard error == nil else{
                strongSelf.directToRegisterScreen(email: email, password: password)
                return
            }
            
            print("you have successfully signed in")
            
            let defaults = UserDefaults.standard
            defaults.set(true, forKey: "logIn")
            
//            strongSelf.logInTextLabel.isHidden = true
//            strongSelf.emailTextField.isHidden = true
//            strongSelf.passTextField.isHidden = true
//            strongSelf.logInUpButton.isHidden = true
            
            strongSelf.emailTextField.resignFirstResponder()
            strongSelf.passTextField.resignFirstResponder()
            
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let VC = storyBoard.instantiateViewController(withIdentifier: "HomeScreenViewController") as! HomeScreenViewController
            VC.modalPresentationStyle = .fullScreen
            strongSelf.present(VC, animated: false)
            
        }

    }
    func directToRegisterScreen(email: String, password: String){
        
        let alert = UIAlertController(title: "Create Account", message: "Please create an account", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: { _ in
            
            Auth.auth().createUser(withEmail: email, password: password) { [weak self] authResult, error in
                
                guard let strongSelf = self else{
                    return
                }
                guard error == nil else{
                    let errorAlert = UIAlertController(title: "Alert", message: "Failed to create account", preferredStyle: .alert)
                    let action = UIAlertAction(title: "Ok", style: .cancel)
                    errorAlert.addAction(action)
                    strongSelf.present(errorAlert, animated: false)
                    return
                }
                let defaults = UserDefaults.standard
                defaults.set(true, forKey: "logIn")
                print("you have successfully signed in")
                
//                strongSelf.logInTextLabel.isHidden = true
//                strongSelf.emailTextField.isHidden = true
//                strongSelf.passTextField.isHidden = true
//                strongSelf.logInUpButton.isHidden = true
                
                strongSelf.emailTextField.resignFirstResponder()
                strongSelf.passTextField.resignFirstResponder()
                
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                let VC = storyBoard.instantiateViewController(withIdentifier: "HomeScreenViewController") as! HomeScreenViewController
                VC.modalPresentationStyle = .fullScreen
                strongSelf.present(VC, animated: true)
            }
            
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in
            
        }))
        
        present(alert, animated: true)
        
    }
    

}

