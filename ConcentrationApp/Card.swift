//
//  Card.swift
//  ConcentrationApp
//
//  Created by Thotsana Mabotsa on 2020/11/09.
//

import Foundation

struct Card {
	var isFaceUp = false
	var isMatched = false
	var identifier: Int
	
	static var identifierFactory = 0
	
	static func getUniqueIdentifier() -> Int {
		identifierFactory += 1
		return identifierFactory
	}
	
	init() {
		self.identifier = Card.getUniqueIdentifier()
	}
}
