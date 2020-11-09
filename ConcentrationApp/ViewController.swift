//
//  ViewController.swift
//  ConcentrationApp
//
//  Created by Thotsana Mabotsa on 2020/11/09.
//

import UIKit

class ViewController: UIViewController {
	
	lazy var game: Concentration = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
	
	var flipCount = 0 {
		didSet {
			flipCountLabel.text = "Flips: \(flipCount)"
		}
	}
	
	@IBOutlet weak var flipCountLabel: UILabel!
	
	@IBOutlet var cardButtons: [UIButton]!
		
	@IBAction func touchCard(_ sender: UIButton) {
		flipCount += 1
		if let cardNumber = cardButtons.index(of: sender) {
			game.chooseCard(at: cardNumber)
			updateViewFromModel()
		}
	}
	
	func updateViewFromModel() {
		for index in cardButtons.indices {
			let button = cardButtons[index]
			let card = game.cards[index]
			if card.isFaceUp {
				button.setTitle(emoji(for: card), for: UIControl.State.normal)
				button.backgroundColor = UIColor.white
			} else {
				button.setTitle("", for: UIControl.State.normal)
				button.backgroundColor = card.isMatched ? UIColor.clear : UIColor.orange
			}
		}
	}
	
	func flipCard(withEmoji emoji: String, on button: UIButton) {
		if button.currentTitle == emoji {
			
		} else {
			
		}
	}
	
	var emojiChoices = ["👻","🎃","🦇","😈","🍭","🍬","🍎","😱","🕷"]
	
	var emoji = [Int: String]()
	
	func emoji(for card: Card) -> String {
		if emoji[card.identifier] == nil, emojiChoices.count > 0 {
			let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
			emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
		}
		return emoji[card.identifier] ?? "?"
	}
	
}

