//
//  ViewController.swift
//  Concentration 1
//
//  Created by Артём on 14.12.2021.
//  Copyright © 2021 Артём Бабасюк. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var game = ConcentrationGame(numberOfPairsCards: (buttonCollection.count + 1) / 2 ) // чтобы связать контроллер с моделью создал экземпляр класс
    
    var touches = 0 { // 2. Сделал переменную, которая следит за колличеством нажатий на кнопку
        didSet { // У этой переменной есть наблюдатель, который следит за значением переменной. Новое значение отправляет на Label
            touchLabel.text = "Touches: \(touches)"

        }
    }
    
    // 4. Сделал функцию, где прописана логика как переворачивать карточки
    /* func flipButton (emoji: String, button: UIButton)  {
        if  button.currentTitle == emoji {
            button.setTitle( " ", for: .normal)
            button.backgroundColor = #colorLiteral(red: 0, green: 0.5778794885, blue: 1, alpha: 1)
        } else {
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }*/
    
    var emojiCollection = ["🦇","🐢","🦎","🦑","🦍","🦘","🐐","🐆","🐪","🦩","🦓","🐋"] // 3. Сделал массив из emoji
    
    var emojiDictionary = [Int:String]()
    
    func emojiIdentifier(for card: Card) -> String {
        if emojiDictionary[card.identifier] == nil {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiCollection.count)))
            emojiDictionary[card.identifier] = emojiCollection.remove(at: randomIndex)
        }
        return emojiDictionary[card.identifier] ?? "?"
    }
    
    func updateViewFromModel() {
        for index in buttonCollection.indices {
            let button = buttonCollection[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emojiIdentifier(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle( " ", for: .normal) //нужно убрать эмодзи и сделать фон синим
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)
            }
        }
    }
    
    // 1. Соединение View(вида, пользовательского интерфейса) и Controller(контроллера)
    @IBOutlet var buttonCollection: [UIButton]! // Сделал коллекцию из кнопок
    @IBOutlet weak var touchLabel: UILabel!  // Сделал Label
    @IBAction func buttonAction(_ sender: UIButton) { //Cделал действие для всех кнопок
        touches += 1
        // В функции нажатия на кнопку мы вызываем функцию где прописана логика как нужно переворачивать карточки: сравниваю индексы массива эмодзи и индексы массива кнопок
        if let buttonIndex =  buttonCollection.firstIndex(of: sender) {
            game.chooseCard(at: buttonIndex) //dspsdf. функцию из класса
            updateViewFromModel()

        }
    }

}




