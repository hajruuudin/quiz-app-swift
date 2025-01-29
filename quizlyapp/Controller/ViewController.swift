//
//  ViewController.swift
//  quizlyapp
//
//  Created by Hajrudin Imamovic on 29/01/2025.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var headerSub: UILabel!
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var headerMessage: UILabel!
    @IBOutlet weak var answerButtonsContainer: UIStackView!
    @IBOutlet weak var categoryButtonsContainer: UIStackView!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func categoryButtonPressed(_ sender: UIButton) {
        let category = sender.titleLabel!.text!
        quizBrain.setQuizCAtegory(category)
        categoryButtonsContainer.isHidden = true
        answerButtonsContainer.isHidden = false
        headerMessage.isHidden = true
        headerSub.isHidden = true
        questionText.isHidden = false
        updateUi()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let category = sender.titleLabel!.text!
        _ = quizBrain.checkAnswer(category)
        updateUi()
    }
    
    func updateUi(){
        if quizBrain.getQuestionNum() >= 10{
            updateUiEnd()
        } else {
            questionText.text = quizBrain.getQuestion().question
        }
        
    }
    
    func updateUiEnd(){
        let userScore = quizBrain.getUserScore()
        quizBrain.resetGame()
        categoryButtonsContainer.isHidden = false
        answerButtonsContainer.isHidden = true
        headerMessage.isHidden = false
        headerSub.isHidden = false
        questionText.isHidden = true
        headerSub.text = "Done! Previous score: \(userScore)/10"
    }
    

}

