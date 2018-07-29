//
//  HomeViewController.swift
//  BR Payments
//
//  Created by Max Khan on 7/28/18.
//  Copyright © 2018 Max Khan. All rights reserved.
//

import UIKit

class HomeViewController: BRViewController {

	// MARK: - Variables
	
	var welcomeLabel: UILabel!
	
	var menuBackground: UIView!
	var menuButton: UIButton!
	var menuOpen = false
	var bigRacksWalletLabel: UILabel!
	
	var historyButton: UIButton!
	var verificationButton: UIButton!
	var walletButton: UIButton!
	var settingsButton: UIButton!
	
	var amountEthLabel: UILabel!
	var exchangeRateEthLabel: UILabel!
	var exchangeRateEthImageView: UIImageView!
	
	var ethChart: Chart!
	var ethOneDaySeries: ChartSeries!
	var ethOneWeekSeries: ChartSeries!
	var ethOneMonthSeries: ChartSeries!
	var ethThreeMonthSeries: ChartSeries!
	var ethOneYearSeries: ChartSeries!
	var ethAllSeries: ChartSeries!
	
	var oneDayButton: UIButton!
	var oneWeekButton: UIButton!
	var oneMonthButton: UIButton!
	var threeMonthButton: UIButton!
	var oneYearButton: UIButton!
	var allButton: UIButton!
	
	var timeUnderlineView: UIView!
	var timeUnderlineVal: Int = 0
	
	var payButton: UIButton!
	
	var BTN_Y: CGFloat = 0.0
	var BTN_W: CGFloat = 0.0
	
	// MARK: - Implementation
	
