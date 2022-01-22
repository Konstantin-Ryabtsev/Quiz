//
//  Question.swift
//  Quiz
//
//  Created by Konstantin Ryabtsev on 04.01.2022.
//

struct Question {
    let text: String
    let type: ResponceType
    let answers: [Answer]
    
    static let all: [Question] = [
        Question(text: "Какую еду вы предпочитаете?", type: .image, answers: [
            Answer(text: "meat", type: .dog),
            Answer(text: "fish", type: .cat),
            Answer(text: "carrot", type: .rabbit),
            Answer(text: "corn", type: .turtle),
        ]),
        Question(text: "Когда вам страшно, Вы", type: .single, answers: [
            Answer(text: "Убегаете", type: .rabbit),
            Answer(text: "Нападаете", type: .dog),
            Answer(text: "Не бывает страшно", type: .turtle),
            Answer(text: "Ведете себя осторожно", type: .cat),
        ]),
        Question(text: "Что вы любите делать?", type: .multiply, answers: [
            Answer(text: "Плавать", type: .turtle),
            Answer(text: "Спать", type: .cat),
            Answer(text: "Обниматься", type: .rabbit),
            Answer(text: "Бегать", type: .dog),
        ]),
        Question(text: "Любите ли вы поездки на машине?", type: .range, answers: [
            Answer(text: "Ненавижу", type: .cat),
            Answer(text: "Нервничаю", type: .rabbit),
            Answer(text: "Не замечает", type: .turtle),
            Answer(text: "Обожаю", type: .dog),
        ]),
    ]
}
