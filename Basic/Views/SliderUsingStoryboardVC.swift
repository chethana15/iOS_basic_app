//
//  SliderUsingStoryboardVC.swift
//  Basic
//
//  Created by Cumulations Technologies Private Limited on 20/11/22.
//

import UIKit

class SliderUsingStoryboardVC: UIViewController {

    @IBOutlet weak var ballsLeftSliderLabel: UILabel!
    @IBOutlet weak var mySlider: UISlider!
    @IBOutlet weak var ballFacingLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        mySlider.minimumValue = 0
        mySlider.maximumValue = 100
        
    }
    @IBAction func sliderSliding(_ sender: UISlider) {
        let currentValue = Int(sender.value)
        let ballsLeft = Int(mySlider.maximumValue) - currentValue
        ballsLeftSliderLabel.text = "Team is left with \(ballsLeft) balls"
        ballFacingLabel.text = "now batsman is facing \(currentValue) ball"
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let VC = storyBoard.instantiateViewController(withIdentifier: "HomeScreenViewController") as! HomeScreenViewController
        VC.modalPresentationStyle = .fullScreen
        present(VC, animated: false)
    }
    


}
