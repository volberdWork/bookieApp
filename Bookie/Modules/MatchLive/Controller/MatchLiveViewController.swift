//
//  MatchLiveViewController.swift
//  Bookie
//
//  Created by newAccount on 07.06.2023.
//

import UIKit

class MatchLiveViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        registerCell()
    }
    
    private func configureView(){
tableView.backgroundColor = .customDarkGrey
        self.view.backgroundColor = .customLightGrey
        self.title = "Match Live Line"
    }
    
    private func registerCell(){
        tableView.register(UINib(nibName: "MatchTableViewCell", bundle: nil), forCellReuseIdentifier: "MatchTableViewCell")
    }
    


}


extension MatchLiveViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MatchTableViewCell", for: indexPath) as! MatchTableViewCell
        
       
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
        imageView.image = UIImage(named: "your_image_name") // Замени "your_image_name" на имя изображения, которое ты хочешь использовать
        
        imageView.backgroundColor = .customYellow
        headerView.addSubview(imageView)
        
        let titleLabel = UILabel(frame: CGRect(x: 40, y: 0, width: tableView.frame.width - 56, height: 44))
        titleLabel.text = "Header"
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
