//
//  ActivityIndicatorProgrammaticallyVC.swift
//  Basic
//
//  Created by Cumulations Technologies Private Limited on 20/11/22.
//

import UIKit

class ActivityIndicatorProgrammaticallyVC: UIViewController {

    let activityIndicator : UIActivityIndicatorView = {
        let actIndicator = UIActivityIndicatorView(style: .medium)
        actIndicator.color = .black
        return actIndicator
    }()
    var stop = 0
    let stopOrStartButton : UIButton = {
        let button                = UIButton()
        button.backgroundColor    = UIColor.appColors(colorName: .labelGreen)
        button.titleLabel?.font   = UIFont(name: "Sono-Bold", size: 16)
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitle("Start", for: .normal)
        return button
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addSubview(activityIndicator)
        view.addSubview(stopOrStartButton)
        stopOrStartButton.addTarget(self, action: #selector(startOrStopBtnTapped), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicator.frame = CGRect(x: view.center.x-40, y: 80, width: 80, height: 80)
        stopOrStartButton.frame = CGRect(x: view.center.x-40, y: activityIndicator.bottom + 30, width: 100, height: 30)
    }
    @objc func startOrStopBtnTapped(){
        if stop == 0{
            stop = 1
            activityIndicator.startAnimating()
            stopOrStartButton.setTitle("Stop", for: .normal)
        }else{
            stop = 0
            activityIndicator.stopAnimating()
            stopOrStartButton.setTitle("Start", for: .normal)
        }
    }
    @IBAction func backButtonTapped(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let VC = storyBoard.instantiateViewController(withIdentifier: "HomeScreenViewController") as! HomeScreenViewController
        VC.modalPresentationStyle = .fullScreen
        present(VC, animated: false)
    }
    

}
