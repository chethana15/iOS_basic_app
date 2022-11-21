//
//  HomeScreenViewController.swift
//  Basic
//
//  Created by Cumulations Technologies Private Limited on 20/11/22.
//

import UIKit
import FirebaseAuth

class HomeScreenViewController: UIViewController {

    
    let topics = ["Label using storyboard","Label programmatically","Button using storyboard","Button programmatically","TextField Using StoryBoard","TextField programmatically","TextView Using StoryBoard","TextView programmatically","Switch Using Storyboard","Switch programmatically","Slider Using Storyboard","Slider programmatically","Activity Indicator using storyboard","Activity indicator programmatically","Hard coded array", "Insert or delete names", "Names acc. to Alfabets"]
    
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

extension HomeScreenViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        topics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = topics[indexPath.row]
//        cell.textLabel?.text.font = UIFont(name: "Sono-Regular", size: 14)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        
        switch(indexPath.row){
            
        case 0:
            let storyBoard = UIStoryboard(name: "Views", bundle: nil)
            let VC = storyBoard.instantiateViewController(withIdentifier: "LabelUsingStoryBoardVC") as! LabelUsingStoryBoardVC
            VC.modalPresentationStyle = .fullScreen
            present(VC, animated: false)
            
        case 1:
            let storyBoard = UIStoryboard(name: "Views", bundle: nil)
            let VC = storyBoard.instantiateViewController(withIdentifier: "LbelProgramiticallyViewController") as! LbelProgramiticallyViewController
            VC.modalPresentationStyle = .fullScreen
            present(VC, animated: false)
            
        case 2:
            let storyBoard = UIStoryboard(name: "Views", bundle: nil)
            let VC = storyBoard.instantiateViewController(withIdentifier: "ButtonUsingStoryBoardVC") as! ButtonUsingStoryBoardVC
            VC.modalPresentationStyle = .fullScreen
            present(VC, animated: false)
            
        case 3:
            let storyBoard = UIStoryboard(name: "Views", bundle: nil)
            let VC = storyBoard.instantiateViewController(withIdentifier: "ButtonProgramaticallyVC") as! ButtonProgramaticallyVC
            VC.modalPresentationStyle = .fullScreen
            present(VC, animated: false)
            
        case 4:
            let storyBoard = UIStoryboard(name: "Views", bundle: nil)
            let VC = storyBoard.instantiateViewController(withIdentifier: "TextFieldUsingStoryBoardVC") as! TextFieldUsingStoryBoardVC
            VC.modalPresentationStyle = .fullScreen
            present(VC, animated: false)
            
        case 5:
            let storyBoard = UIStoryboard(name: "Views", bundle: nil)
            let VC = storyBoard.instantiateViewController(withIdentifier: "TextFieldProgramaticallyVC") as! TextFieldProgramaticallyVC
            VC.modalPresentationStyle = .fullScreen
            present(VC, animated: false)
            
        case 6:
            let storyBoard = UIStoryboard(name: "Views", bundle: nil)
            let VC = storyBoard.instantiateViewController(withIdentifier: "TextViewUsingStoryBoardVC") as! TextViewUsingStoryBoardVC
            VC.modalPresentationStyle = .fullScreen
            present(VC, animated: false)
            
        case 7:
            let storyBoard = UIStoryboard(name: "Views", bundle: nil)
            let VC = storyBoard.instantiateViewController(withIdentifier: "TextViewProgramaticallyVC") as! TextViewProgramaticallyVC
            VC.modalPresentationStyle = .fullScreen
            present(VC, animated: false)
            
        case 8:
            let storyBoard = UIStoryboard(name: "Views", bundle: nil)
            let VC = storyBoard.instantiateViewController(withIdentifier: "SwitchUsingStoryboardVC") as! SwitchUsingStoryboardVC
            VC.modalPresentationStyle = .fullScreen
            present(VC, animated: false)
            
        case 9:
            let storyBoard = UIStoryboard(name: "Views", bundle: nil)
            let VC = storyBoard.instantiateViewController(withIdentifier: "SwitchProgramaticallyVC") as! SwitchProgramaticallyVC
            VC.modalPresentationStyle = .fullScreen
            present(VC, animated: false)
            
        case 10:
            let storyBoard = UIStoryboard(name: "Views", bundle: nil)
            let VC = storyBoard.instantiateViewController(withIdentifier: "SliderUsingStoryboardVC") as! SliderUsingStoryboardVC
            VC.modalPresentationStyle = .fullScreen
            present(VC, animated: false)
            
        case 11:
            let storyBoard = UIStoryboard(name: "Views", bundle: nil)
            let VC = storyBoard.instantiateViewController(withIdentifier: "SliderProgrammaticallyVC") as! SliderProgrammaticallyVC
            VC.modalPresentationStyle = .fullScreen
            present(VC, animated: false)
            
        case 12:
            let storyBoard = UIStoryboard(name: "Views", bundle: nil)
            let VC = storyBoard.instantiateViewController(withIdentifier: "ActivityIndicatorVC") as! ActivityIndicatorVC
            VC.modalPresentationStyle = .fullScreen
            present(VC, animated: false)
            
        case 13:
            let storyBoard = UIStoryboard(name: "Views", bundle: nil)
            let VC = storyBoard.instantiateViewController(withIdentifier: "ActivityIndicatorProgrammaticallyVC") as! ActivityIndicatorProgrammaticallyVC
            VC.modalPresentationStyle = .fullScreen
            present(VC, animated: false)
            
        case 14:
            let storyBoard = UIStoryboard(name: "TableViewConcepts", bundle: nil)
            let VC = storyBoard.instantiateViewController(withIdentifier: "HardCodedArrayVC") as! HardCodedArrayVC
            VC.modalPresentationStyle = .fullScreen
            present(VC, animated: false)
            
        case 15:
            let storyBoard = UIStoryboard(name: "TableViewConcepts", bundle: nil)
            let VC = storyBoard.instantiateViewController(withIdentifier: "InsertOrDeleteNameViewController") as! InsertOrDeleteNameViewController
            VC.modalPresentationStyle = .fullScreen
            present(VC, animated: false)
            
        case 16:
            let storyBoard = UIStoryboard(name: "TableViewConcepts", bundle: nil)
            let VC = storyBoard.instantiateViewController(withIdentifier: "HeaderTitleViewController") as! HeaderTitleViewController
            VC.modalPresentationStyle = .fullScreen
            present(VC, animated: false)
            
        default:
            
            break
        }
    }
}
