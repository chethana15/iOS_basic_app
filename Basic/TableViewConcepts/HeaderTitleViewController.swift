//
//  HeaderTitleViewController.swift
//  Basic
//
//  Created by Cumulations Technologies Private Limited on 20/11/22.
//

import UIKit

class HeaderTitleViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var addNamesBtn: UIButton!
    @IBOutlet weak var namesTextField: UITextField!
    
    var namesArray = ["Jeevan", "Chethana", "Sagar", "Sahana", "Anusha", "Tusha", "Tanvi"]
    var nameDictionary = [String:[String]]()
    struct namesSorted{
        var sectionTitle : String!
        var namesAccToSectionTitle : [String]!
    }
    var nameObjectArray = [namesSorted]()
    var keys = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nameDictionary = getAlfabetsAndNames(nameArray: namesArray)
        keys = nameDictionary.keys.sorted()
        
        for (key, value) in nameDictionary.sorted(by: {$0.0 < $1.0})  {
            print("key-->\(key), value:\(value)")
            nameObjectArray.append(namesSorted(sectionTitle: key, namesAccToSectionTitle: value))
        }
        self.hideKeyboardWhenTappedAround()
    }
    
    @IBAction func backButton(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let VC = storyBoard.instantiateViewController(withIdentifier: "HomeScreenViewController") as! HomeScreenViewController
        VC.modalPresentationStyle = .fullScreen
        present(VC, animated: false)
    }
    
    @IBAction func addNamesTapped(_ sender: Any) {
        var newName = namesTextField.text
        if(newName==""){
            let alert = UIAlertController(title: "Alert", message: "Please enter a valid name", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .cancel)
            alert.addAction(action)
            self.present(alert, animated: false)
        }else{
            newName = newName?.firstCapitalized
            namesArray.append(newName!)
            nameDictionary = getAlfabetsAndNames(nameArray: namesArray)
            nameObjectArray.removeAll()
            for (key, value) in nameDictionary.sorted(by: {$0.0 < $1.0})  {
                print("key-->\(key), value:\(value)")
                nameObjectArray.append(namesSorted(sectionTitle: key, namesAccToSectionTitle: value))
            }
            tableview.reloadData()
            
        }
        namesTextField.text = ""
    }
    func getAlfabetsAndNames(nameArray: [String])->[String:[String]]{
        
        var finalNameDict = [String:[String]]()
        for name in nameArray.sorted(){
            var nameStrings = [String]()
            let alfabet = String(name.first!)
            
            if(finalNameDict[alfabet]==nil){
                nameStrings.append(name)
                finalNameDict[alfabet] = nameStrings
            }else{
                nameStrings = finalNameDict[alfabet]!
                nameStrings.append(name)
                let nameStringsSorted = nameStrings.sorted()
                finalNameDict[alfabet] = nameStringsSorted
            }
            
            
        }
        return finalNameDict
    }
    
}
extension HeaderTitleViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        nameObjectArray.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        nameObjectArray[section].sectionTitle
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        nameObjectArray[section].namesAccToSectionTitle.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HeaderTitleTVCell
        cell.nameLabel.text = nameObjectArray[indexPath.section].namesAccToSectionTitle[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        keys
    }
 
}

class HeaderTitleTVCell: UITableViewCell{
    @IBOutlet weak var nameLabel: CustomLabel!
    
}
