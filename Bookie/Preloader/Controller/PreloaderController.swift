//
//  ViewController.swift
//  Bookie
//
//  Created by newAccount on 29.05.2023.
//

import UIKit

class PreloaderController: UIViewController {

    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        registerCell()
        configureView()
    }
    
    private func configureView(){
        view.backgroundColor = .customDarkGrey
        
        collectionView.backgroundColor = .clear
    }
    
    private func registerCell(){
        
    }


}

extension PreloaderController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    
}

extension PreloaderController: UICollectionViewDelegate{
    
}

