//
//  UpcomingViewController.swift
//  Bookie
//
//  Created by newAccount on 07.06.2023.
//

import UIKit
import RealmSwift

class UpcomingViewController: UIViewController {
    
    var upCellBase: [Response] = []
    
    @IBOutlet var winButton: UIButton!
    private let realm = try? Realm()
    private var arrayOfFavorites: [InfoBaseRealm] = []

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
    
    var homeButtonPress = false
    var awayButtonPress = false
    var winButtonPress = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupFavorites()
        registerCell()
        congigureView()
        
        homeWinButton.setTitle(upCellBase.first?.teams?.home?.name ?? "", for: .normal)
        awayWinButton.setTitle(upCellBase.first?.teams?.away?.name ?? "", for: .normal)
    }
    
    private func registerCell(){
        let upcomingCellNib = UINib(nibName: "CurrentCollectionViewCell", bundle: nil)
        collectionView.register(upcomingCellNib, forCellWithReuseIdentifier: "CurrentCollectionViewCell")
        
        tableView.register(UINib(nibName: "UpcomingTableViewCell", bundle: nil), forCellReuseIdentifier: "UpcomingTableViewCell")
    }
    
    @objc func squareArrowUpButtonTapped(){
        if let home = upCellBase.first?.teams?.home?.name, let away = upCellBase.first?.teams?.away?.name  {
            let textToShare = "Look, this teams will play together: \(home) VS \(away)"
            let objectsToShare = [textToShare] as [Any]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = self.view
            self.present(activityVC, animated: true, completion: nil)
        }

    }
    
    @objc func heartButtonTapped(){
        let data = self.upCellBase.first
        let infoBaseRealm = InfoBaseRealm()
        infoBaseRealm.gameId = data?.fixture?.id ?? 0
        infoBaseRealm.date = data?.fixture?.date ?? ""
        infoBaseRealm.homaName = data?.teams?.home?.name ?? ""
        infoBaseRealm.awayName = data?.teams?.away?.name ?? ""
        infoBaseRealm.homeLogoLink = data?.teams?.home?.logo ?? ""
        infoBaseRealm.awayLogoLink = data?.teams?.away?.logo ?? ""
        infoBaseRealm.homeGoal = data?.goals?.home ?? 0
        infoBaseRealm.awayGoal = data?.goals?.away ?? 0
        infoBaseRealm.plase = "\(data?.fixture?.venue?.city ?? ""), \(data?.fixture?.venue?.name ?? "")"
        
        try? self.realm?.write{
            self.realm?.add(infoBaseRealm, update: .all)
            self.realm?.refresh()
        }
    }
    
    private func setupFavorites() {
        arrayOfFavorites.removeAll()
        
        if let infoMatchesResult = realm?.objects(InfoBaseRealm.self) {
            for match in infoMatchesResult {
                arrayOfFavorites.append(match)
            }
        }
    }
    
    private func congigureView(){
        // Создание кнопки square.and.arrow.up
        let squareArrowUpButton = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: self, action: #selector(squareArrowUpButtonTapped))

        // Создание кнопки heart
       
        let heartButton = UIBarButtonItem(image: UIImage(systemName: "heart"), style: .plain, target: self, action: #selector(heartButtonTapped))

        // Добавление кнопок на navigationBar
        navigationItem.rightBarButtonItems = [squareArrowUpButton, heartButton]

        
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
        
        winButton.layer.cornerRadius = 14
      
        
        tableView.backgroundColor = .clear
    }
    
    private func openStandingsScreen(data: Response){
        let main = UIStoryboard(name: "Main", bundle: nil)
        if let vc = main.instantiateViewController(withIdentifier: "StandingsViewController") as? StandingsViewController {
            navigationController?.pushViewController(vc, animated: true)
            vc.startData.append(data)
        }
    }
    
    private func openMatchLiveScreen(){
        let main = UIStoryboard(name: "Main", bundle: nil)
        if let vc = main.instantiateViewController(withIdentifier: "MatchLiveViewController") as? MatchLiveViewController {
            navigationController?.pushViewController(vc, animated: true)
            vc.fixtereId = upCellBase.first?.fixture?.id ?? 0
        }
    }
    
    private func openLineUpScreen(){
        let main = UIStoryboard(name: "Main", bundle: nil)
        if let vc = main.instantiateViewController(withIdentifier: "LineUpViewController") as? LineUpViewController {
            navigationController?.pushViewController(vc, animated: true)
            vc.fixtureId = upCellBase.first?.fixture?.id ?? 0
            vc.teamId = upCellBase.first?.teams?.home?.id ?? 0
            vc.awayId = upCellBase.first?.teams?.away?.id ?? 0
        }
    }
    @IBAction func homeButtonPressed(_ sender: UIButton) {
        if homeButtonPress{
            homeButtonPress = false
            sender.backgroundColor = UIColor(red: 251/255, green: 251/255, blue: 251/255, alpha: 0.3)
        } else{
            homeButtonPress = true
            sender.backgroundColor = .customYellow
            
        }
        
        
    }
    
    
    @IBAction func awayButtonPressed(_ sender: UIButton) {
        if awayButtonPress{
            awayButtonPress = false
            sender.backgroundColor = UIColor(red: 251/255, green: 251/255, blue: 251/255, alpha: 0.3)
        } else{
            awayButtonPress = true
            sender.backgroundColor = .customYellow
        }
        
       
        
    }
    
    @IBAction func winButtonPressed(_ sender: UIButton) {
        if winButtonPress{
            winButtonPress = false
            sender.backgroundColor = .customYellow
        } else{
            winButtonPress = true
            sender.backgroundColor = .customLightGrey
        }
        
        if winButtonPress{
            sender.setBackgroundImage(UIImage(named: "winButtonPress"), for: .normal)
        } else{
            sender.setBackgroundImage(UIImage(named: "winButton"), for: .normal)
        }
        print(winButtonPress)
    }
    
}

extension UpcomingViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CurrentCollectionViewCell", for: indexPath) as! CurrentCollectionViewCell
        cell.setupCell(model: upCellBase[indexPath.row])
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
            openStandingsScreen(data: upCellBase.first ?? Response(fixture: nil, league: nil, teams: nil, goals: nil, score: nil))
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
