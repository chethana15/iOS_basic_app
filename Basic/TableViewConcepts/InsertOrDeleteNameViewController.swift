//
//  InsertOrDeleteNameViewController.swift
//  Basic
//
//  Created by Cumulations Technologies Private Limited on 20/11/22.
//

import UIKit

class InsertOrDeleteNameViewController: UIViewController {

    @IBOutlet weak var addNamesButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var tableview: UITableView!
    
    var names = ["Jeevan", "Chethana", "Sagar", "Sahana", "Anusha", "Tusha", "Tanvi"]

    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
        names = names.sorted()
        nameTextField.keyboardAppearance = .dark
        nameTextField.autocapitalizationType = .words
        nameTextField.autocorrectionType = .no
        self.hideKeyboardWhenTappedAround()
    }

    @IBAction func addButtonTapped(_ sender: Any) {
        var newNameEntered = nameTextField.text
        if(newNameEntered==""){
            let alert = UIAlertController(title: "Alert", message: "Please enter valid name", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .cancel)
            alert.addAction(action)
            self.present(alert, animated: false)
        }else{
            newNameEntered = newNameEntered?.firstCapitalized
            names.append(newNameEntered!)
            names = names.sorted()
            tableview.reloadData()
            
        }
        nameTextField.text = ""
    }
    
    @IBAction func backButton(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let VC = storyBoard.instantiateViewController(withIdentifier: "HomeScreenViewController") as! HomeScreenViewController
        VC.modalPresentationStyle = .fullScreen
        present(VC, animated: false)

    }
    @objc func deleteButtonTapped(sender: UIButton){
        let deleteRow = sender.tag
        names.remove(at: deleteRow)
        tableview.reloadData()
    }
}
extension InsertOrDeleteNameViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        names.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! InsertOrDeleteNameTV
        cell.nameLabel.text = names[indexPath.row]
        cell.deleteButton.tag = indexPath.row
        cell.deleteButton.addTarget(self, action: #selector(deleteButtonTapped(sender: )), for: .touchUpInside)
        return cell
    }
}
class InsertOrDeleteNameTV: UITableViewCell{
    @IBOutlet weak var nameLabel: CustomLabel!
    
    @IBOutlet weak var deleteButton: UIButton!
}
