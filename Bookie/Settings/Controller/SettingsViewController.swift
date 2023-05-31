//
//  SettingsViewController.swift
//  Bookie
//
//  Created by newAccount on 31.05.2023.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureVIew()
        
    }
    
    
    private func configureVIew(){
        view.backgroundColor = .customLightGrey
        tableView.backgroundColor = .customDarkGrey
    }
    


}


extension SettingsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}

extension SettingsViewController: UITableViewDelegate{
    
}
