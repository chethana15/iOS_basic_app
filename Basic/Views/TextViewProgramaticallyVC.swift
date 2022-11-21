//
//  TextViewProgramaticallyVC.swift
//  Basic
//
//  Created by Cumulations Technologies Private Limited on 20/11/22.
//

import UIKit

class TextViewProgramaticallyVC: UIViewController {

    let myTextView : UITextView = {
        let textView = UITextView()
        textView.text = """
UITextView supports the display of text using custom style information and also supports text editing. You typically use a text view to display multiple lines of text, such as when displaying the body of a large text document.
        This class supports multiple text styles through use of the attributedText property. (Styled text isn’t supported in versions of iOS earlier than iOS 6.) Setting a value for this property causes the text view to use the style information provided in the attributed string. You can still use the font, textColor, and textAlignment properties to set style attributes, but those properties apply to all of the text in the text view. It’s recommended that you use a text view—and not a UIWebView object—to display both plain and rich text in your app.
https://developer.apple.com/documentation/uikit/uitextview
"""
        textView.textAlignment = .justified
        textView.backgroundColor = .white
        textView.isEditable = false
        textView.dataDetectorTypes = UIDataDetectorTypes.link
        return textView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addSubview(myTextView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        myTextView.frame = CGRect(x: 10, y: 80, width: view.width - 20, height: view.height - 100)
    }
    @IBAction func backButtonTapped(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let VC = storyBoard.instantiateViewController(withIdentifier: "HomeScreenViewController") as! HomeScreenViewController
        VC.modalPresentationStyle = .fullScreen
        present(VC, animated: false)
    }
    
}
