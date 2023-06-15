//
//  MainViewController.swift
//  Bookie
//
//  Created by newAccount on 30.05.2023.
//

import UIKit
import Alamofire

class MainViewController: UIViewController {
    
    @IBOutlet var liveCollectionView: UICollectionView!
    @IBOutlet var conteinerView: UIView!
    
    @IBOutlet var finishCollectionView: UICollectionView!
    @IBOutlet var finishedLabel: UILabel!
    @IBOutlet var liveLabel: UILabel!
    @IBOutlet var upComingLabel: UILabel!
    @IBOutlet var upcomingCollectionView: UICollectionView!
    
    private let eventsStatusArray = ["All", "Active", "Finished"]
    var currentStatusSelected = 0
    var currentStatus = ["", "&status=1H-2H-ET-BT-P-SUSP-INT", "&status=FT-AET-PEN"]
    
    var fixturesBaseArray: [Response] = []
    var liveFixtures: [Response] = []
    var finishedFixtures: [Response] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchFinishFixturesBase()
        fetchFixturesBase()
        fetchliveFixturesBase()
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
    
    private func openUpcomingScreen(model: Response){
        let main = UIStoryboard(name: "Main", bundle: nil)
        if let vc = main.instantiateViewController(withIdentifier: "UpcomingViewController") as? UpcomingViewController {
            navigationController?.pushViewController(vc, animated: true)
            vc.upCellBase.append(model)
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
    
    func fetchliveFixturesBase(){
        let url = "https://v3.football.api-sports.io/fixtures?live=all"
        let headers: HTTPHeaders = ["x-apisports-key":"9a49740c5034d7ee252d1e1419a10faa"]
        AF.request(url, headers: headers).responseJSON { responseJSON in
            let decoder = JSONDecoder()
            guard let respponseData = responseJSON.data else {return}
            do {
                let data = try decoder.decode(FixturesBase.self, from: respponseData)
                
                if let response = data.response{
                    self.liveFixtures = response
                    self.liveCollectionView.reloadData()
                    print("SUPER")
                }
            } catch let error{
                print("Sorry, no data")
                print(error)
            }
        }
    }
    
    func fetchFixturesBase(){
        let url = "https://v3.football.api-sports.io/fixtures?date=\(getTomorrowDate())"
        let headers: HTTPHeaders = ["x-apisports-key":"9a49740c5034d7ee252d1e1419a10faa"]
        AF.request(url, headers: headers).responseJSON { responseJSON in
            let decoder = JSONDecoder()
            guard let respponseData = responseJSON.data else {return}
            do {
                let data = try decoder.decode(FixturesBase.self, from: respponseData)
                
                if let response = data.response{
                    self.fixturesBaseArray = response
                    self.upcomingCollectionView.reloadData()
                }
            } catch let error{
                print("Sorry, no data")
                print(error)
            }
        }
    }
    
    func fetchFinishFixturesBase(){
        let url = "https://v3.football.api-sports.io/fixtures?status=FT-AET-PEN&date=\(getCurrentDate())"
        let headers: HTTPHeaders = ["x-apisports-key":"9a49740c5034d7ee252d1e1419a10faa"]
        AF.request(url, headers: headers).responseJSON { responseJSON in
            let decoder = JSONDecoder()
            guard let respponseData = responseJSON.data else {return}
            do {
                let data = try decoder.decode(FixturesBase.self, from: respponseData)
                
                if let response = data.response{
                    self.finishedFixtures = response
                    self.finishCollectionView.reloadData()
                }
            } catch let error{
                print("Sorry, no data")
                print(error)
            }
        }
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

        
        switch collectionView{
        case upcomingCollectionView : openUpcomingScreen(model: fixturesBaseArray[indexPath.row])
        case liveCollectionView : openUpcomingScreen(model: liveFixtures[indexPath.row])
        case finishCollectionView : openUpcomingScreen(model: finishedFixtures[indexPath.row])
        default : return
        }
    }
}

extension MainViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case upcomingCollectionView : return fixturesBaseArray.count
        case liveCollectionView : return liveFixtures.count
        case finishCollectionView : return finishedFixtures.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        switch collectionView {
        case upcomingCollectionView :
            let cell = upcomingCollectionView.dequeueReusableCell(withReuseIdentifier: "UpcomingCollectionViewCell", for: indexPath) as! UpcomingCollectionViewCell
            
            cell.setupCell(model: fixturesBaseArray[indexPath.row])
            return cell
        case liveCollectionView :
            let cell = liveCollectionView.dequeueReusableCell(withReuseIdentifier: "CurrentCollectionViewCell", for: indexPath) as! CurrentCollectionViewCell
          
            cell.setupCell(model: liveFixtures[indexPath.row])
            return cell
        case finishCollectionView :
            let cell = liveCollectionView.dequeueReusableCell(withReuseIdentifier: "CurrentCollectionViewCell", for: indexPath) as! CurrentCollectionViewCell
            cell.setupCell(model: finishedFixtures[indexPath.row])
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




//MARK: All Struct
struct All {
    let date: Date
    let responce: [Response]
}
