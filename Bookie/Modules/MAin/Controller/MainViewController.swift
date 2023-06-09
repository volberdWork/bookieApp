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
    
    let network = NetworkManager.shared
    
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
    
    private func openAllEventsScreen(){
        let main = UIStoryboard(name: "Main", bundle: nil)
        if let vc = main.instantiateViewController(withIdentifier: "AllEventsViewController") as? AllEventsViewController {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    private func openUpcomingScreen(){
        let main = UIStoryboard(name: "Main", bundle: nil)
        if let vc = main.instantiateViewController(withIdentifier: "UpcomingViewController") as? UpcomingViewController {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    private func configureCollectionViews(){
        
        let upcomingCellNib = UINib(nibName: "UpcomingCollectionViewCell", bundle: nil)
        upcomingCollectionView.register(upcomingCellNib, forCellWithReuseIdentifier: "UpcomingCollectionViewCell")
        upcomingCollectionView.backgroundColor = .customDarkGrey
        
        let liveCellNib = UINib(nibName: "CurrentCollectionViewCell", bundle: nil)
        liveCollectionView.register(liveCellNib, forCellWithReuseIdentifier: "CurrentCollectionViewCell")
        
        let finishCellNib = UINib(nibName: "CurrentCollectionViewCell", bundle: nil)
        finishCollectionView.register(finishCellNib, forCellWithReuseIdentifier: "CurrentCollectionViewCell")
        
        
        
        
        upcomingCollectionView.backgroundColor = .customDarkGrey
        liveCollectionView.backgroundColor = .customDarkGrey
        finishCollectionView.backgroundColor = .customDarkGrey
    }
    
    @IBAction func upConingButtonPressed(_ sender: UIButton) {
        openAllEventsScreen()
        
    }
    
    @IBAction func liveButtonPressed(_ sender: UIButton) {
        openAllEventsScreen()
    }
    
    
    @IBAction func finishButtonPressed(_ sender: UIButton) {
        
        openAllEventsScreen()
    }
    
   
}


extension MainViewController : UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//       openAllEventsScreen()
        openUpcomingScreen()
    }
}

extension MainViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case upcomingCollectionView : return 10
        case liveCollectionView : return 5
        case finishCollectionView : return 10
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        switch collectionView {
        case upcomingCollectionView :
            let cell = upcomingCollectionView.dequeueReusableCell(withReuseIdentifier: "UpcomingCollectionViewCell", for: indexPath) as! UpcomingCollectionViewCell
            
            return cell
        case liveCollectionView :
            let cell = liveCollectionView.dequeueReusableCell(withReuseIdentifier: "CurrentCollectionViewCell", for: indexPath) as! CurrentCollectionViewCell
            
            return cell
        case finishCollectionView :
            let cell = liveCollectionView.dequeueReusableCell(withReuseIdentifier: "CurrentCollectionViewCell", for: indexPath) as! CurrentCollectionViewCell
            
            return cell
        default:
            return UICollectionViewCell()
        }
    }
}


extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = upcomingCollectionView.frame.size.width * 0.8
        let height: CGFloat = upcomingCollectionView.frame.size.height * 0.9
        return CGSize(width: width, height: height)
    }
    
   
}



