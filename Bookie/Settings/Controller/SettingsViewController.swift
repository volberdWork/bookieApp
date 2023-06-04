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
        let backButton = UIBarButtonItem()
        backButton.title = "Menu"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        
    }
    
    private func openTermsScreen(text: String){
        let main = UIStoryboard(name: "Main", bundle: nil)
        if let vc = main.instantiateViewController(withIdentifier: "TermsViewController") as? TermsViewController {
            navigationController?.pushViewController(vc, animated: true)
        }
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
