//
//  UpcomingViewController.swift
//  Bookie
//
//  Created by newAccount on 07.06.2023.
//

import UIKit

class UpcomingViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var awayWinButton: UIButton!
    @IBOutlet var homeWinButton: UIButton!
    @IBOutlet var viewForButtons: UIView!
    @IBOutlet var choseLabel: UILabel!
    @IBOutlet var baseCentralView: UIView!
    @IBOutlet var progressBaseView: UIView!
    @IBOutlet var awayProcentLabel: UILabel!
    @IBOutlet var homeProcentLabel: UILabel!
    @IBOutlet var winProccentText: UILabel!
    @IBOutlet var actionsLabel: UILabel!
    @IBOutlet var preMatchLabel: UILabel!
    @IBOutlet var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        congigureView()
    }
    
    private func registerCell(){
        let upcomingCellNib = UINib(nibName: "CurrentCollectionViewCell", bundle: nil)
        collectionView.register(upcomingCellNib, forCellWithReuseIdentifier: "CurrentCollectionViewCell")
        
        tableView.register(UINib(nibName: "UpcomingTableViewCell", bundle: nil), forCellReuseIdentifier: "UpcomingTableViewCell")
    }
    
    private func congigureView(){
        self.view.backgroundColor = .customDarkGrey
        collectionView.backgroundColor = .clear
        
        progressBaseView.backgroundColor = .customLightGrey
        progressBaseView.layer.cornerRadius = 14
        
        preMatchLabel.font = .displayFont(ofSize: 25, fontType: .SFBold)
        preMatchLabel.text = "PREMATCH INFO"
        preMatchLabel.textColor = .white
        
        actionsLabel.font = .displayFont(ofSize: 25, fontType: .SFBold)
        actionsLabel.text = "ACTIONS"
        actionsLabel.textColor = .white
        
        winProccentText.font = .displayFont(ofSize: 19, fontType: .SFMedium)
        winProccentText.text = "Win%"
        winProccentText.textColor = .white
        
        choseLabel.font = .displayFont(ofSize: 19, fontType: .SFMedium)
        choseLabel.text = "Choose Winner"
        choseLabel.textColor = .white
        
        baseCentralView.backgroundColor = .clear
        
        homeProcentLabel.font = .displayFont(ofSize: 14, fontType: .SFMedium)
        homeProcentLabel.text = "0%"
        homeProcentLabel.textColor = UIColor(red: 251, green: 251, blue: 251, alpha: 0.3)
        
        awayProcentLabel.font = .displayFont(ofSize: 14, fontType: .SFMedium)
        awayProcentLabel.text = "0%"
        awayProcentLabel.textColor = UIColor(red: 251, green: 251, blue: 251, alpha: 0.3)
        
        viewForButtons.backgroundColor = .customLightGrey
        viewForButtons.layer.cornerRadius = 14
        
        homeWinButton.layer.cornerRadius = 14
//        homeWinButton.backgroundColor = UIColor(red: 251, green: 251, blue: 251, alpha: 0.3)
        
        awayWinButton.layer.cornerRadius = 14
//        awayWinButton.backgroundColor = UIColor(red: 251, green: 251, blue: 251, alpha: 0.3)
        
        tableView.backgroundColor = .clear
    }
    
    private func openStandingsScreen(){
        let main = UIStoryboard(name: "Main", bundle: nil)
        if let vc = main.instantiateViewController(withIdentifier: "StandingsViewController") as? StandingsViewController {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    private func openMatchLiveScreen(){
        let main = UIStoryboard(name: "Main", bundle: nil)
        if let vc = main.instantiateViewController(withIdentifier: "MatchLiveViewController") as? MatchLiveViewController {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    private func openLineUpScreen(){
        let main = UIStoryboard(name: "Main", bundle: nil)
        if let vc = main.instantiateViewController(withIdentifier: "LineUpViewController") as? LineUpViewController {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    

}

extension UpcomingViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CurrentCollectionViewCell", for: indexPath) as! CurrentCollectionViewCell
        
        return cell
    }
    
    
}

extension UpcomingViewController: UICollectionViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
}



extension UpcomingViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.size.width - 32
        let height: CGFloat = 152
        return CGSize(width: width, height: height)
    }
}

extension UpcomingViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row{
        case 0 :
            print(1)
            openStandingsScreen()
        case 1 :
            print(2)
            openMatchLiveScreen()
        case 2:
            print(3)
            openLineUpScreen()
            
        default : return
        }
    }
}

extension UpcomingViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UpcomingTableViewCell", for: indexPath) as! UpcomingTableViewCell
        
        switch indexPath.row{
        case 0 : cell.titleLabel.text = "STANDINGS"
        case 1 : cell.titleLabel.text = "MATCH LIVE LINE"
        case 2 : cell.titleLabel.text = "LINE-UP"
            
        default:
            return cell
        }
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    
}
