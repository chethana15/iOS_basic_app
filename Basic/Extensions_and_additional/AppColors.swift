//
//  AppColors.swift
//  Basic
//
//  Created by Cumulations Technologies Private Limited on 20/11/22.
//

import Foundation
import UIKit

enum AppColors{
    case labelGreen
    case appRadiumColor
}

extension UIColor{
    
    static func appColors(colorName: AppColors)->UIColor?{
        switch colorName{
        case .labelGreen:
            return UIColor(named: "appGreen")
            
            
        case .appRadiumColor:
            return UIColor(named: "appRadiumColor")
        }
    }
    
}
