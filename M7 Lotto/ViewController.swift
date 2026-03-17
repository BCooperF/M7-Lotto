//
//  ViewController.swift
//  M7 Lotto
//
//  Created by Faesy, Bradley C. on 3/17/26.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var numLabel1: UILabel!
	@IBOutlet weak var numLabel2: UILabel!
	@IBOutlet weak var numLabel3: UILabel!
	@IBOutlet weak var numLabel4: UILabel!
	@IBOutlet weak var numLabel5: UILabel!
	@IBOutlet weak var numLabel6: UILabel!
	@IBOutlet weak var numLabel7: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	func getColor(from number: Int?) -> (backgroundColor: UIColor, UIColor){
		guard let number else{
			return (UIColor.purple, UIColor.white)
		}
		
		switch number {
		case 1 ... 10:
			return (UIColor.red, UIColor.green)
		case 11 ... 20:
			return (UIColor.red, UIColor.green)
		case 21 ... 30:
			return (UIColor.red, UIColor.green)
		case 31 ... 40:
			return (UIColor.red, UIColor.green)
		case 41 ... 50:
			return (UIColor.red, UIColor.green)
		default:
			return (UIColor.red, UIColor.green)
		}
	}

	override func viewDidAppear(_ animated: Bool) {
		let labels = [numLabel1!,numLabel2!,numLabel3!,numLabel4!,numLabel5!,numLabel6!,numLabel7!]
		var nums = [Int]()
		while nums.count < labels.count {
			let rnd = Int.random(in: 1...45)
			if !nums.contains(rnd) {
				nums.append(rnd)
			}
		}
		let sortedNums = nums.sorted()
		
		for (index,label) in labels.enumerated() {
			label.layer.cornerRadius = numLabel1.bounds.width / 2
			label.clipsToBounds = true
			
			label.text = "\(sortedNums[index])"
			
			label.backgroundColor = getColor(from: sortedNums[Index]).backgroundColor
		}
		
		let colors = getColors(from: nil)
		numLabel7.backgroundColor = UIColor.purple
		numLabel7.textColor = UIColor.white
	}
}
