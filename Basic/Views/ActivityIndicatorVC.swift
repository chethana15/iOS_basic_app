//
//  ActivityIndicatorVC.swift
//  Basic
//
//  Created by Cumulations Technologies Private Limited on 20/11/22.
//

import UIKit

class ActivityIndicatorVC: UIViewController {
    var stop = 0
    @IBOutlet weak var startStopBtn: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func startStopButtnTaped(_ sender: Any){
        if stop == 0{
            stop = 1
            activityIndicator.startAnimating()
            startStopBtn.setTitle("Stop", for: .normal)
        }else{
            stop = 0
            activityIndicator.stopAnimating()
            startStopBtn.setTitle("Start", for: .normal)
        }
    }
    
    @IBAction func backBtnTapped(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let VC = storyBoard.instantiateViewController(withIdentifier: "HomeScreenViewController") as! HomeScreenViewController
        VC.modalPresentationStyle = .fullScreen
        present(VC, animated: false)
    }
    

}
