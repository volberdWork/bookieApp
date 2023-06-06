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
        view.backgroundColor = .lightGray
        
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
}
