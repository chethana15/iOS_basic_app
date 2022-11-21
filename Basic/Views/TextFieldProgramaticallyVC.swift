//
//  TextFieldProgramaticallyVC.swift
//  Basic
//
//  Created by Cumulations Technologies Private Limited on 20/11/22.
//

import UIKit

class TextFieldProgramaticallyVC: UIViewController {

    let myTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter text here"
        textField.font = UIFont(name: "Sono-Regular", size: 14)
        textField.layer.backgroundColor = UIColor.white.cgColor
        textField.textAlignment = .center
        textField.keyboardType = .default
        textField.autocorrectionType = .no
        return textField
    }()
    let buttonTextFieldView : UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    let sendButton : UIButton = {
        let button = UIButton()
        button.setTitle("Send", for: .normal)
        button.setBackgroundImage(UIImage(named: "paperplane.fill"), for: .normal)
        button.currentBackgroundImage?.withTintColor(UIColor.black)
        button.setTitleColor(UIColor.white, for: .normal)
        return button
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
        
//        view.addSubview(buttonTextFieldView)
//        buttonTextFieldView.addSubview(myTextField)
//        buttonTextFieldView.addSubview(sendButton)
        view.addSubview(showTextLabel)
        view.addSubview(myTextField)
        view.addSubview(sendButton)
        sendButton.addTarget(self, action: #selector(didTapSendButton), for: .touchUpInside)
        myTextField.becomeFirstResponder()
        self.hideKeyboardWhenTappedAround()
    }
    @objc func didTapSendButton(){
        print("button tapped")
        showTextLabel.text = myTextField.text
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
//        buttonTextFieldView.frame = CGRect(x: 0, y: 50, width: view.width, height: 40)
        myTextField.frame = CGRect(x: 20, y: 80, width: view.width-100, height: 40)
        sendButton.frame = CGRect(x: myTextField.right + 10, y: myTextField.top, width: 50, height: myTextField.height)
        showTextLabel.frame = CGRect(x: 20, y: myTextField.bottom + 40, width: view.width - 40, height: 30)
       
    }

    @IBAction func backButtonTapped(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let VC = storyBoard.instantiateViewController(withIdentifier: "HomeScreenViewController") as! HomeScreenViewController
        VC.modalPresentationStyle = .fullScreen
        present(VC, animated: false)
    }
    
}
