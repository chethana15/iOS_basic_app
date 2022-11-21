//
//  TextFieldUsingStoryBoardVC.swift
//  Basic
//
//  Created by Cumulations Technologies Private Limited on 20/11/22.
//

import UIKit

class TextFieldUsingStoryBoardVC: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        textField.keyboardType = .default
        textField.leftViewMode = .always
        textField.leftView = UIView(frame:  CGRect(x: 0, y: 0, width: 15, height: 0))
        textField.autocorrectionType = .no
        self.hideKeyboardWhenTappedAround()
    }
    
    @IBAction func displayOnLabelBtn(_ sender: Any) {
        label.text = textField.text
    }
    @IBAction func backButton(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let VC = storyBoard.instantiateViewController(withIdentifier: "HomeScreenViewController") as! HomeScreenViewController
        VC.modalPresentationStyle = .fullScreen
        present(VC, animated: false)
    }
    

}
