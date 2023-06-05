//
//  ProfileViewController.swift
//  Bookie
//
//  Created by newAccount on 05.06.2023.
//

import UIKit

class ProfileViewController: UIViewController {

   
    
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

       configureView()
    }
    
    private func configureView(){
        
    }
    

}

extension ProfileViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}


