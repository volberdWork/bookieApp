//
//  MainViewController.swift
//  Bookie
//
//  Created by newAccount on 30.05.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet var liveCollectionView: UICollectionView!
    @IBOutlet var conteinerView: UIView!
    
    @IBOutlet var finishCollectionView: UICollectionView!
    @IBOutlet var finishedLabel: UILabel!
    @IBOutlet var liveLabel: UILabel!
    @IBOutlet var upComingLabel: UILabel!
    @IBOutlet var upcomingCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureCollectionViews()
        
    }
    
    private func configureView(){
        conteinerView.backgroundColor = .customDarkGrey
        view.backgroundColor = .customLightGrey
        
        upComingLabel.text = "UPCOMING"
        upComingLabel.font = .displayFont(ofSize: 21, fontType: .SFBold)
        upComingLabel.textColor = .white
        
        liveLabel.text = "LIVE"
        liveLabel.font = .displayFont(ofSize: 21, fontType: .SFBold)
        liveLabel.textColor = .white
        
        finishedLabel.text = "FINISHED"
        finishedLabel.font = .displayFont(ofSize: 21, fontType: .SFBold)
        finishedLabel.textColor = .white
    }
    
    
    private func configureCollectionViews(){
        
        let upcomingCellNib = UINib(nibName: "UpcomingCollectionViewCell", bundle: nil)
        upcomingCollectionView.register(upcomingCellNib, forCellWithReuseIdentifier: "UpcomingCollectionViewCell")
        upcomingCollectionView.backgroundColor = .customDarkGrey
        
        let liveCellNib = UINib(nibName: "CurrentCollectionViewCell", bundle: nil)
        liveCollectionView.register(liveCellNib, forCellWithReuseIdentifier: "CurrentCollectionViewCell")
        
        finishCollectionView.register(liveCellNib, forCellWithReuseIdentifier: "CurrentCollectionViewCell")
        
        
        
        
        upcomingCollectionView.backgroundColor = .customDarkGrey
        liveCollectionView.backgroundColor = .customDarkGrey
        finishCollectionView.backgroundColor = .customDarkGrey
    }
    
    @IBAction func upConingButtonPressed(_ sender: UIButton) {
        
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
        let height: CGFloat = upcomingCollectionView.frame.size.height * 0.9
        return CGSize(width: width, height: height)
    }
    
   
}



