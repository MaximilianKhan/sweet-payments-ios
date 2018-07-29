//
//  LoginViewController.swift
//  BR Payments
//
//  Created by Max Khan on 7/28/18.
//  Copyright © 2018 Max Khan. All rights reserved.
//

import UIKit

class LoginViewController: BRViewController {

	var backButton: UIButton!
	var loginLabel: UILabel!
	
	var phoneNumberLabel: UILabel!
	var phoneNumberTextField: UITextField!
	
	var passwordLabel: UILabel!
	var passwordTextField: UITextField!
	
	var loginButton: UIButton!
	
	let X_C1: CGFloat = 20.0
	let X_C2: CGFloat = 40.0
	let HT: CGFloat = 55.0
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		let WIDTH1: CGFloat = CGFloat(view.frame.width) - 2.0*X_C1
		let WIDTH2: CGFloat = CGFloat(view.frame.width) - 2.0*X_C2
		
		// Back Button
		let backRect = CGRect(x: X_C1, y: 30.0, width: 100.0, height: HT)
		backButton = UIButton(frame: backRect)
		backButton.backgroundColor = UIColor.black
		backButton.setTitle("back", for: .normal)
		backButton.titleLabel?.font = UIFont(name: "OpenSans-Light", size: 18.0)
		backButton.setTitleColor(UIColor.white, for: .normal)
		backButton.setTitleColor(UIColor.gray, for: .highlighted)
		backButton.layer.borderColor = UIColor.white.cgColor
		backButton.layer.borderWidth = 3.0
		backButton.addTarget(self, action: #selector(backbuttonPressed), for: .touchUpInside)
		view.addSubview(backButton)

        // Login Label
		let ht1: CGFloat = 30.0 + HT
		//print("ht1: ", ht1)
		loginLabel = UILabel(frame: CGRect(x: X_C1, y: ht1, width: WIDTH1, height: HT))
		loginLabel.textAlignment = .left
		loginLabel.textColor = UIColor.white
		loginLabel.font = UIFont(name: "OpenSans-Semibold", size: 24.0)
		loginLabel.text = "login"
		view.addSubview(loginLabel)
		
		// Phone Number Label
		let ht2 = ht1 + HT
		//print("ht2: ", ht2)
		phoneNumberLabel = UILabel(frame: CGRect(x: X_C2, y: ht2, width: WIDTH2, height: HT))
		phoneNumberLabel.textAlignment = .left
		phoneNumberLabel.textColor = UIColor.white
		phoneNumberLabel.font = UIFont(name: "OpenSans-Semibold", size: 18.0)
		phoneNumberLabel.textColor = UIColor.white
		phoneNumberLabel.text = "phone number"
		phoneNumberLabel.textAlignment = .left
		view.addSubview(phoneNumberLabel)
		
		// Phone Number TextField
		let ht3 = ht2 + HT
		//print("ht3: ", ht3)
		phoneNumberTextField = UITextField(frame: CGRect(x: X_C2, y: ht3, width: WIDTH2, height: HT))
		phoneNumberTextField.font = UIFont(name: "OpenSans-Light", size: 18.0)
		phoneNumberTextField.layer.borderColor = UIColor.white.cgColor
		phoneNumberTextField.layer.borderWidth = 3.0
		phoneNumberTextField.textAlignment = .center
		phoneNumberTextField.textColor = UIColor.white
		view.addSubview(phoneNumberTextField)
		
		// Password Label
		let ht4 = ht3 + 10.0 + HT
		//print("ht4: ", ht4)
		passwordLabel = UILabel(frame: CGRect(x: X_C2, y: ht4, width: WIDTH2, height: HT))
		passwordLabel.textAlignment = .left
		passwordLabel.textColor = UIColor.white
		passwordLabel.font = UIFont(name: "OpenSans-Semibold", size: 18.0)
		passwordLabel.textColor = UIColor.white
		passwordLabel.text = "password"
		passwordLabel.textAlignment = .left
		view.addSubview(passwordLabel)
		
		// Password TextField
		let ht5 = ht4 + HT
		//print("ht5: ", ht5)
		passwordTextField = UITextField(frame: CGRect(x: X_C2, y: ht5, width: WIDTH2, height: HT))
		passwordTextField.font = UIFont(name: "OpenSans-Light", size: 18.0)
		passwordTextField.layer.borderColor = UIColor.white.cgColor
		passwordTextField.layer.borderWidth = 3.0
		passwordTextField.textAlignment = .center
		passwordTextField.textColor = UIColor.white
		passwordTextField.isSecureTextEntry = true
		view.addSubview(passwordTextField)
		
		// Login Button
		let ht6 = ht5 + HT + 30.0
		loginButton = UIButton(frame: CGRect(x: view.frame.width - 100.0 - 20.0, y: ht6, width: 100.0, height: HT))
		loginButton.titleLabel?.font = UIFont(name: "OpenSans-Light", size: 18.0)
		loginButton.setTitle("login", for: .normal)
		loginButton.setTitleColor(UIColor.white, for: .normal)
		loginButton.setTitleColor(UIColor.black, for: .highlighted)
		loginButton.backgroundColor = UIColor.brPink()
		loginButton.layer.borderColor = UIColor.white.cgColor
		loginButton.layer.borderWidth = 3.0
		loginButton.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
		view.addSubview(loginButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	@objc fileprivate func backbuttonPressed() {
		navigationController?.popViewController(animated: true)
	}

	@objc fileprivate func loginButtonPressed() {
		// Create some logic to see if we should load the HomeIntroViewController vs. Reg Home
		// Perhaps make a server request against the user, or store some local value.
		let vc = HomeViewController()
		navigationController?.pushViewController(vc, animated: true)
	}
	
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
