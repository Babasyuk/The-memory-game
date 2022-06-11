//
//  Card.swift
//  Concentration 1
//
//  Created by Артём on 18.12.2021.
//  Copyright © 2021 Артём Бабасюк. All rights reserved.
//

import Foundation


struct Card {
    var isFaceUp = false // Карточка лицом вверх перевернута - изначально говорим, что она не будет перевернута лицом вверх
    var isMatched = false // И изначально карточка не будет совпавшей
    var identifier: Int // У каждой карточки будет свой уникальный номер
    
    static var identifierNumber = 0
    static func identifierGenerator() -> Int {
        identifierNumber += 1
        return identifierNumber // каждый раз будет возвращаться новая цифра
    } // Создал функцию где будет генерация номера карточек
    init() {
        self.identifier = Card.identifierGenerator()
    }
    
}
