//
//  AllEventsViewController.swift
//  Bookie
//
//  Created by newAccount on 06.06.2023.
//

import UIKit

class AllEventsViewController: UIViewController {

    var base:[Response] = []
    
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        registerCell()
    }

    private func configureView(){
        view.backgroundColor = .customLightGrey
        collectionView.backgroundColor = .customDarkGrey
    }

    private func registerCell(){
        let allCellNib = UINib(nibName: "AllEventsCollectionViewCell", bundle: nil)
        collectionView.register(allCellNib, forCellWithReuseIdentifier: "AllEventsCollectionViewCell")
    }

}

extension AllEventsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(indexPath.row)")
    }
}

extension AllEventsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return base.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AllEventsCollectionViewCell", for: indexPath) as! AllEventsCollectionViewCell
        cell.setupCell(model: base[indexPath.row])
        return cell
    }
}

extension AllEventsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.size.width - 32
        let height: CGFloat = 150
        return CGSize(width: width, height: height)
    }
    
   
}
