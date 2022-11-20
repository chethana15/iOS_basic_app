//
//  HomeScreenViewController.swift
//  Basic
//
//  Created by Cumulations Technologies Private Limited on 20/11/22.
//

import UIKit
import FirebaseAuth

class HomeScreenViewController: UIViewController {

    @IBOutlet weak var signOutBtn: UIButton!
    override func loadView() {
        super.loadView()
        print("loadView-2")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("viewdidload-2")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear-2")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear-2")

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear-2")

    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear-2")

    }
    deinit{
       //we can clean up any memory or we can nill out the variables
    
    }
 
    @IBAction func signOutBtnTapped(_ sender: Any) {
        do{
            try FirebaseAuth.Auth.auth().signOut()
            let userdefaults = UserDefaults.standard
            userdefaults.set(false, forKey: "logIn")
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let VC = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            VC.modalPresentationStyle = .fullScreen
            self.present(VC, animated: false)
        }catch{
            let errorAlert = UIAlertController(title: "Alert", message: "Failed to sign out", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .cancel)
            errorAlert.addAction(action)
            self.present(errorAlert, animated: false)
        }
        
    }
    
}
