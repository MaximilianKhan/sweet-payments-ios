//
//  HomeIntroViewController.swift
//  BR Payments
//
//  Created by Max Khan on 7/28/18.
//  Copyright © 2018 Max Khan. All rights reserved.
//

import UIKit

class HomeIntroViewController: BRViewController {

	// MARK: - Variables
	
	var welcomeLabel: UILabel!
	var infoLabel: UILabel!
	
	var firstTermView: UIView!
	var firstTermTextView: UITextView!
	var firstTermReadButton: UIButton!
	
	var finalTermView: UIView!
	var finalTermLabel: UILabel!
	var finalTermScrollView: UIScrollView!
	var finalTermAcceptButton: UIButton!
	// Temporarily disable this button
	var finalTermDeclineButton: UIButton!
	
	var ethView: UIView!
	var ethAddressLabel: UILabel!
	var ethAddressTextField: UITextField!
	var ethKeyLabel: UILabel!
	var ethKeyTextField: UITextField!
	var finishButton: UIButton!
	
	// var successImageView: UIImageView!
	
	// MARK: - Implementation
	
    override func viewDidLoad() {
        super.viewDidLoad()

		// Welcome Label
		welcomeLabel = UILabel(frame: CGRect(x: 40.0, y: view.frame.height*0.35 - 50.0, width: view.frame.width - 80.0, height: 100.0))
		welcomeLabel.backgroundColor = UIColor.white
		welcomeLabel.textColor = UIColor.black
		welcomeLabel.layer.cornerRadius = 10.0
		welcomeLabel.font = UIFont(name: "OpenSans-BoldItalic", size: 42.0)
		welcomeLabel.layer.masksToBounds = true
		welcomeLabel.text = "welcome"
		welcomeLabel.textAlignment = .center
		view.addSubview(welcomeLabel)
		
		// Info Label
		
		// ==================== FIRST TERM ====================
		
		// First Term View
		
		// First Term TextView
		
		// First Term Read Button
		
		// ==================== FINAL TERM ====================
		
		// Final Term View
		
		// Final Term Label
		
		// Final Term ScrollView
		
		// Final Term Accept Button
		
		// Final Term Decline Button
		
		// ==================== ETH ====================
		
		// Eth View
		
		// Eth Address Label
		
		// Eth Address TextField
		
		// Eth Key Label
		
		// Eth Key TextField
		
		// Finish Button
		
		// ==================== ANIMATION ====================
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
