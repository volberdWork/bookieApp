//
//  LineUpViewController.swift
//  Bookie
//
//  Created by newAccount on 07.06.2023.
//

import UIKit

class LineUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
        
    }
    
    private func configureView(){
//        tableView.backgroundColor = .customDarkGrey
        self.view.backgroundColor = .customLightGrey
        self.title = "Line Up"
    }

}
