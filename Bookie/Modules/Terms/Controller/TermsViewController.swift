//
//  TermsViewController.swift
//  Bookie
//
//  Created by newAccount on 31.05.2023.
//

import UIKit

class TermsViewController: UIViewController {

    @IBOutlet var termstextView: UITextView!
    
    var tetmsText = """
My bookie app collects a minimal amount of data to offer you a fast and reliable VPN service.
We collect:
Device-specific information like OS version, hardware model, and IP address to optimize our network connection to you. We do not store or log your IP address after you disconnect from the VPN.
Aggregated anonymous website activity data, to perform analytics on our service and to ensure you can reliably access certain websites or apps
Total bandwidth consumed and time connected to our VPN service
Payment information and optional email, when you purchase a paid plan

My bookie app collects a minimal amount of data to offer you a fast and reliable VPN service.
We collect:
Device-specific information like OS version, hardware model, and IP address to optimize our network connection to you. We do not store or log your IP address after you disconnect from the VPN.
Aggregated anonymous website activity data, to perform analytics on our service and to ensure you can reliably access certain websites or apps
Total bandwidth consumed and time connected to our VPN service
Payment information and optional email, when you purchase a paid plan

My bookie app collects a minimal amount of data to offer you a fast and reliable VPN service.
We collect:
Device-specific information like OS version, hardware model, and IP address to optimize our network connection to you. We do not store or log your IP address after you disconnect from the VPN.
Aggregated anonymous website activity data, to perform analytics on our service and to ensure you can reliably access certain websites or apps
Total bandwidth consumed and time connected to our VPN service
Payment information and optional email, when you purchase a paid plan

My bookie app collects a minimal amount of data to offer you a fast and reliable VPN service.
We collect:
Device-specific information like OS version, hardware model, and IP address to optimize our network connection to you. We do not store or log your IP address after you disconnect from the VPN.
Aggregated anonymous website activity data, to perform analytics on our service and to ensure you can reliably access certain websites or apps
Total bandwidth consumed and time connected to our VPN service
Payment information and optional email, when you purchase a paid plan

My bookie app collects a minimal amount of data to offer you a fast and reliable VPN service.
We collect:
Device-specific information like OS version, hardware model, and IP address to optimize our network connection to you. We do not store or log your IP address after you disconnect from the VPN.
Aggregated anonymous website activity data, to perform analytics on our service and to ensure you can reliably access certain websites or apps
Total bandwidth consumed and time connected to our VPN service
Payment information and optional email, when you purchase a paid plan


"""
    
    var vc = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
       
    }
    
    private func configureView(){
        view.backgroundColor = .customLightGrey
        termstextView.backgroundColor = .customDarkGrey
        termstextView.textColor = .white
        termstextView.textAlignment = .center
        
        let backButton = UIBarButtonItem()
        backButton.title = "Menu"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        
        
        if vc == "terms"{
            self.title = "Terms"
            termstextView.text = tetmsText
            self.navigationItem.backButtonTitle = "Menu"
        } else {
            self.title = "Privacy Policy"
            termstextView.text = ""
        }
    }


}


