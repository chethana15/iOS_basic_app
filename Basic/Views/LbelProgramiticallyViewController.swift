//
//  LbelProgramiticallyViewController.swift
//  Basic
//
//  Created by Cumulations Technologies Private Limited on 20/11/22.
//

import UIKit

class LbelProgramiticallyViewController: UIViewController {

    @IBOutlet weak var viewToAddLabel: UIView!
    @IBOutlet weak var homeBtn: UIButton!
    
    let label1 : UILabel = {
        let label = UILabel()
        label.text = "Hey I'm plain label :)"
        label.font = UIFont(name: "Sono-Regular", size: 14)
        return label
    }()
    
    let label3 : UILabel = {
        let label = UILabel()
        label.text = "Label with background color"
        label.font = UIFont(name: "Sono-Regular", size: 14)
        label.layer.backgroundColor = UIColor.appColors(colorName: .appRadiumColor)?.cgColor
        return label
    }()
    
    let label4 : UILabel = {
        let label = UILabel()
        label.text = "Label with cornerRadius"
        label.font = UIFont(name: "Sono-Regular", size: 14)
        label.layer.cornerRadius = 15
        label.layer.backgroundColor = UIColor.white.cgColor
        return label
    }()
    
    let label5 : UILabel = {
        let label = UILabel()
        label.text = "Label with insets"
        label.font = UIFont(name: "Sono-Regular", size: 14)
        label.layer.cornerRadius = 15
        label.layer.backgroundColor = UIColor.white.cgColor
        return label
    }()
    
    let label6 : UILabel = {
        let label = UILabel()
        label.text = "Label with border"
        label.font = UIFont(name: "Sono-Regular", size: 14)
        label.layer.backgroundColor = UIColor.white.cgColor
        label.layer.borderWidth = 1
        label.textAlignment = .center
        label.layer.borderColor = UIColor.black.cgColor
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        viewToAddLabel.addSubview(label1)
        viewToAddLabel.addSubview(label3)
        viewToAddLabel.addSubview(label4)
        viewToAddLabel.addSubview(label5)
        viewToAddLabel.addSubview(label6)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        label1.frame = CGRect(x: 20, y: 30, width: viewToAddLabel.width - 40, height: 30)
        label3.frame = CGRect(x: label1.left, y: label1.bottom + 20, width: label1.width, height: label1.height)
        label4.frame = CGRect(x: label1.left, y: label3.bottom + 20, width: label1.width, height: label1.height)
        label5.frame = CGRect(x: label1.left, y: label4.bottom + 20, width: label1.width, height: label1.height)
        label6.frame = CGRect(x: label1.left, y: label5.bottom + 20, width: label1.width, height: label1.height)

    }
    
    @IBAction func homeBtnTapped(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let VC = storyBoard.instantiateViewController(withIdentifier: "HomeScreenViewController") as! HomeScreenViewController
        VC.modalPresentationStyle = .fullScreen
        present(VC, animated: false)
    }
    

}