    override func viewDidLoad() {
        super.viewDidLoad()

		welcomeLabel = UILabel(frame: CGRect(x: 40.0, y: view.frame.height*0.35 - 50.0, width: view.frame.width - 80.0, height: 100.0))
		welcomeLabel.backgroundColor = UIColor.white
		welcomeLabel.textColor = UIColor.black
		welcomeLabel.layer.cornerRadius = 10.0
		welcomeLabel.font = UIFont(name: "OpenSans-BoldItalic", size: 42.0)
		welcomeLabel.layer.masksToBounds = true
		welcomeLabel.text = "welcome"
		welcomeLabel.textAlignment = .center
		welcomeLabel.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
		if LoadWelcome == true {
			view.addSubview(welcomeLabel)
		}
		
		// Menu Background
		
		// Menu Button
		menuButton = UIButton(frame: CGRect(x: 20.0, y: 30.0, width: 50.0, height: 50.0))
		menuButton.setImage(UIImage(named: "menu.png"), for: .normal)
		menuButton.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
		menuButton.imageEdgeInsets = UIEdgeInsets(top: 8.0, left: 4.0, bottom: 8.0, right: 4.0)
		menuButton.addTarget(self, action: #selector(menuButtonPressed), for: .touchUpInside)
		
		// Big Racks Wallet Label
		bigRacksWalletLabel = UILabel(frame: CGRect(x: view.frame.width/2.0 - 100.0, y: 30.0, width: 200.0, height: 50.0))
		bigRacksWalletLabel.font = UIFont(name: "OpenSansLight-Italic", size: 18.0)
		bigRacksWalletLabel.textAlignment = .center
		bigRacksWalletLabel.textColor = UIColor.brPink()
		bigRacksWalletLabel.text = "sweet wallet"
		bigRacksWalletLabel.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
		
		// Amount Eth Label
		amountEthLabel = UILabel(frame: CGRect(x: view.frame.width/2.0 - 100.0, y: 85.0, width: 200.0, height: 50.0))
		amountEthLabel.font = UIFont(name: "OpenSans-Light", size: 34.0)
		amountEthLabel.textAlignment = .center
		amountEthLabel.textColor = UIColor.white
		amountEthLabel.text = String(format: "%.4f eth", AmountEth)
		amountEthLabel.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
		
		// Exchange Rate Eth Label
		exchangeRateEthLabel = UILabel(frame: CGRect(x: view.frame.width/2.0 - 115.0, y: 140.0, width: 230.0, height: 30.0))
		exchangeRateEthLabel.font = UIFont(name: "OpenSans-Light", size: 26.0)
		exchangeRateEthLabel.textAlignment = .center
		exchangeRateEthLabel.textColor = UIColor.white
		exchangeRateEthLabel.text = "$"  + "\(EthExchange)" + " // 1 eth"
		exchangeRateEthLabel.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
		//exchangeRateEthLabel.backgroundColor = UIColor.brPink()
		
		// Exchange Rate Eth ImageView
		exchangeRateEthImageView = UIImageView(frame: CGRect(x: view.frame.width/2.0 + 90.0, y: 140.0, width: 30.0, height: 30.0))
		exchangeRateEthImageView.image = UIImage(named: "upGreen")
		exchangeRateEthImageView.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
		
		BTN_Y = view.frame.height - 65.0 - 30.0 - 20.0
		BTN_W = (view.frame.width - 40.0)/6.0
		
		// ==================== GRAPH ====================

		let N_Y = BTN_Y - 180.0
		ethChart = Chart(frame: CGRect(x: 20.0, y: 180.0, width: view.frame.width - 40.0, height: N_Y))
		//let data = [(x: 0.0, y: 0.0), (x: 1.0, y: 1.0), (x: 2.0, y: 2.0), (x: 3.0, y: 3.0)]
		let data = [0.0, -1.0, 2.0, 1.5, 5.0, -1.0, 0.0, 3.0, -1.0, 4.0, 1.0, 6.0, 2.5, 3.0, 4.0, 4.5, 4.0, 6.5, 1.0, -1.0, -4.0, -3.0, -4.0, -10.0, -5.0, -4.0, -4.5, 1.0, 0.0, -2.0, 1.0, 1.5, 1.5, 1.0, 3.5]
		let series = ChartSeries(data)
		series.color = UIColor.brPink()
		ethChart.add(series)
		ethChart.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
		
		// ==================== TIME BUTTONS ====================
		
		// One Day Button
		oneDayButton = UIButton(frame: CGRect(x: 20.0, y: BTN_Y, width: BTN_W, height: 30.0))
		oneDayButton.setTitle("1d", for: .normal)
		oneDayButton.titleLabel?.font = UIFont(name: "OpenSans-Light", size: 14.0)
		oneDayButton.setTitleColor(UIColor.brPink(), for: .normal)
		oneDayButton.setTitleColor(UIColor.white, for: .highlighted)
		oneDayButton.backgroundColor = UIColor.black
		oneDayButton.titleLabel?.textAlignment = .center
		oneDayButton.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
		oneDayButton.addTarget(self, action: #selector(oneDayButtonPressed), for: .touchUpInside)
		
		// One Week Button
		oneWeekButton = UIButton(frame: CGRect(x: 20.0 + BTN_W, y: BTN_Y, width: BTN_W, height: 30.0))
		oneWeekButton.setTitle("1w", for: .normal)
		oneWeekButton.titleLabel?.font = UIFont(name: "OpenSans-Light", size: 14.0)
		oneWeekButton.setTitleColor(UIColor.brPink(), for: .normal)
		oneWeekButton.setTitleColor(UIColor.white, for: .highlighted)
		oneWeekButton.backgroundColor = UIColor.black
		oneWeekButton.titleLabel?.textAlignment = .center
		oneWeekButton.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
		oneWeekButton.addTarget(self, action: #selector(oneWeekButtonPressed), for: .touchUpInside)
		
		// One Month Button
		oneMonthButton = UIButton(frame: CGRect(x: 20.0 + BTN_W*2.0, y: BTN_Y, width: BTN_W, height: 30.0))
		oneMonthButton.setTitle("1m", for: .normal)
		oneMonthButton.titleLabel?.font = UIFont(name: "OpenSans-Light", size: 14.0)
		oneMonthButton.setTitleColor(UIColor.brPink(), for: .normal)
		oneMonthButton.setTitleColor(UIColor.white, for: .highlighted)
		oneMonthButton.backgroundColor = UIColor.black
		oneMonthButton.titleLabel?.textAlignment = .center
		oneMonthButton.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
		oneMonthButton.addTarget(self, action: #selector(oneMonthButtonPressed), for: .touchUpInside)
		
		// Three Months Button
		threeMonthButton = UIButton(frame: CGRect(x: 20.0 + BTN_W*3.0, y: BTN_Y, width: BTN_W, height: 30.0))
		threeMonthButton.setTitle("3m", for: .normal)
		threeMonthButton.titleLabel?.font = UIFont(name: "OpenSans-Light", size: 14.0)
		threeMonthButton.setTitleColor(UIColor.brPink(), for: .normal)
		threeMonthButton.setTitleColor(UIColor.white, for: .highlighted)
		threeMonthButton.backgroundColor = UIColor.black
		threeMonthButton.titleLabel?.textAlignment = .center
		threeMonthButton.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
		threeMonthButton.addTarget(self, action: #selector(threeMonthButtonPressed), for: .touchUpInside)
		
		// One Year Button
		oneYearButton = UIButton(frame: CGRect(x: 20.0 + BTN_W*4.0, y: BTN_Y, width: BTN_W, height: 30.0))
		oneYearButton.setTitle("1y", for: .normal)
		oneYearButton.titleLabel?.font = UIFont(name: "OpenSans-Light", size: 14.0)
		oneYearButton.setTitleColor(UIColor.brPink(), for: .normal)
		oneYearButton.setTitleColor(UIColor.white, for: .highlighted)
		oneYearButton.backgroundColor = UIColor.black
		oneYearButton.titleLabel?.textAlignment = .center
		oneYearButton.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
		oneYearButton.addTarget(self, action: #selector(oneYearButtonPressed), for: .touchUpInside)
		
		// All button
		allButton = UIButton(frame: CGRect(x: 20.0 + BTN_W*5.0, y: BTN_Y, width: BTN_W, height: 30.0))
		allButton.setTitle("all", for: .normal)
		allButton.titleLabel?.font = UIFont(name: "OpenSans-Light", size: 14.0)
		allButton.setTitleColor(UIColor.brPink(), for: .normal)
		allButton.setTitleColor(UIColor.white, for: .highlighted)
		allButton.backgroundColor = UIColor.black
		allButton.titleLabel?.textAlignment = .center
		allButton.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
		allButton.addTarget(self, action: #selector(allButtonPressed), for: .touchUpInside)
		
		// Time Underline View
		timeUnderlineView = UIView(frame: CGRect(x: 20.0, y: BTN_Y + 30.0, width: BTN_W, height: 2.0))
		timeUnderlineView.backgroundColor = UIColor.white
		timeUnderlineView.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
		
		// Pay Button
		payButton = UIButton(frame: CGRect(x: 40.0, y: view.frame.height - 55.0 - 10.0, width: view.frame.width - 80.0, height: 55.0))
		payButton.setTitle("pay", for: .normal)
		payButton.titleLabel?.font = UIFont(name: "OpenSans-Light", size: 18.0)
		payButton.setTitleColor(UIColor.brPink(), for: .normal)
		payButton.setTitleColor(UIColor.white, for: .highlighted)
		payButton.backgroundColor = UIColor.black
		payButton.layer.borderColor = UIColor.brPink().cgColor
		payButton.layer.borderWidth = 3.0
		payButton.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
		payButton.addTarget(self, action: #selector(payPressed), for: .touchUpInside)
		
		// ==================== MENU BUTTONS ====================
		
		let MB_W: CGFloat = (view.frame.width - 50.0)/2.0
		let MB_H: CGFloat = 60.0
		
		// History Button
		historyButton = UIButton(frame: CGRect(x: 20.0, y: 85.0, width: MB_W, height: MB_H))
		historyButton.setTitle("history", for: .normal)
		historyButton.setTitleColor(UIColor.white, for: .normal)
		historyButton.setTitleColor(UIColor.brPink(), for: .highlighted)
		historyButton.backgroundColor = UIColor.black
		historyButton.titleLabel?.font = UIFont(name: "OpenSans-Light", size: 19.0)
		historyButton.titleLabel?.textAlignment = .center
		historyButton.layer.borderColor = UIColor.brGreen().cgColor
		historyButton.layer.borderWidth = 3.0
		historyButton.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
		
		// Verification Button
		verificationButton = UIButton(frame: CGRect(x: 20.0 + MB_W + 10.0, y: 85.0, width: MB_W, height: MB_H))
		verificationButton.setTitle("verification", for: .normal)
		verificationButton.setTitleColor(UIColor.white, for: .normal)
		verificationButton.setTitleColor(UIColor.brPink(), for: .highlighted)
		verificationButton.backgroundColor = UIColor.black
		verificationButton.titleLabel?.font = UIFont(name: "OpenSans-Light", size: 19.0)
		verificationButton.titleLabel?.textAlignment = .center
		verificationButton.layer.borderColor = UIColor.brYellow().cgColor
		verificationButton.layer.borderWidth = 3.0
		verificationButton.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
		
		// Wallet Button
		walletButton = UIButton(frame: CGRect(x: 20.0, y: 155.0, width: MB_W, height: MB_H))
		walletButton.setTitle("wallet", for: .normal)
		walletButton.setTitleColor(UIColor.white, for: .normal)
		walletButton.setTitleColor(UIColor.brPink(), for: .highlighted)
		walletButton.backgroundColor = UIColor.black
		walletButton.titleLabel?.font = UIFont(name: "OpenSans-Light", size: 19.0)
		walletButton.titleLabel?.textAlignment = .center
		walletButton.layer.borderColor = UIColor.white.cgColor
		walletButton.layer.borderWidth = 3.0
		walletButton.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
		
		// Settings Button
		settingsButton = UIButton(frame: CGRect(x: 20.0 + MB_W + 10.0, y: 155.0, width: MB_W, height: MB_H))
		settingsButton.setTitle("settings", for: .normal)
		settingsButton.setTitleColor(UIColor.white, for: .normal)
		settingsButton.setTitleColor(UIColor.brPink(), for: .highlighted)
		settingsButton.backgroundColor = UIColor.black
		settingsButton.titleLabel?.font = UIFont(name: "OpenSans-Light", size: 19.0)
		settingsButton.titleLabel?.textAlignment = .center
		settingsButton.layer.borderColor = UIColor.brRed().cgColor
		settingsButton.layer.borderWidth = 3.0
		settingsButton.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
		
		// ==================== ANIMATIONS ====================
		
		if LoadWelcome == true {
			UIView.animate(withDuration: 0.8, delay: 0.2, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.0, options: [], animations: {
				self.welcomeLabel.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
			}) { (animated) in
				UIView.animate(withDuration: 0.5, delay: 0.4, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.0, options: [], animations: {
					self.welcomeLabel.layer.opacity = 0.2
					self.welcomeLabel.transform = CGAffineTransform(scaleX: 0.05, y: 0.05)
				}) { (animated) in
					self.welcomeLabel.removeFromSuperview()
					LoadWelcome = false
					self.loadMenuButton()
				}
			}
		} else {
			self.loadMenuButton()
		}
		
		
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	override func didChange(_ changeKind: NSKeyValueChange, valuesAt indexes: IndexSet, forKey key: String) {
		super.didChange(changeKind, valuesAt: indexes, forKey: key)
		self.amountEthLabel.text = String(format: "%.4f eth", AmountEth)
	}

	// MARK: - Animations
	
	let LOAD_TIME = 0.35
	
	private func loadMenuButton() {
		
		UIView.animate(withDuration: LOAD_TIME, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.0, options: [], animations: {
			self.view.addSubview(self.menuButton)
			self.menuButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
		}) { (animated) in
			self.loadBigRacksWalletLabel()
		}
		
	}
	
	private func loadBigRacksWalletLabel() {
		
		UIView.animate(withDuration: LOAD_TIME, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.0, options: [], animations: {
			self.view.addSubview(self.bigRacksWalletLabel)
			self.bigRacksWalletLabel.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
		}) { (animated) in
			self.loadAmountEthLabel()
		}
		
	}
	
	private func loadAmountEthLabel() {
		
		UIView.animate(withDuration: LOAD_TIME, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.0, options: [], animations: {
			self.view.addSubview(self.amountEthLabel)
			self.amountEthLabel.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
		}) { (animated) in
			self.loadExchangeRateEthLabel()
		}
		
	}
	
	private func loadExchangeRateEthLabel() {
		
		UIView.animate(withDuration: LOAD_TIME, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.0, options: [], animations: {
			self.view.addSubview(self.exchangeRateEthLabel)
			self.amountEthLabel.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
		}) { (animated) in
			self.loadExchangeRateEthImageView()
		}
		
	}
	
	private func loadExchangeRateEthImageView() {
		
		UIView.animate(withDuration: LOAD_TIME, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.0, options: [], animations: {
			self.view.addSubview(self.exchangeRateEthImageView)
			self.exchangeRateEthImageView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
		}) { (animated) in
			self.loadEthChart()
		}
		
	}
	
	private func loadEthChart() {
		
		UIView.animate(withDuration: LOAD_TIME, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.0, options: [], animations: {
			self.view.addSubview(self.ethChart)
			self.ethChart.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
		}) { (animated) in
			self.loadTimeButtons()
		}
		
	}
	
	// Other animations
	
	private func loadTimeButtons() {
		
		UIView.animate(withDuration: LOAD_TIME, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.0, options: [], animations: {
			self.view.addSubview(self.oneDayButton)
			self.view.addSubview(self.oneWeekButton)
			self.view.addSubview(self.oneMonthButton)
			self.view.addSubview(self.threeMonthButton)
			self.view.addSubview(self.oneYearButton)
			self.view.addSubview(self.allButton)
			self.view.addSubview(self.timeUnderlineView)
			
			self.oneDayButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
			self.oneWeekButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
			self.oneMonthButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
			self.threeMonthButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
			self.oneYearButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
			self.allButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
			self.timeUnderlineView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
		}) { (animated) in
			self.loadPayButton()
		}
		
	}
	
	private func loadPayButton() {
		
		UIView.animate(withDuration: LOAD_TIME, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.0, options: [], animations: {
			self.view.addSubview(self.payButton)
			self.payButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
		}) { (animated) in
			// Should be end of animations
		}
		
	}
	
	// MARK: - Underline Animations
	
	let UL_DUR = 0.1
	
	// 0
	@objc private func oneDayButtonPressed() {
		
		if timeUnderlineVal != 0 {
		
			UIView.animate(withDuration: UL_DUR, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.0, options: [], animations: {
				self.timeUnderlineView.frame = CGRect(x: 20.0, y: self.BTN_Y + 30.0, width: self.BTN_W, height: 2.0)
			}) { (animated) in
				self.timeUnderlineVal = 0
			}
			
		}
		
	}
	
	// 1
	@objc private func oneWeekButtonPressed() {
		
		if timeUnderlineVal != 1 {
			
			UIView.animate(withDuration: UL_DUR, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.0, options: [], animations: {
				self.timeUnderlineView.frame = CGRect(x: 20.0 + self.BTN_W, y: self.BTN_Y + 30.0, width: self.BTN_W, height: 2.0)
			}) { (animated) in
				self.timeUnderlineVal = 1
			}
			
		}
		
	}
	
	// 2
	@objc private func oneMonthButtonPressed() {
		
		if timeUnderlineVal != 2 {
			
			UIView.animate(withDuration: UL_DUR, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.0, options: [], animations: {
				self.timeUnderlineView.frame = CGRect(x: 20.0 + self.BTN_W*2.0, y: self.BTN_Y + 30.0, width: self.BTN_W, height: 2.0)
			}) { (animated) in
				self.timeUnderlineVal = 2
			}
			
		}
		
	}
	
	// 3
	@objc private func threeMonthButtonPressed() {
		
		if timeUnderlineVal != 3 {
		
			UIView.animate(withDuration: UL_DUR, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.0, options: [], animations: {
				self.timeUnderlineView.frame = CGRect(x: 20.0 + self.BTN_W*3.0, y: self.BTN_Y + 30.0, width: self.BTN_W, height: 2.0)
			}) { (animated) in
				self.timeUnderlineVal = 3
			}
			
		}
		
	}
	
	// 4
	@objc private func oneYearButtonPressed() {
		
		if timeUnderlineVal != 4 {
			
			UIView.animate(withDuration: UL_DUR, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.0, options: [], animations: {
				self.timeUnderlineView.frame = CGRect(x: 20.0 + self.BTN_W*4.0, y: self.BTN_Y + 30.0, width: self.BTN_W, height: 2.0)
			}) { (animated) in
				self.timeUnderlineVal = 4
			}
			
		}
		
	}
	
	// 5
	@objc private func allButtonPressed() {
		
		if timeUnderlineVal != 5 {
			
			UIView.animate(withDuration: UL_DUR, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.0, options: [], animations: {
				self.timeUnderlineView.frame = CGRect(x: 20.0 + self.BTN_W*5.0, y: self.BTN_Y + 30.0, width: self.BTN_W, height: 2.0)
			}) { (animated) in
				self.timeUnderlineVal = 5
			}
			
		}
		
	}

	// MARK: - Pay Transition
	
	@objc private func payPressed() {
		let vc = PayViewController()
		navigationController?.pushViewController(vc, animated: true)
	}
	
	// MARK: - Menu Button Pressed
	
	@objc private func menuButtonPressed() {
		
		if menuOpen == false {
			// Open it
			
			UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.0, options: [], animations: {
				
				self.amountEthLabel.frame.origin.y += 135.0
				self.exchangeRateEthLabel.frame.origin.y += 135.0
				self.exchangeRateEthImageView.frame.origin.y += 135.0
				self.ethChart.frame.origin.y += 135.0
				self.oneDayButton.frame.origin.y += 135.0
				self.oneWeekButton.frame.origin.y += 135.0
				self.oneMonthButton.frame.origin.y += 135.0
				self.threeMonthButton.frame.origin.y += 135.0
				self.oneYearButton.frame.origin.y += 135.0
				self.allButton.frame.origin.y += 135.0
				self.timeUnderlineView.frame.origin.y += 135.0
				self.payButton.frame.origin.y += 135.0
				
			}) { (animated) in
				
				UIView.animate(withDuration: 0.2, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.0, options: [], animations: {
					
					self.view.addSubview(self.historyButton)
					self.historyButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
					
				}, completion: { (animated) in
					
					UIView.animate(withDuration: 0.2, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.0, options: [], animations: {
						
						self.view.addSubview(self.verificationButton)
						self.verificationButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
						
					}, completion: { (animated) in
						
						UIView.animate(withDuration: 0.2, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.0, options: [], animations: {
							
							self.view.addSubview(self.walletButton)
							self.walletButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
							
						}, completion: { (animated) in
							
							UIView.animate(withDuration: 0.2, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.0, options: [], animations: {
								
								self.view.addSubview(self.settingsButton)
								self.settingsButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
								
							}, completion: { (animated) in
								
								// Nothing
								
							})
							
						})
						
					})
					
				})
				
			}
			
			
			menuOpen = true
		} else {
			// Close it
			
			UIView.animate(withDuration: 0.3, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.0, options: [], animations: {
				
				self.settingsButton.transform = CGAffineTransform(scaleX: 0.05, y: 0.05)
				self.settingsButton.removeFromSuperview()
				
			}, completion: { (animated) in

				UIView.animate(withDuration: 0.3, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.0, options: [], animations: {
					
					self.walletButton.transform = CGAffineTransform(scaleX: 0.05, y: 0.05)
					self.walletButton.removeFromSuperview()
					
				}, completion: { (animated) in
					
					UIView.animate(withDuration: 0.3, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.0, options: [], animations: {
						
						self.verificationButton.transform = CGAffineTransform(scaleX: 0.05, y: 0.05)
						self.verificationButton.removeFromSuperview()
						
					}, completion: { (animated) in
					
						UIView.animate(withDuration: 0.3, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.0, options: [], animations: {
							
							self.historyButton.transform = CGAffineTransform(scaleX: 0.05, y: 0.05)
							self.historyButton.removeFromSuperview()
							
						}, completion: { (animated) in
							
							UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.0, options: [], animations: {
								
								self.amountEthLabel.frame.origin.y -= 135.0
								self.exchangeRateEthLabel.frame.origin.y -= 135.0
								self.exchangeRateEthImageView.frame.origin.y -= 135.0
								self.ethChart.frame.origin.y -= 135.0
								self.oneDayButton.frame.origin.y -= 135.0
								self.oneWeekButton.frame.origin.y -= 135.0
								self.oneMonthButton.frame.origin.y -= 135.0
								self.threeMonthButton.frame.origin.y -= 135.0
								self.oneYearButton.frame.origin.y -= 135.0
								self.allButton.frame.origin.y -= 135.0
								self.timeUnderlineView.frame.origin.y -= 135.0
								self.payButton.frame.origin.y -= 135.0
								
							}) { (animated) in
								
								// Nothing
								
							}
							
						})
						
					})
					
				})
				
			})
			
			
			
			menuOpen = false
		}
		
	}
	
}
