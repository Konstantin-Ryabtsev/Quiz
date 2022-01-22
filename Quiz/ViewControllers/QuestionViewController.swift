//
//  QuestionViewController.swift
//  Quiz
//
//  Created by Konstantin Ryabtsev on 03.01.2022.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!
    
    @IBOutlet weak var multiplyStackView: UIStackView!
    @IBOutlet var multiLables: [UILabel]!
    @IBOutlet var multiSwitches: [UISwitch]!
    
    @IBOutlet weak var rangedStackView: UIStackView!
    @IBOutlet var rangedLabels: [UILabel]!
    @IBOutlet weak var rangedSlider: UISlider!
    
    @IBOutlet weak var imagesStackView: UIStackView!
    @IBOutlet var imageButtons: [UIButton]!
    
    @IBOutlet weak var questionProgressView: UIProgressView!
        
    var answerChoosen = [Answer]()
    
    private var currentAnswers: [Answer] {
        currentQuestion.answers
    }
    private var currentQuestion: Question {
        Question.all[questionIndex]
    }
    var questionIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        rangedSlider.maximumValue = 0.99999
        updateUI()
    }
    
    func updateUI() {
        func updateSingleStack() {
            singleStackView.isHidden = false
            for (index, button) in singleButtons.enumerated() {
                button.setTitle(nil, for: [])
                button.tag = index
            }
            for (button, answer) in zip(singleButtons, currentAnswers) {
                button.setTitle(answer.text, for: [])
            }
        }
        
        func updateMultiplyStack() {
            multiplyStackView.isHidden = false
            for label in multiLables {
                label.text = nil
            }
            for multiSwitch in multiSwitches {
                multiSwitch.isOn = false
            }
            for (label, answer) in zip(multiLables, currentAnswers) {
                label.text = answer.text
            }
        }
        
        func updateRangeStack() {
            rangedStackView.isHidden = false
            rangedLabels.first?.text = currentAnswers.first?.text
            rangedLabels.last?.text = currentAnswers.last?.text
        }
        
        func updateImageStack() {
            imagesStackView.isHidden = false
            for (index, button) in imageButtons.enumerated() {
                button.setTitle(nil, for: [])
                button.setImage(UIImage(), for: [])
                button.tag = index
            }
            for (button, answer) in zip(imageButtons, currentAnswers) {
                button.setTitle("", for: [])
                button.setImage(UIImage(named: answer.text), for: [])
            }
            
        }
        
        for stackView in [singleStackView, multiplyStackView, rangedStackView, imagesStackView] {
            stackView?.isHidden = true
        }
        
        let totalProgress = Float(questionIndex) / Float(Question.all.count)
        
        navigationItem.title = "Вопрос № \(questionIndex + 1)"
        questionLabel.text = currentQuestion.text
        questionProgressView.setProgress(totalProgress, animated: true)
        
        switch currentQuestion.type {
        case .single:
            updateSingleStack()
        case .multiply:
            updateMultiplyStack()
        case .range:
            updateRangeStack()
        case .image:
            updateImageStack()
        }
    }
    
    func nextQuestion() {
        questionIndex += 1
        if questionIndex < Question.all.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "Results Segue", sender: nil)
        }
    }
    
    @IBAction func singleButtonPressed(_ sender: UIButton) {
        let index = sender.tag
        guard 0 <= index && index < currentAnswers.count else {
            return
        }
        answerChoosen.append(currentAnswers[index])
        nextQuestion()
    }
    
    @IBAction func multiButtonPressed(_ sender: Any) {
        for (index, multiSwitch) in multiSwitches.enumerated() {
            if multiSwitch.isOn && index < currentAnswers.count {
                let answer = currentAnswers[index]
                answerChoosen.append(answer)
            }
        }
        nextQuestion()
    }
    
    @IBAction func rangeButtonPressed(_ sender: Any) {
        let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1)))
        if index < currentAnswers.count {
            let answer = currentAnswers[index]
            answerChoosen.append(answer)
        }
        nextQuestion()
    }
    
    @IBAction func imageButtonPressed(_ sender: UIButton) {
        singleButtonPressed(sender)
        
        //print(#line, #function, "button \(sender.tag) pressed")
        //nextQuestion()
    }
    
    @IBSegueAction func resultsSegue(_ coder: NSCoder) -> ResultsViewController? {
        return ResultsViewController(coder: coder, answerChoosen)
    }
}
