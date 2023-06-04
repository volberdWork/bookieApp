//
//  MainViewController.swift
//  Bookie
//
//  Created by newAccount on 30.05.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet var conteinerView: UIView!
    
    @IBOutlet var upcomingCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureCollectionViews()
        
    }
    
    private func configureView(){
        conteinerView.backgroundColor = .customDarkGrey
        view.backgroundColor = .customLightGrey
        
    }
    
    
    private func configureCollectionViews(){
        
        let upcomingCellNib = UINib(nibName: "UpcomingCollectionViewCell", bundle: nil)
        upcomingCollectionView.register(upcomingCellNib, forCellWithReuseIdentifier: "UpcomingCollectionViewCell")
        upcomingCollectionView.backgroundColor = .customDarkGrey
    }
    
}


extension MainViewController : UICollectionViewDelegate{
    
}

extension MainViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = upcomingCollectionView.dequeueReusableCell(withReuseIdentifier: "UpcomingCollectionViewCell", for: indexPath) as! UpcomingCollectionViewCell
        
        return cell
        
    }
    
    
}


extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = upcomingCollectionView.frame.size.width * 0.8
        let height: CGFloat = upcomingCollectionView.frame.size.height * 0.7
        return CGSize(width: width, height: height)
        
    }
}
