//
//  AnimalType.swift
//  Quiz
//
//  Created by Konstantin Ryabtsev on 04.01.2022.
//

enum AnimalType: Character {
    case dog = "🐕"
    case cat = "🐈"
    case rabbit = "🐇"
    case turtle = "🐢"
    
    var definition: String {
        switch self {
        case .dog:
            return "Вы мудрый челорвек, с отличной интуицией и богатым жизненным опытом. Начитанны и эрудированны."
        case .cat:
            return "Вы умны, наблюдательны, не любите насилия над собой и не приемлете жестких приказов. "
        case .rabbit:
            return "Ва осторожны и несуетливы. Легки в общении, интеллигенты и остроумны."
        case .turtle:
            return "Вы точны и плодотворны. Редко ошибаетесь и учитесь в отличие от многих на чужих ошибках."
        }
    }
}
