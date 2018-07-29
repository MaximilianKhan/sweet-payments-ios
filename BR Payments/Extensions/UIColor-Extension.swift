//
//  UIColor-Extension.swift
//  BR Payments
//
//  Created by Max Khan on 7/28/18.
//  Copyright © 2018 Max Khan. All rights reserved.
//

import UIKit

extension UIColor {
	
	static func brPink() -> UIColor {
		return UIColor(red: 255, green: 64,blue: 233)
	}
	
	static func brRed() -> UIColor {
		return UIColor(red: 208, green: 2, blue: 27)
	}
	
	static func brYellow() -> UIColor {
		return UIColor(red: 255, green: 239, blue: 42)
	}
	
	static func brOrange() -> UIColor {
		return UIColor(red: 155, green: 130, blue: 26)
	}
	
	static func brGreen() -> UIColor {
		return UIColor(red: 128, green: 245, blue: 0)
	}
	
	convenience init(red: Int, green: Int, blue: Int) {
		assert(red >= 0 && red <= 255, "Invalid red component")
		assert(green >= 0 && green <= 255, "Invalid green component")
		assert(blue >= 0 && blue <= 255, "Invalid blue component")
		
		self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
	}
	
	class func rgb(fromHex: Int) -> UIColor {
		
		let red =   CGFloat((fromHex & 0xFF0000) >> 16) / 0xFF
		let green = CGFloat((fromHex & 0x00FF00) >> 8) / 0xFF
		let blue =  CGFloat(fromHex & 0x0000FF) / 0xFF
		let alpha = CGFloat(1.0)
		
		return UIColor(red: red, green: green, blue: blue, alpha: alpha)
	}
	
}
