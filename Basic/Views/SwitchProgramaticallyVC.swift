//
//  SwitchProgramaticallyVC.swift
//  Basic
//
//  Created by Cumulations Technologies Private Limited on 20/11/22.
//

import UIKit

class SwitchProgramaticallyVC: UIViewController {

    let mySwitch : UISwitch = {
        let mySwitch = UISwitch()
        mySwitch.setOn(true, animated: false)
        mySwitch.onImage = UIImage(named: "on-switch")
        mySwitch.offImage = UIImage(named: "off-switch")
        mySwitch.onTintColor = .black
        return mySwitch
    }()
    let showTextLabel : UILabel = {
        let label               = UILabel()
        label.text              = "Label"
        label.textColor         = UIColor.black
        label.font              = UIFont(name: "Sono-Regular", size: 14)
        label.textAlignment     = .center
        label.backgroundColor = UIColor.white
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
             
              
        view.addSubview(mySwitch)
        view.addSubview(showTextLabel)
        mySwitch.addTarget(self, action: #selector(switchStateDidChange), for: .touchUpInside)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mySwitch.frame = CGRect(x: 0, y: 80, width: 60, height: 40)
        mySwitch.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mySwitch.center = self.view.center
        showTextLabel.frame = CGRect(x:20, y: mySwitch.bottom + 30, width: view.width - 40, height: 30)
    }
    @objc func switchStateDidChange(_ sender:UISwitch){
           if (sender.isOn == true)
           {
               showTextLabel.text = "switch is on"
           }
           else{
               showTextLabel.text = "switch is off"
           }
       }

    @IBAction func backButtonTapped(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let VC = storyBoard.instantiateViewController(withIdentifier: "HomeScreenViewController") as! HomeScreenViewController
        VC.modalPresentationStyle = .fullScreen
        present(VC, animated: false)
    }
    
}
