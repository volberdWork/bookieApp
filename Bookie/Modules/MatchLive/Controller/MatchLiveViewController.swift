//
//  MatchLiveViewController.swift
//  Bookie
//
//  Created by newAccount on 07.06.2023.
//

import UIKit
import Alamofire
import Kingfisher

class MatchLiveViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    var fixtereId = 0
    var eventsBase: [ResponseEvents] = []
    
    @IBOutlet var noDataImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        configureView()
        registerCell()
        eventsBase(id: fixtereId)
    }
    
    private func configureView(){
tableView.backgroundColor = .customDarkGrey
        self.view.backgroundColor = .customLightGrey
        self.title = "Match Live Line"
    }
    
    private func registerCell(){
        tableView.register(UINib(nibName: "MatchTableViewCell", bundle: nil), forCellReuseIdentifier: "MatchTableViewCell")
    }
    
    
    func eventsBase(id: Int){
        print(fixtereId)
        let url = "https://v3.football.api-sports.io/fixtures/events?fixture=\(id)"
        let headers: HTTPHeaders = ["x-apisports-key":"9a49740c5034d7ee252d1e1419a10faa"]
        AF.request(url, headers: headers).responseJSON { responseJSON in
            let decoder = JSONDecoder()
            guard let respponseData = responseJSON.data else {return}
            do {
                let data = try decoder.decode(EventsBase.self, from: respponseData)
                self.eventsBase = data.response!
                print("ALL IS GOOD")
                self.tableView.reloadData()
            } catch let error {
                print("Error: \(error)")
                print("Failed to decode data for fixture with ID \(id)")
            }
            if self.eventsBase.isEmpty{
                self.tableView.isHidden = true
            } else{
                self.tableView.isHidden = false
            }
        }
    }
    


}


extension MatchLiveViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return eventsBase.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MatchTableViewCell", for: indexPath) as! MatchTableViewCell
        
        if indexPath.row == 0{
            cell.eventLabel.text = eventsBase[indexPath.section].team?.name ?? ""
            cell.eventImageView.kf.setImage(with: URL(string: eventsBase[indexPath.section].team?.logo ?? ""))
            cell.numberLabel.text = ""
            
        } else{
            cell.eventLabel.text = eventsBase[indexPath.section].detail ?? ""
            cell.numberLabel.text = "\(eventsBase[indexPath.section].time?.elapsed ?? 0)"
            cell.eventImageView.image = UIImage(named: "")
        }
       
        let isFirstCellInSection = indexPath.row == 0

        // Проверяем, является ли данная ячейка последней в секции
        let isLastCellInSection = indexPath.row == 1

        if isFirstCellInSection && isLastCellInSection {
            // Устанавливаем скругленные углы только для первой и последней ячейки в секции
            cell.baseView.layer.cornerRadius = 14
            cell.baseView.layer.masksToBounds = true
            cell.baseView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        } else if isFirstCellInSection {
            // Устанавливаем скругленные углы только для первой ячейки в секции
            cell.baseView.layer.cornerRadius = 14
            cell.baseView.layer.masksToBounds = true
            cell.baseView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        } else if isLastCellInSection {
            // Устанавливаем скругленные углы только для последней ячейки в секции
            cell.baseView.layer.cornerRadius = 14
            cell.baseView.layer.masksToBounds = true
            cell.baseView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        } else {
            // Сбрасываем скругленные углы для остальных ячеек
            cell.baseView.layer.cornerRadius = 0
            cell.baseView.layer.masksToBounds = false
            cell.baseView.layer.maskedCorners = []
        }
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 46
    }

    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 44))
        headerView.backgroundColor = .customDarkGrey
        
        let imageView = UIImageView(frame: CGRect(x: 16, y: 12, width: 20, height: 20))
        imageView.image = UIImage(named: eventsBase[section].type ?? "")
      
        headerView.addSubview(imageView)
        
        let titleLabel = UILabel(frame: CGRect(x: 40, y: 0, width: tableView.frame.width - 56, height: 44))
        titleLabel.text = eventsBase[section].type ?? ""
        titleLabel.textColor = .white
        titleLabel.font = .displayFont(ofSize: 21, fontType: .SFBold)
        headerView.addSubview(titleLabel)
        
        let lineView = UIView(frame: CGRect(x: 0, y: 44, width: tableView.frame.width, height: 1))
        lineView.backgroundColor = .lightGray
        headerView.addSubview(lineView)
        
        return headerView
    }


}


extension MatchLiveViewController: UITableViewDelegate {
    
    // Здесь можешь дополнительно настроить делегат, если нужно
  
}
