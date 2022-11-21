//
//  ButtonProgramaticallyVC.swift
//  Basic
//
//  Created by Cumulations Technologies Private Limited on 20/11/22.
//

import UIKit

class ButtonProgramaticallyVC: UIViewController {

    @IBOutlet weak var backView: UIView!
    var count = 0
    let countBtn : UIButton = {
        let button                = UIButton()
        button.backgroundColor    = UIColor.white
        button.titleLabel?.font   = UIFont(name: "Sono-Regular", size: 14)
        button.setTitleColor(UIColor.black, for: .normal)
        button.setTitle("Tap me to count", for: .normal)
        return button
    }()
    
    let tapCountLabel : UILabel = {
        let label               = UILabel()
        label.text              = "Hey you tapped me 0 times"
        label.textColor         = UIColor.black
        label.font              = UIFont(name: "Sono-Regular", size: 14)
        label.textAlignment     = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        backView.addSubview(countBtn)
        backView.addSubview(tapCountLabel)
        countBtn.addTarget(self, action: #selector(countBtnTapped), for: .touchUpInside)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        countBtn.frame = CGRect(x: 20, y: 20, width: backView.width - 40, height: 30)
        tapCountLabel.frame = CGRect(x: countBtn.left, y: countBtn.bottom + 20, width: countBtn.width, height: countBtn.height)
    }
    @objc func countBtnTapped(){
       count += 1
        tapCountLabel.text = "Hey you tappedme \(String(count)) times"
    }

    @IBAction func backButton(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let VC = storyBoard.instantiateViewController(withIdentifier: "HomeScreenViewController") as! HomeScreenViewController
        VC.modalPresentationStyle = .fullScreen
        present(VC, animated: false)
    }
   

}
