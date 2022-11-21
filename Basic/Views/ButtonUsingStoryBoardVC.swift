//
//  ButtonUsingStoryBoardVC.swift
//  Basic
//
//  Created by Cumulations Technologies Private Limited on 20/11/22.
//

import UIKit

class ButtonUsingStoryBoardVC: UIViewController {

    @IBOutlet weak var tapsCountLabel: UILabel!
    @IBOutlet weak var tapsCountBtn: UIButton!
    var taps = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let VC = storyBoard.instantiateViewController(withIdentifier: "HomeScreenViewController") as! HomeScreenViewController
        VC.modalPresentationStyle = .fullScreen
        present(VC, animated: false)
    }
    
    @IBAction func tapsCountButtonTapped(_ sender: Any) {
        taps += 1
        tapsCountLabel.text = "Hey you tapped me \(String(taps)) times"
    }
    
}
