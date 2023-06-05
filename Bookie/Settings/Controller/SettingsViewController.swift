//
//  SettingsViewController.swift
//  Bookie
//
//  Created by newAccount on 31.05.2023.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    
    var settingsList = SettingsList.getSettingsList()

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
        
        tableView.register(UINib(nibName: "SettingsTableViewCell", bundle: nil), forCellReuseIdentifier: "SettingsTableViewCell")
        
        tableView.backgroundColor = .customDarkGrey
        
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
        return settingsList.count
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsTableViewCell", for: indexPath) as! SettingsTableViewCell

        
        return cell
    }
    
    
    
    
}

extension SettingsViewController: UITableViewDelegate{
    
    
}
