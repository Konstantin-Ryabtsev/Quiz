//
//  AnimalType.swift
//  Quiz
//
//  Created by Konstantin Ryabtsev on 04.01.2022.
//

enum AnimalType: Character {
    case dog = "🐶"
    case cat = "🐱"
    case rabbit = "🐰"
    case turtle = "🐢"
    
    var definition: String {
        switch self {
        case .dog:
            return "Вы черезвычайно активны. Вы окружаете себя тем, кого любите и наслаждаетесь взаимодействием с друзьями."
        case .cat:
            return "Вы бесшабашный, но кроткий. Предпочитаете гулять сами по себе."
        case .rabbit:
            return "Вам нравится все мягкое. Вы здоровы и полны энергии."
        case .turtle:
            return "Вы умнее ваших лет, фокусируетесь на цели. Вы знаете, что медленные, но упорные всегда выигрывают."
        }
    }
}
