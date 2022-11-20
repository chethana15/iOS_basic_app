//
//  AppCustomLabel.swift
//  Basic
//
//  Created by Cumulations Technologies Private Limited on 20/11/22.
//

import UIKit

@IBDesignable class CustomLabel: UILabel {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    //MARK: Insects for label
    @IBInspectable var topInset: CGFloat = 0.0
    @IBInspectable var bottomInset: CGFloat = 0.0
    @IBInspectable var leftInset: CGFloat = 0.0
    @IBInspectable var rightInset: CGFloat = 0.0
    
    override func draw(_ rect: CGRect) {
        let inset = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: rect.inset(by: inset))
    }
    
    //MARK: CornerRadius for label
    @IBInspectable var cornerRadius: CGFloat {
           get {
               return layer.cornerRadius
           }
           set {
               layer.masksToBounds = newValue > 0
               layer.cornerRadius = newValue
           }
       }

       override func prepareForInterfaceBuilder() {
           super.prepareForInterfaceBuilder()
           setNeedsDisplay()
       }
    
    //MARK: BORDER COLOR FOR LABEL
    @IBInspectable var borderColor : UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    //MARK: BORDERWIDTH FOR LABEL
    @IBInspectable var borderWidth : CGFloat = 0{
        didSet{
            layer.borderWidth = borderWidth
        }
    }

}

