//
//  TermsViewController.swift
//  Bookie
//
//  Created by newAccount on 31.05.2023.
//

import UIKit

class TermsViewController: UIViewController {

    @IBOutlet var termstextView: UITextView!
    
    var vc = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
       
    }
    
    private func configureView(){
        view.backgroundColor = .customLightGrey
        termstextView.backgroundColor = .customDarkGrey
        termstextView.textColor = .white
        termstextView.textAlignment = .center
        
        
        
        if vc == "terms"{
            self.title = "Terms"
            termstextView.text = ""
            self.navigationItem.backButtonTitle = "Menu"
        } else {
            self.title = "Privacy Policy"
            termstextView.text = ""
        }
    }


}
