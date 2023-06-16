//
//  StandingsViewController.swift
//  Bookie
//
//  Created by newAccount on 07.06.2023.
//

import UIKit
import Alamofire

class StandingsViewController: UIViewController {

    var homeBase: [ResponseSt] = []
    var startData: [Response] = []
    var homeName = ""
    var awayName = ""
    var league = ""
    var team = ""
    @IBOutlet var segmentControl: UISegmentedControl!
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        getStandingsBase(league: "\(startData.first?.league?.id ?? 0)", team: "\(startData.first?.teams?.home?.id ?? 0)")
        registerCell()
        configureView()
       
        
    }
    
    private func configureView(){
        tableView.backgroundColor = .customDarkGrey
        self.view.backgroundColor = .customLightGrey
        self.title = "Standings"
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white, // Здесь установите желаемый цвет
            .font: UIFont.systemFont(ofSize: 14) // Здесь установите желаемый шрифт
        ]

        // Устанавливаем атрибуты текста для нормального состояния сегментов
        segmentControl.setTitleTextAttributes(attributes, for: .normal)

        // Устанавливаем атрибуты текста для выделенного состояния сегментов (по желанию)
        segmentControl.setTitleTextAttributes(attributes, for: .selected)
        segmentControl.setTitle(startData.first?.teams?.home?.name ?? "", forSegmentAt: 0)
        segmentControl.setTitle(startData.first?.teams?.away?.name ?? "", forSegmentAt: 1)
    }
    
    private func registerCell(){
        tableView.register(UINib(nibName: "UniversalTableViewCell", bundle: nil), forCellReuseIdentifier: "UniversalTableViewCell")
    }
    
    func getStandingsBase(league: String, team: String){
        let url = "https://v3.football.api-sports.io/standings?league=\(league)&season=2023&team=\(team)"
        let headers: HTTPHeaders = ["x-apisports-key":"9a49740c5034d7ee252d1e1419a10faa"]
        AF.request(url, headers: headers).responseJSON { responseJSON in
            let decoder = JSONDecoder()
            guard let respponseData = responseJSON.data else {return}
            do {
                let data = try decoder.decode(StandingsBase.self, from: respponseData)
                
                if let response = data.response{
                    self.homeBase = response
                    self.tableView.reloadData()
                }
            } catch let error{
                print("Sorry, no data")
                print(error)
            }
        }
    }
    
    
}

extension StandingsViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 0 : return 4
        case 1 : return 6
        case 2 : return 6
        case 3 : return 6
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UniversalTableViewCell", for: indexPath) as! UniversalTableViewCell
        
        
    switch indexPath.section{
    case 0 :
        switch indexPath.row{
        case 0 : cell.leftLabel.text = "Country"
            cell.rightLabel.text = "\(homeBase.first?.league?.country ?? "")"
        case 1 : cell.leftLabel.text = "League"
            cell.rightLabel.text = "\(homeBase.first?.league?.name ?? "")"
        case 2 : cell.leftLabel.text = "Points"
         
        case 3 : cell.leftLabel.text = "Goals Diff"
        default:
            return cell
        }
    case 1 :
        switch indexPath.row{
        case 0 : cell.leftLabel.text = "Played"
        case 1 : cell.leftLabel.text = "Win"
        case 2 : cell.leftLabel.text = "Draw"
        case 3 : cell.leftLabel.text = "Losse"
        case 4 : cell.leftLabel.text = "Goals for"
        case 5 : cell.leftLabel.text = "Goals Against"
        default:
            return cell
        }
    case 2 :
        switch indexPath.row{
        case 0 : cell.leftLabel.text = "Played"
        case 1 : cell.leftLabel.text = "Win"
        case 2 : cell.leftLabel.text = "Draw"
        case 3 : cell.leftLabel.text = "Losse"
        case 4 : cell.leftLabel.text = "Goals for"
        case 5 : cell.leftLabel.text = "Goals Against"
        default:
            return cell
        }
    case 3 :
        switch indexPath.row{
        case 0 : cell.leftLabel.text = "Played"
        case 1 : cell.leftLabel.text = "Win"
        case 2 : cell.leftLabel.text = "Draw"
        case 3 : cell.leftLabel.text = "Losse"
        case 4 : cell.leftLabel.text = "Goals for"
        case 5 : cell.leftLabel.text = "Goals Against"
        default:
            return cell
        }
    default : return cell
    }
        
        
       
        let isFirstCellInSection = indexPath.row == 0

        // Проверяем, является ли данная ячейка последней в секции
        let isLastCellInSection = indexPath.row == 9

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
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 46 // Увеличиваем высоту, чтобы уместить линию
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 44))
        headerView.backgroundColor = .customDarkGrey
        
        let titleLabel = UILabel(frame: CGRect(x: 16, y: 0, width: tableView.frame.width - 32, height: 36))
        switch section{
        case 0 :  titleLabel.text = "MAIN INFO"
        case 1 :  titleLabel.text = "ALL"
        case 2 : titleLabel.text = "HOME"
        case 3 :  titleLabel.text = "AWAY"
        default:
            return headerView
        }
        
       
        titleLabel.textColor = .white
        titleLabel.font = .displayFont(ofSize: 21, fontType: .SFBold)
        
        headerView.addSubview(titleLabel)
        
        let lineView = UIView(frame: CGRect(x: 0, y: 36, width: tableView.frame.width, height: 1))
        lineView.backgroundColor = .lightGray
        headerView.addSubview(lineView)
        
        return headerView
    }
}


extension StandingsViewController: UITableViewDelegate {
    
    // Здесь можешь дополнительно настроить делегат, если нужно
  
}
