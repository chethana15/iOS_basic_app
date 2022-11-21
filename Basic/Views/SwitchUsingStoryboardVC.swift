//
//  SwitchUsingStoryboardVC.swift
//  Basic
//
//  Created by Cumulations Technologies Private Limited on 20/11/22.
//

import UIKit

class SwitchUsingStoryboardVC: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var mySwitch: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func switchTapped(_ sender: UISwitch) {
        if (sender.isOn == true)
        {
            label.text = "switch is on"
        }
        else{
            label.text = "switch is off"
        }
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let VC = storyBoard.instantiateViewController(withIdentifier: "HomeScreenViewController") as! HomeScreenViewController
        VC.modalPresentationStyle = .fullScreen
        present(VC, animated: false)
    }
    
}
