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
    static func getSettingsList()->[[SettingsList]]{
        [
            [SettingsList(
                leftImageName: "personImage",
                nameText: SettingsList.ButtonNameLabel.profile,
                rightImageName: "rightImage",
                switchIsHidden: true
            ),
            SettingsList(
                leftImageName: "heartImage",
                nameText: SettingsList.ButtonNameLabel.preferred,
                rightImageName: "rightImage",
                switchIsHidden: true
            )],
            [SettingsList(
                leftImageName: "bellImage",
                nameText: SettingsList.ButtonNameLabel.notifications,
                rightImageName: "",
                switchIsHidden: false
            ),
            SettingsList(
                leftImageName: "shareImage",
                nameText: SettingsList.ButtonNameLabel.shareUp,
                rightImageName: "rightImage",
                switchIsHidden: true
            ),
            SettingsList(
                leftImageName: "starImage",
                nameText: SettingsList.ButtonNameLabel.rateUs,
                rightImageName: "rightImage",
                switchIsHidden: true
            )],
            [SettingsList(
                leftImageName: "lockImage",
                nameText: SettingsList.ButtonNameLabel.privacy,
                rightImageName: "rightImage",
                switchIsHidden: true
            ),
            SettingsList(
                leftImageName: "shieldImage",
                nameText: SettingsList.ButtonNameLabel.terms,
                rightImageName: "rightImage",
                switchIsHidden: true
            )]
        ]

    }
}
