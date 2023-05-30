import UIKit
import AVFoundation

extension UIView {
    class func loadFromNibNamed(nibNamed: String, bundle: Bundle? = nil) -> UIView? {
        return UINib(
            nibName: nibNamed,
            bundle: bundle
        ).instantiate(withOwner: nil, options: nil)[0] as? UIView
    }
    
    func notAvailableDataLabel(parentView: UIView) -> UILabel {
        let label = UILabel()
        label.text = "There is no available data"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = true
        parentView.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: parentView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: parentView.centerYAnchor)
        ])
        return label
    }
}



extension UITableView {
    var disclosureView: UIImageView {
        let imageView = UIImageView(image: UIImage(named: "disclosureIcon"))
        imageView.frame = CGRect(x: 0, y: 0, width: 9, height: 17)
        return imageView
    }
}

extension Array where Element: Equatable {
    var unique: [Element] {
        var uniqueValues: [Element] = []
        forEach { item in
            guard !uniqueValues.contains(item) else { return }
            uniqueValues.append(item)
        }
        return uniqueValues
    }
}

extension String {
    static func getStatus(response: Response) -> String {
        
        let status = response.fixture?.status?.short ?? ""
        if status == "NS" || status == "TBD"  {
            return "NS"
        } else if status == "CANC" {
            return "CANC"
        } else {
            let teamFirstScore = response.goals?.home
            let teamSecondScore = response.goals?.away
            if teamFirstScore == nil || teamSecondScore == nil {
                return "N/A"
            } else {
                return String(teamFirstScore!) + ":" + String(teamSecondScore!)
            }
        }
    }
}

