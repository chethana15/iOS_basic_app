//
//  SliderProgrammaticallyVC.swift
//  Basic
//
//  Created by Cumulations Technologies Private Limited on 20/11/22.
//

import UIKit

class SliderProgrammaticallyVC: UIViewController {



    let mySlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 120
        slider.isContinuous = true
        slider.tintColor = UIColor.black
        return slider
    }()
    
    let ballFacingLabel : UILabel = {
        let label               = UILabel()
        label.text              = "Label"
        label.textColor         = UIColor.black
        label.font              = UIFont(name: "Sono-Regular", size: 14)
        label.textAlignment     = .center
        label.backgroundColor = UIColor.white
        return label
    }()
    let ballsLeftLabel : UILabel = {
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

        
       
        view.addSubview(mySlider)
        view.addSubview(ballFacingLabel)
        view.addSubview(ballsLeftLabel)
        mySlider.addTarget(self, action: #selector(self.sliderValueDidChange(_ :)), for: .valueChanged)
       
    }
    override func viewDidLayoutSubviews() {
        
        
        ballFacingLabel.frame = CGRect(x: 20, y: 80, width: view.width - 40, height: 30)
        mySlider.frame = CGRect(x: ballFacingLabel.left, y:ballFacingLabel.bottom + 30, width: ballFacingLabel.width, height: 40)
        ballsLeftLabel.frame = CGRect(x: mySlider.left, y: mySlider.bottom + 20, width: mySlider.width, height: 30)
    }
    @objc func sliderValueDidChange(_ sender:UISlider){
            print("slider is moved")
            
            let number0fBalls = round(sender.value / 1) * 1
            sender.value = number0fBalls
            
            ballFacingLabel.text =  "now batsman is facing \(Int(number0fBalls)) ball"
            
            let numberOfBallsLeft = Int(120 - number0fBalls)
            
        ballsLeftLabel.text = "Team is left with \(numberOfBallsLeft) balls"
        }

    @IBAction func backButtonTapped(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let VC = storyBoard.instantiateViewController(withIdentifier: "HomeScreenViewController") as! HomeScreenViewController
        VC.modalPresentationStyle = .fullScreen
        present(VC, animated: false)
    }
}
