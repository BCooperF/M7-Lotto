//
//  Int+Lotto.swift
//  M7 Lotto
//
//  Created by Faesy, Bradley C. on 3/31/26.
//

import Foundation

extension Int {
	static func uniqueRandom(in range: ClosedRange<Int>, count: Int) -> [Int] {
		var nums = [Int]()
		while nums.count < count {
			let rnd = Int.random(in: 1...45)
			if !nums.contains(rnd) {
				nums.append(rnd)
			}
		}
		nums.sort()
		return nums
	}
}
