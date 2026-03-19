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
	
	
	@IBOutlet var labels: [UILabel]!
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	func getColors(from number: Int?) -> (backgroundColor: UIColor, textColor: UIColor){
		guard let number else{
			return (UIColor.purple, UIColor.white)
		}
		switch number {
		case 1...10:
			return (UIColor.red, UIColor.white)
		case 11...20:
			return (UIColor.green, UIColor.black)
		case 21...30:
			return (UIColor.blue, UIColor.white)
		case 31...40:
			return (UIColor.yellow, UIColor.black)
		case 41...45:
			return (UIColor.gray, UIColor.white)
		default:
			return (UIColor.purple, UIColor.white)
		}
	}

	override func viewWillTransition(to size: CGSize, with coordinator: any UIViewControllerTransitionCoordinator) {
		coordinator.animate { _ in
			for label in self.labels {
				label.layer.cornerRadius = label.bounds.width / 2
				label.clipsToBounds = true
			}
		}
	}
	
	override func viewDidAppear(_ animated: Bool) {
		var nums = [Int]()
		while nums.count < labels.count {
			let rnd = Int.random(in: 1...45)
			if !nums.contains(rnd) {
				nums.append(rnd)
			}
		}
		nums.sort()
		
		for (index,label) in labels.enumerated() {
			label.layer.cornerRadius = numLabel1.bounds.width / 2
			label.clipsToBounds = true
			
			label.text = "\(nums[index])"
			
			label.backgroundColor = getColors(from:nums[index]).backgroundColor
			label.textColor = getColors(from:nums[index]).textColor
		}
		
		let colors = getColors(from:nil)
		numLabel7.backgroundColor = colors.backgroundColor
		numLabel7.textColor = colors.textColor
	}

}
