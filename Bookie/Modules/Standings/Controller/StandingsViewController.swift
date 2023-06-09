//
//  StandingsViewController.swift
//  Bookie
//
//  Created by newAccount on 07.06.2023.
//

import UIKit

class StandingsViewController: UIViewController {

    @IBOutlet var segmentControl: UISegmentedControl!
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        configureView()
       
        
    }
    
    private func configureView(){
        tableView.backgroundColor = .customDarkGrey
        self.view.backgroundColor = .customLightGrey
        self.title = "Standings"
    }
    
    private func registerCell(){
        tableView.register(UINib(nibName: "UniversalTableViewCell", bundle: nil), forCellReuseIdentifier: "UniversalTableViewCell")
    }
    
    
}

extension StandingsViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UniversalTableViewCell", for: indexPath) as! UniversalTableViewCell
        
       
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
        titleLabel.text = "Header"
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
