//
//  LineUpViewController.swift
//  Bookie
//
//  Created by newAccount on 07.06.2023.
//

import UIKit
import Alamofire

class LineUpViewController: UIViewController {
    @IBOutlet var segmentControl: UISegmentedControl!
    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var noDataImage: UIImageView!
    
    
    var teamId = 0
    var fixtureId = 0
    var awayId = 0
    var lineUpHomeBase: [ResponseLineUp] = []
    
    var selectedSegment = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(teamId)
        print(fixtureId)
        loadLineUPHomeBase(id: fixtureId, team: teamId)
        configureView()
        registerCell()
        
    }
    
    func loadLineUPHomeBase(id: Int, team: Int){
        let url = "https://v3.football.api-sports.io/fixtures/lineups?fixture=\(id)"
        let headers: HTTPHeaders = ["x-apisports-key":"9a49740c5034d7ee252d1e1419a10faa"]
        AF.request(url, headers: headers).responseJSON { responseJSON in
            let decoder = JSONDecoder()
            guard let respponseData = responseJSON.data else {return}
            do {
                let data = try decoder.decode(LineUpBase.self, from: respponseData)
                self.lineUpHomeBase = data.response!
                self.tableView.reloadData()
                
                print("\(data.response?.count ?? 0)")
            } catch let error {
                print("Error: \(error)")
                print("Failed to decode data for fixture with ID \(id)")
            }
            if self.lineUpHomeBase.isEmpty {
                self.tableView.isHidden = true
            } else{
                self.tableView.isHidden = false
            }
        }
    }
    
    
    @IBAction func sementControleChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            loadLineUPHomeBase(id: fixtureId, team: teamId)
            selectedSegment = 0
            tableView.reloadData()
        } else{
            loadLineUPHomeBase(id: fixtureId, team: awayId)
            selectedSegment = 1
            tableView.reloadData()
            
        }
    }
    
    private func registerCell(){
        tableView.register(UINib(nibName: "UniversalTableViewCell", bundle: nil), forCellReuseIdentifier: "UniversalTableViewCell")
        tableView.register(UINib(nibName: "ImageTableViewCell", bundle: nil), forCellReuseIdentifier: "ImageTableViewCell")
        
        
    }
    
    private func configureView(){
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white, // Здесь установите желаемый цвет
            .font: UIFont.systemFont(ofSize: 14) // Здесь установите желаемый шрифт
        ]
        segmentControl.setTitleTextAttributes(attributes, for: .normal)

        // Устанавливаем атрибуты текста для выделенного состояния сегментов (по желанию)
        segmentControl.setTitleTextAttributes(attributes, for: .selected)
        segmentControl.setTitle(lineUpHomeBase.first?.team?.name ?? "Home", forSegmentAt: 0)
        segmentControl.setTitle(lineUpHomeBase.first?.team?.name ?? "Away", forSegmentAt: 1)
        
//        tableView.backgroundColor = .customDarkGrey
        self.view.backgroundColor = .customLightGrey
        self.title = "Line Up"
        tableView.backgroundColor = .customDarkGrey
    }
    
    
}

extension LineUpViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 0 : return 2
        case 2: return lineUpHomeBase.first?.startXI?.count ?? 0 + 1
        default:
            return 0
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100.0;//Choose your custom row height
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UniversalTableViewCell", for: indexPath) as! UniversalTableViewCell
        
        switch indexPath.section{
        case 0 :
            if indexPath.row == 0{
                cell.leftLabel.text = "Formation"
                cell.rightLabel.text = lineUpHomeBase.first?.formation ?? ""
            } else if indexPath.row == 1{
                cell.leftLabel.text = "Coach"
                cell.rightLabel.text = lineUpHomeBase.first?.coach?.name ?? ""
            }
            
        case 1 : if indexPath.row == 0{
            
        } else {
            
        }
            
        case 2 :
            if indexPath.row == 0{
                cell.leftLabel.text = "STARTINGXI"
                cell.leftLabel.font = .displayFont(ofSize: 16, fontType: .SFBold)
                cell.leftLabel.textColor = .customYellow
                cell.rightLabel.text = ""
            } else if indexPath.row > 0 {
                cell.leftLabel.text = lineUpHomeBase.first?.startXI?[indexPath.row - 1].player?.name ?? ""
                    cell.leftLabel.font = .displayFont(ofSize: 14, fontType: .SFMedium)
                    cell.leftLabel.textColor = .white
                cell.rightLabel.text = "\(lineUpHomeBase.first?.startXI?[indexPath.row - 1].player?.number ?? 0)"
                }
        default:
            return cell
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 || section == 2{
            return 46
        } else{
            return 270
        }
      
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        var headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 44))
        headerView.backgroundColor = .customDarkGrey
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 270))
        
        if selectedSegment == 0{
            imageView.image = UIImage(named: "Im\(lineUpHomeBase.first?.formation ?? "")")
        } else{
            imageView.image = UIImage(named: "Image\(lineUpHomeBase.first?.formation ?? "")")
        }
        
        
        if section == 0 || section == 2{
            headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 44))
        } else{
            headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 270))
        }
  
        
        let titleLabel = UILabel(frame: CGRect(x: 40, y: 0, width: tableView.frame.width - 56, height: 44))
        
        if section == 0{
            titleLabel.text = "FORMATION"
        } else if section == 2{
            titleLabel.text = "TEAM LIST"
        }
        
        if section == 1 {
            headerView.addSubview(imageView)
        }
        
        if section == 0 || section == 2{
            
             titleLabel.textColor = .white
             titleLabel.font = .displayFont(ofSize: 21, fontType: .SFBold)
             headerView.addSubview(titleLabel)
             
             let lineView = UIView(frame: CGRect(x: 0, y: 44, width: tableView.frame.width, height: 1))
             lineView.backgroundColor = .lightGray
             headerView.addSubview(lineView)
        }
       
        
        return headerView
    }

}

extension LineUpViewController: UITableViewDelegate{
    
}
