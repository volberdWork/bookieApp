//
//  SortedViewController.swift
//  Bookie
//
//  Created by newAccount on 05.06.2023.
//

import UIKit
import Alamofire

class SortedViewController: UIViewController {

    @IBOutlet var titleCont: UILabel!
    @IBOutlet var tableView: UITableView!
    var ardrdds: [ResponseLg] = []
    var base : [[String]] = [["Upcoming","Live", "Finished", "Postponed", "Cancelled", "Abandoned", "Not Played"], ["B", "Baiano - 1", "Bundesliga", "Bundesliga 2", "C", "Challenger Pro League", "Championship", "Copa del Rey", "Coupe de France", "Cup", "D", "DFB Pokal", "Derde Divisie - Sunday", "Division 1", "E", "Ekstraklasa", "Eerste Divisie", "Eredivisie", "I", "I Liga", "J", "Jupiler Pro League", "K", "KNVB Beker", "L", "La Liga", "League Cup", "League One", "League Two", "Ligue 1", "Ligue 2", "Liga Profesional Argentina", "M", "Matogrossense", "N", "National 1", "P", "Paranaense - 1", "Paulista - A1", "Premier League", "Primeira Liga", "Primera A", "Primera División - Apertura", "S", "Segunda División", "Segunda División", "Segunda Liga", "Serie A", "Serie B", "Serie D - Girone E", "Super Copa", "Superliga", "T", "Taça de Portugal", "Torneo Federal A"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        configureView()
    }
    
    private func configureView(){
        tableView.register(UINib(nibName: "SortedTableViewCell", bundle: nil), forCellReuseIdentifier: "SortedTableViewCell")
        tableView.backgroundColor = .clear
        view.backgroundColor = .customLightGrey
        self.titleCont.text = "Sorted"
        titleCont.font = .displayFont(ofSize: 18, fontType: .SFMedium)
        titleCont.textColor = .customYellow
        
        
    }
    
}

extension SortedViewController: UITableViewDelegate{
    
    }
    
    extension SortedViewController: UITableViewDataSource{
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return base[section].count
        }

        func numberOfSections(in tableView: UITableView) -> Int {
            return base.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SortedTableViewCell", for: indexPath) as! SortedTableViewCell
            
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            
            switch indexPath.section {
            case 0:
                cell.titleLabel.text = base[indexPath.section][indexPath.row]
            case 1:
                cell.titleLabel.text = base[indexPath.section][indexPath.row]
            default:
                return cell
            }
            
            if indexPath.section == 0 {
                if indexPath.row <= 2 {
                    cell.circleView.backgroundColor = .customYellow
                    cell.baseView.backgroundColor = .customDarkGrey
                    cell.circleView.isHidden = false
                } else {
                    cell.circleView.backgroundColor = .clear
                    cell.baseView.backgroundColor = .customDarkGrey
                    cell.circleView.isHidden = false
                }
            } else{
                if indexPath.row == 0 || indexPath.row == 4 || indexPath.row == 10 || indexPath.row == 14 || indexPath.row == 18 || indexPath.row == 20 || indexPath.row == 22 || indexPath.row == 24 || indexPath.row == 32 || indexPath.row == 34 || indexPath.row == 36 || indexPath.row == 43 || indexPath.row == 52{
                    cell.baseView.backgroundColor = .clear
                    cell.circleView.isHidden = true
                } else{
                    cell.baseView.backgroundColor = .customDarkGrey
                    cell.circleView.isHidden = false
                    cell.circleView.backgroundColor = .clear
                }
            }
            
            

            let isFirstCellInSection = indexPath.row == 0
            let isLastCellInSection = indexPath.row == base[indexPath.section].count - 1

            if isFirstCellInSection && isLastCellInSection {
                cell.baseView.layer.cornerRadius = 14
                cell.baseView.layer.masksToBounds = true
                cell.baseView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
            } else if isFirstCellInSection {
                cell.baseView.layer.cornerRadius = 14
                cell.baseView.layer.masksToBounds = true
                cell.baseView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            } else if isLastCellInSection {
                cell.baseView.layer.cornerRadius = 14
                cell.baseView.layer.masksToBounds = true
                cell.baseView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
            } else {
                cell.baseView.layer.cornerRadius = 0
                cell.baseView.layer.masksToBounds = false
                cell.baseView.layer.maskedCorners = []
            }

            
            return cell
        }

        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 46
        }

        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 44))
            headerView.backgroundColor = .customLightGrey
            let titleLabel = UILabel(frame: CGRect(x: 16, y: 0, width: tableView.frame.width - 32, height: 36))
            if section == 0 {
                titleLabel.text = "MATCH STATUS"
            } else {
                titleLabel.text = "LEAGUES"
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


struct leagueModel{
    var name: String
    var num: Int
}

