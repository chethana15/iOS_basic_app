//
//  HardCodedArrayVC.swift
//  Basic
//
//  Created by Cumulations Technologies Private Limited on 20/11/22.
//

import UIKit

class HardCodedArrayVC: UIViewController {

    @IBOutlet weak var sortedBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var names = ["Jeevan", "Chethana", "Sagar", "Sahana", "Anusha", "Tusha", "Tanvi"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.reloadData()
    }

    @IBAction func sortButtonTapped(_ sender: Any) {
        
        names = names.sorted()
        tableView.reloadData()
        
    }
    @IBAction func backButtonTapped(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let VC = storyBoard.instantiateViewController(withIdentifier: "HomeScreenViewController") as! HomeScreenViewController
        VC.modalPresentationStyle = .fullScreen
        present(VC, animated: false)
    }
    
}
extension HardCodedArrayVC : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        names.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HardCodedArrayCell", for: indexPath)
        cell.textLabel?.text = names[indexPath.row]
        return cell
    }
}
