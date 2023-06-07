//
//  PreferredViewController.swift
//  Bookie
//
//  Created by newAccount on 05.06.2023.
//

import UIKit
import RealmSwift

class PreferredViewController: UIViewController {
    
    private let realm = try? Realm()
    var arrayOfFavorites: [InfoBaseRealm] = []

    @IBOutlet var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }
    
    private func configureView(){
        view.backgroundColor = .customLightGrey
        
        let upcomingCellNib = UINib(nibName: "CurrentCollectionViewCell", bundle: nil)
        collectionView.register(upcomingCellNib, forCellWithReuseIdentifier: "CurrentCollectionViewCell")
        
        collectionView.backgroundColor = .customDarkGrey
    }
    
    private func setupFavorites() {
        arrayOfFavorites.removeAll()

        if let infoMatchesResult = realm?.objects(InfoBaseRealm.self) {
            for match in infoMatchesResult {
                arrayOfFavorites.append(match)
            }
        }
    }

    func realmDelete(idObjToDel: Int) {
            do {
              let realm = try Realm()
              let object = realm.objects(InfoBaseRealm.self).first
              try! realm.write {
                if let obj = object {
                  realm.delete(obj)
                }
              }
            } catch let error as NSError {
            }
          }
    
}

extension PreferredViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CurrentCollectionViewCell", for: indexPath) as! CurrentCollectionViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear
        return headerView
    }
}

extension PreferredViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.size.width - 32
        let height: CGFloat = 150
        return CGSize(width: width, height: height)
    }
    
   
}
