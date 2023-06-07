//
//  PreferredViewController.swift
//  Bookie
//
//  Created by newAccount on 05.06.2023.
//

import UIKit

class PreferredViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }
    
    private func configureView(){
        view.backgroundColor = .customLightGrey
        
        let upcomingCellNib = UINib(nibName: "CurrentCollectionViewCell", bundle: nil)
        collectionView.register(upcomingCellNib, forCellWithReuseIdentifier: "CurrentCollectionViewCell")
        
        collectionView.backgroundColor = .customDarkGrey
    }

}

extension PreferredViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CurrentCollectionViewCell", for: indexPath) as! CurrentCollectionViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear
        return headerView
    }
}

extension PreferredViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.size.width - 32
        let height: CGFloat = 150
        return CGSize(width: width, height: height)
    }
    
   
}
