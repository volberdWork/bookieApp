//
//  MainViewController.swift
//  Bookie
//
//  Created by newAccount on 30.05.2023.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet var conteinerView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
       
        
    }
    
    private func configureView(){
        conteinerView.backgroundColor = .customDarkGrey
        view.backgroundColor = .customLightGrey
   
    }
  
    
}
