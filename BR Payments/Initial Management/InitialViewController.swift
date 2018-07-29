//
//  InitialViewController.swift
//  BR Payments
//
//  Created by Max Khan on 7/28/18.
//  Copyright © 2018 Max Khan. All rights reserved.
//

import UIKit

class InitialViewController: BRViewController {

	var logoImageView: UIImageView!
	var loginButton: UIButton!
	var signupButton: UIButton!
	let BTN_HT: CGFloat = 55.0
	
    override func viewDidLoad() {
        super.viewDidLoad()

		let X_C: CGFloat = 20.0
		let width = CGFloat(view.frame.width - 2.0*X_C)
		
		// Logo ImageView
		let lv: CGFloat = ((view.frame.height*0.75) - 5.0 - BTN_HT)/2.0 - 65.0
		logoImageView = UIImageView(frame: CGRect(x: 40.0, y: lv, width: view.frame.width - 80.0, height: 130.0))
		logoImageView.image = UIImage(named: "EthCardWhite.png")
		logoImageView.contentMode = .scaleAspectFit
		view.addSubview(logoImageView)
		
		// Login Button
		let loginButtonRect = CGRect(x: X_C, y: (view.frame.height*0.75) - 5.0 - BTN_HT, width: width, height: BTN_HT)
		loginButton = UIButton(frame: loginButtonRect)
		loginButton.titleLabel?.font = UIFont(name: "OpenSans-Light", size: 18.0)
		loginButton.setTitle("login", for: .normal)
		loginButton.setTitleColor(UIColor.white, for: .normal)
		loginButton.setTitleColor(UIColor.brPink(), for: .highlighted)
		loginButton.backgroundColor = UIColor.black
		loginButton.layer.borderColor = UIColor.white.cgColor
		loginButton.layer.borderWidth = 3.0
		loginButton.addTarget(self, action: #selector(loginPressed), for: .touchUpInside)
		view.addSubview(loginButton)
		
		// Signup Button
		let signupButtonRect = CGRect(x: X_C, y: (view.frame.height*0.75) + 5.0, width: width, height: BTN_HT)
		signupButton = UIButton(frame: signupButtonRect)
		signupButton.titleLabel?.font = UIFont(name: "OpenSans-Light", size: 18.0)
		signupButton.setTitle("signup", for: .normal)
		signupButton.setTitleColor(UIColor.white, for: .normal)
		signupButton.setTitleColor(UIColor.brPink(), for: .highlighted)
		signupButton.backgroundColor = UIColor.black
		signupButton.layer.borderColor = UIColor.white.cgColor
		signupButton.layer.borderWidth = 3.0
		view.addSubview(signupButton)
		
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	@objc fileprivate func loginPressed() {
		let vc = LoginViewController()
		navigationController?.pushViewController(vc, animated: true)
	}

	fileprivate func signupPressde() {
		
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
