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

	override func viewWillTransition(to size: CGSize, with coordinator: any UIViewControllerTransitionCoordinator) {
		coordinator.animate { _ in
			for label in self.labels {
				label.layer.cornerRadius = label.bounds.width / 2
				label.clipsToBounds = true
			}
		}
	}
	
	override func viewDidAppear(_ animated: Bool) {
		let nums = Int.uniqueRandom(in: 1 ... 45, count: 7)
		
		for (index,label) in labels.enumerated() {
			label.setLottoNum(nums[index])
			if label == labels.last {
				label.setLottoNum(nums[index], with: .purple, textColor: .white)
			}else{
				label.setLottoNum(nums[index])
			}
		}
	}
}
