//
//  Concentration.swift
//  ConcentrationApp
//
//  Created by Thotsana Mabotsa on 2020/11/09.
//

import Foundation

class Concentration {
	
	var cards = Array<Card>()
	
	var indexOfOneAndOnlyOneFaceUpCard: Int?
	
	func chooseCard(at index: Int) {
		if !cards[index].isMatched {
			if let matchIndex = indexOfOneAndOnlyOneFaceUpCard, matchIndex != index {
				// check if cards match
				if cards[matchIndex].identifier == cards[index].identifier {
					cards[matchIndex].isMatched = true
					cards[index].isMatched = true
				}
				cards[index].isFaceUp = true
				indexOfOneAndOnlyOneFaceUpCard = nil
			} else {
				// either no cards or 2 cards are face up
				for flipDownIndex in cards.indices {
					cards[flipDownIndex].isFaceUp = false
				}
				cards[index].isFaceUp = true
				indexOfOneAndOnlyOneFaceUpCard = index
			}
		}
	}
	
	init(numberOfPairsOfCards: Int) {
		for _ in 1 ... numberOfPairsOfCards {
			let card = Card()
			cards += [card, card]
		}
		// TODO: Shuffle the cards
		// Shuffle this cards.
			
	}
	
}
