import Foundation

struct SettingsList {
    var leftImageName: String
    var nameText: String
    var rightImageName: String
    var switchIsHidden: Bool
    
    enum ButtonNameLabel {
        static let profile = "Profile"
        static let preferred = "Preferred Events"
        static let notifications = "Notifications"
        static let shareUp = "Share App"
        static let rateUs = "Rate Us"
        static let privacy = "Privacy Poliicy"
        static let terms = "Terms"
   }
}

extension SettingsList{
    static func getSettingsList()->[SettingsList]{
        [
            SettingsList(
                leftImageName: "",
                nameText: SettingsList.ButtonNameLabel.profile,
                rightImageName: "",
                switchIsHidden: true
            ),
            SettingsList(
                leftImageName: "",
                nameText: SettingsList.ButtonNameLabel.preferred,
                rightImageName: "",
                switchIsHidden: true
            ),
            SettingsList(
                leftImageName: "",
                nameText: SettingsList.ButtonNameLabel.notifications,
                rightImageName: "",
                switchIsHidden: false
            ),
            SettingsList(
                leftImageName: "",
                nameText: SettingsList.ButtonNameLabel.shareUp,
                rightImageName: "",
                switchIsHidden: true
            ),
            SettingsList(
                leftImageName: "",
                nameText: SettingsList.ButtonNameLabel.rateUs,
                rightImageName: "",
                switchIsHidden: true
            ),
            SettingsList(
                leftImageName: "",
                nameText: SettingsList.ButtonNameLabel.privacy,
                rightImageName: "",
                switchIsHidden: true
            ),
            SettingsList(
                leftImageName: "",
                nameText: SettingsList.ButtonNameLabel.terms,
                rightImageName: "",
                switchIsHidden: true
            )
        ]

    }
}
