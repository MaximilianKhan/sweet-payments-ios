//
//  PayViewController.swift
//  BR Payments
//
//  Created by Max Khan on 7/29/18.
//  Copyright © 2018 Max Khan. All rights reservvar
//

import UIKit
import JGProgressHUD
import NWPusher

class PayViewController: BRViewController {

	// MARK: - Variables
	
	var cancelButton: UIButton!
	
	var paymentString: String = ""
	var numLabel: UILabel!
	
	var oneButton: UIButton!
	var twoButton: UIButton!
	var threeButton: UIButton!
	
	var fourButton: UIButton!
	var fiveButton: UIButton!
	var sixButton: UIButton!
	
	var sevenButton: UIButton!
	var eightButton: UIButton!
	var nineButton: UIButton!
	
	var doneButton: UIButton!
	var zeroButton: UIButton!
	var backspaceButton: UIButton!
	
	var sendButton: UIButton!
	
	// MARK: - Implementation
	
    override func viewDidLoad() {
        super.viewDidLoad()

		let B_W = view.frame.width/3.0
		let B_H = view.frame.height*0.105
		
		// Cancel Button
		cancelButton = UIButton(frame: CGRect(x: 20.0, y: 30.0, width: 100.0, height: 55.0))
		cancelButton.setTitle("cancel", for: .normal)
		cancelButton.setTitleColor(UIColor.brPink(), for: .normal)
		cancelButton.setTitleColor(UIColor.white, for: .highlighted)
		cancelButton.titleLabel?.textAlignment = .center
		cancelButton.titleLabel?.font = UIFont(name: "OpenSans-Light", size: 22.0)
		cancelButton.addTarget(self, action: #selector(cancelButtonPressed), for: .touchUpInside)
		view.addSubview(cancelButton)
		
		// Num TextField
		numLabel = UILabel(frame: CGRect(x: view.frame.width/2.0 - 150.0, y: view.frame.height*0.47 - 60.0, width: 300.0, height: 60.0))
		numLabel.text = convertDollarString(str: paymentString)
		numLabel.backgroundColor = UIColor.black
		numLabel.font = UIFont(name: "OpenSans-Light", size: 36.0)
		numLabel.textColor = UIColor.brPink()
		numLabel.textAlignment = .center
		view.addSubview(numLabel)
		
        // One Button
		oneButton = UIButton(frame: CGRect(x: 0.0, y: view.frame.height*0.58, width: B_W, height: B_H))
		oneButton.setTitle("1", for: .normal)
		oneButton.setTitleColor(UIColor.white, for: .normal)
		oneButton.setTitleColor(UIColor.brPink(), for: .highlighted)
		oneButton.titleLabel?.textAlignment = .center
		oneButton.titleLabel?.font = UIFont(name: "OpenSans-Light", size: 24.0)
		oneButton.addTarget(self, action: #selector(oneButtonPressed), for: .touchUpInside)
		view.addSubview(oneButton)
		
		// Two Button
		twoButton = UIButton(frame: CGRect(x: view.frame.width/3.0, y: view.frame.height*0.58, width: B_W, height: B_H))
		twoButton.setTitle("2", for: .normal)
		twoButton.setTitleColor(UIColor.white, for: .normal)
		twoButton.setTitleColor(UIColor.brPink(), for: .highlighted)
		twoButton.titleLabel?.textAlignment = .center
		twoButton.titleLabel?.font = UIFont(name: "OpenSans-Light", size: 24.0)
		twoButton.addTarget(self, action: #selector(twoButtonPressed), for: .touchUpInside)
		view.addSubview(twoButton)
		
		// Three Button
		threeButton = UIButton(frame: CGRect(x: view.frame.width*2.0/3.0, y: view.frame.height*0.58, width: B_W, height: B_H))
		threeButton.setTitle("3", for: .normal)
		threeButton.setTitleColor(UIColor.white, for: .normal)
		threeButton.setTitleColor(UIColor.brPink(), for: .highlighted)
		threeButton.titleLabel?.textAlignment = .center
		threeButton.titleLabel?.font = UIFont(name: "OpenSans-Light", size: 24.0)
		threeButton.addTarget(self, action: #selector(threeButtonPressed), for: .touchUpInside)
		view.addSubview(threeButton)
		
		// Four Button
		fourButton = UIButton(frame: CGRect(x: 0.0, y: view.frame.height*0.685, width: B_W, height: B_H))
		fourButton.setTitle("4", for: .normal)
		fourButton.setTitleColor(UIColor.white, for: .normal)
		fourButton.setTitleColor(UIColor.brPink(), for: .highlighted)
		fourButton.titleLabel?.textAlignment = .center
		fourButton.titleLabel?.font = UIFont(name: "OpenSans-Light", size: 24.0)
		fourButton.addTarget(self, action: #selector(fourButtonPressed), for: .touchUpInside)
		view.addSubview(fourButton)
		
		// Five Button
		fiveButton = UIButton(frame: CGRect(x: view.frame.width/3.0, y: view.frame.height*0.685, width: B_W, height: B_H))
		fiveButton.setTitle("5", for: .normal)
		fiveButton.setTitleColor(UIColor.white, for: .normal)
		fiveButton.setTitleColor(UIColor.brPink(), for: .highlighted)
		fiveButton.titleLabel?.textAlignment = .center
		fiveButton.titleLabel?.font = UIFont(name: "OpenSans-Light", size: 24.0)
		fiveButton.addTarget(self, action: #selector(fiveButtonPressed), for: .touchUpInside)
		view.addSubview(fiveButton)
		
		// Six Button
		sixButton = UIButton(frame: CGRect(x: view.frame.width*2.0/3.0, y: view.frame.height*0.685, width: B_W, height: B_H))
		sixButton.setTitle("6", for: .normal)
		sixButton.setTitleColor(UIColor.white, for: .normal)
		sixButton.setTitleColor(UIColor.brPink(), for: .highlighted)
		sixButton.titleLabel?.textAlignment = .center
		sixButton.titleLabel?.font = UIFont(name: "OpenSans-Light", size: 24.0)
		sixButton.addTarget(self, action: #selector(sixButtonPressed), for: .touchUpInside)
		view.addSubview(sixButton)
		
		// Seven Button
		sevenButton = UIButton(frame: CGRect(x: 0.0, y: view.frame.height*0.790, width: B_W, height: B_H))
		sevenButton.setTitle("7", for: .normal)
		sevenButton.setTitleColor(UIColor.white, for: .normal)
		sevenButton.setTitleColor(UIColor.brPink(), for: .highlighted)
		sevenButton.titleLabel?.textAlignment = .center
		sevenButton.titleLabel?.font = UIFont(name: "OpenSans-Light", size: 24.0)
		sevenButton.addTarget(self, action: #selector(sevenButtonPressed), for: .touchUpInside)
		view.addSubview(sevenButton)
		
		// Eight Button
		eightButton = UIButton(frame: CGRect(x: view.frame.width/3.0, y: view.frame.height*0.790, width: B_W, height: B_H))
		eightButton.setTitle("8", for: .normal)
		eightButton.setTitleColor(UIColor.white, for: .normal)
		eightButton.setTitleColor(UIColor.brPink(), for: .highlighted)
		eightButton.titleLabel?.textAlignment = .center
		eightButton.titleLabel?.font = UIFont(name: "OpenSans-Light", size: 24.0)
		eightButton.addTarget(self, action: #selector(eightButtonPressed), for: .touchUpInside)
		view.addSubview(eightButton)
		
		// Nine Button
		nineButton = UIButton(frame: CGRect(x: view.frame.width*2.0/3.0, y: view.frame.height*0.790, width: B_W, height: B_H))
		nineButton.setTitle("9", for: .normal)
		nineButton.setTitleColor(UIColor.white, for: .normal)
		nineButton.setTitleColor(UIColor.brPink(), for: .highlighted)
		nineButton.titleLabel?.textAlignment = .center
		nineButton.titleLabel?.font = UIFont(name: "OpenSans-Light", size: 24.0)
		nineButton.addTarget(self, action: #selector(nineButtonPressed), for: .touchUpInside)
		view.addSubview(nineButton)
		
		// Done Button
		doneButton = UIButton(frame: CGRect(x: 0.0, y: view.frame.height*0.895, width: B_W, height: B_H))
		doneButton.setTitle("done", for: .normal)
		doneButton.setTitleColor(UIColor.white, for: .normal)
		doneButton.setTitleColor(UIColor.brPink(), for: .highlighted)
		doneButton.titleLabel?.textAlignment = .center
		doneButton.titleLabel?.font = UIFont(name: "OpenSans-Light", size: 18.0)
		doneButton.addTarget(self, action: #selector(doneButtonPresed), for: .touchUpInside)
		view.addSubview(doneButton)
		
		// Zero Button
		zeroButton = UIButton(frame: CGRect(x: view.frame.width/3.0, y: view.frame.height*0.895, width: B_W, height: B_H))
		zeroButton.setTitle("0", for: .normal)
		zeroButton.setTitleColor(UIColor.white, for: .normal)
		zeroButton.setTitleColor(UIColor.brPink(), for: .highlighted)
		zeroButton.titleLabel?.textAlignment = .center
		zeroButton.titleLabel?.font = UIFont(name: "OpenSans-Light", size: 24.0)
		zeroButton.addTarget(self, action: #selector(zeroButtonPressed), for: .touchUpInside)
		view.addSubview(zeroButton)
		
		// Backspace Button
		backspaceButton = UIButton(frame: CGRect(x: view.frame.width*2.0/3.0, y: view.frame.height*0.895, width: B_W, height: B_H))
		backspaceButton.setTitle("backspace", for: .normal)
		backspaceButton.setTitleColor(UIColor.white, for: .normal)
		backspaceButton.setTitleColor(UIColor.brPink(), for: .highlighted)
		backspaceButton.titleLabel?.textAlignment = .center
		backspaceButton.titleLabel?.font = UIFont(name: "OpenSans-Light", size: 18.0)
		backspaceButton.addTarget(self, action: #selector(minusDollarString), for: .touchUpInside)
		view.addSubview(backspaceButton)
		
		// Send Button
		sendButton = UIButton(frame: CGRect(x: view.frame.width - 120.0, y: 30.0, width: 100.0, height: 55.0))
		sendButton.setTitle("send", for: .normal)
		sendButton.setTitleColor(UIColor.brPink(), for: .normal)
		sendButton.setTitleColor(UIColor.white, for: .highlighted)
		sendButton.titleLabel?.textAlignment = .center
		sendButton.titleLabel?.font = UIFont(name: "OpenSans-Light", size: 22.0)
		sendButton.addTarget(self, action: #selector(sendButtonPressed), for: .touchUpInside)
		
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	private func convertDollarString(str: String) -> String {
		
		if str.count == 0 {
			return "$0.00"
		} else {
			return "$" + String(Double(str)!.rounded(toPlaces: 2)/100.0)
		}
		
	}
	
	private func convertDollarFloat(str: String) -> Float {
		return (Float(str)!/100.0)
	}
	
	private func appendToDollarString(str: String) {
		self.paymentString.append(str)
	}
	
	@objc private func minusDollarString() {
		
		if self.paymentString.count != 0 {
			let index = self.paymentString.index(self.paymentString.startIndex, offsetBy: (self.paymentString.count - 1))
			self.paymentString = String(self.paymentString[...index])
			print(self.paymentString)
		}
		
		numLabel.text = convertDollarString(str: self.paymentString)
		
	}
	
	// MARK: - Pressed Targets
	
	@objc private func oneButtonPressed() {
		
		if self.paymentString.count < 8 {
			appendToDollarString(str: "1")
			numLabel.text = convertDollarString(str: self.paymentString)
		}
		
	}
	
	@objc private func twoButtonPressed() {
	
		if self.paymentString.count < 8 {
			appendToDollarString(str: "2")
			numLabel.text = convertDollarString(str: self.paymentString)
		}
		
	}
	
	@objc private func threeButtonPressed() {
		
		if self.paymentString.count < 8 {
			appendToDollarString(str: "3")
			numLabel.text = convertDollarString(str: self.paymentString)
		}
		
	}
	
	@objc private func fourButtonPressed() {
		
		if self.paymentString.count < 8 {
			appendToDollarString(str: "4")
			numLabel.text = convertDollarString(str: self.paymentString)
		}
	
	}
	
	@objc private func fiveButtonPressed() {
		
		if self.paymentString.count < 8 {
			appendToDollarString(str: "5")
			numLabel.text = convertDollarString(str: self.paymentString)
		}
		
	}

	@objc private func sixButtonPressed() {
		
		if self.paymentString.count < 8 {
			appendToDollarString(str: "6")
			numLabel.text = convertDollarString(str: self.paymentString)
		}

	}
	
	@objc private func sevenButtonPressed() {
		
		if self.paymentString.count < 8 {
			appendToDollarString(str: "7")
			numLabel.text = convertDollarString(str: self.paymentString)
		}

	}
	
	@objc private func eightButtonPressed() {
		
		if self.paymentString.count < 8 {
			appendToDollarString(str: "8")
			numLabel.text = convertDollarString(str: self.paymentString)
		}

	}
	
	@objc private func nineButtonPressed() {
		
		if self.paymentString.count < 8 {
			appendToDollarString(str: "9")
			numLabel.text = convertDollarString(str: self.paymentString)
		}

	}
	
	@objc private func doneButtonPresed() {
		
		UIView.animate(withDuration: 0.6, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.0, options: [], animations: {
			
			self.oneButton.layer.opacity = 0.0
			self.twoButton.layer.opacity = 0.0
			self.threeButton.layer.opacity = 0.0
			self.fourButton.layer.opacity = 0.0
			self.fiveButton.layer.opacity = 0.0
			self.sixButton.layer.opacity = 0.0
			self.sevenButton.layer.opacity = 0.0
			self.eightButton.layer.opacity = 0.0
			self.nineButton.layer.opacity = 0.0
			self.doneButton.layer.opacity = 0.0
			self.zeroButton.layer.opacity = 0.0
			self.backspaceButton.layer.opacity = 0.0
			
		}) { (animated) in
			
			UIView.animate(withDuration: 0.6, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.0, options: [], animations: {
				
				self.numLabel.frame.origin.y = self.view.frame.height/2.0 - 30.0
				
			}, completion: { (animated) in
				
				self.view.addSubview(self.sendButton)
				
			})
			
		}
		
	}
	
	@objc private func zeroButtonPressed() {
		
		if self.paymentString.count < 8 {
			appendToDollarString(str: "0")
			numLabel.text = convertDollarString(str: self.paymentString)
		}
		
	}
	
	@objc private func backspaceButtonPressed() {
	
		minusDollarString()
		
	}
	
	@objc private func sendButtonPressed() {
		
		self.cancelButton.layer.opacity = 0.0
		
		let hud = JGProgressHUD(style: .dark)
		hud.textLabel.text = "Completing Transaction"
		hud.show(in: self.view)
		hud.dismiss(afterDelay: 3.0)

		UIView.animate(withDuration: 1.5, delay: 3.0, options: [], animations: {
			
			hud.indicatorView = JGProgressHUDSuccessIndicatorView()
			hud.textLabel.text = "Transaction Completed"
			
			// Send data to wells fargo
			let amount = self.convertDollarString(str: self.paymentString)
			let token = "2213117d0b0ac5a677ff116cfac9303c7eeb8a460a660dbeaab2282fa004ee9c"
			let payload = "{\"aps\":{\"alert\":\"" + amount + " deposited into your account.\",\"badge\":1,\"sound\":\"default\"}}"
			
			let a = AmountEth
			let b = self.convertDollarFloat(str: self.paymentString)
			let c = EthExchange
			
			let z = a - b/c
			AmountEth = z
			print(AmountEth)
			
			// Pending work
			if let path = Bundle.main.path(forResource: "pusher-wf-noti", ofType: "p12") {
				do {
					print("PATH!!!")
					let pusher = NWPusher()
					try pusher.pushPayload(payload, token: token, identifier: 1)
				} catch {
					
				}
			}
			
			self.numLabel.layer.opacity = 0.0
			self.sendButton.layer.opacity = 0.0
			
		}, completion: { (animated) in

			let vc = HomeViewController()
			self.navigationController?.pushViewController(vc, animated: true)
			//self.navigationController?.popViewController(animated: true)
			
		})
		
	}
	
	@objc private func cancelButtonPressed() {
		self.navigationController?.popViewController(animated: true)
		// MARK: - CHANGE LATER
		let vc = HomeViewController()
		self.navigationController?.pushViewController(vc, animated: true)
	}
	
}

extension Double {
	/// Rounds the double to decimal places value
	func rounded(toPlaces places:Int) -> Double {
		let divisor = pow(10.0, Double(places))
		return (self * divisor).rounded() / divisor
	}
}
