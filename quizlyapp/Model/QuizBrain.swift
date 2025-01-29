//
//  QuizBrain.swift
//  quizlyapp
//
//  Created by Hajrudin Imamovic on 29/01/2025.
//

import Foundation

struct QuizBrain {
    let quizCategories = QuestionCategories()
    var currentCategory : [Question] = QuestionCategories().generalQuestions
    var currentScore : Int = 0;
    var quesstionNum : Int = 1;
    var currentQuestion : Question = Question(q: "Default", a : true)
    
    mutating func setQuizCAtegory(_ chosenCategory : String){
        if chosenCategory == "History" {
            currentCategory = quizCategories.historyQuestions
        } else if chosenCategory == "Sports" {
            currentCategory = quizCategories.sportsQuestions
        } else {
            currentCategory = quizCategories.generalQuestions
        }
    }
    
    mutating func getQuestion() -> Question {
        currentQuestion = currentCategory.randomElement()!
        return currentQuestion
    }
    
    func getQuestionNum() -> Int{
        return quesstionNum
    }
    
    func getUserScore() -> Int{
        return currentScore
    }
    
    mutating func checkAnswer(_ userAnswer : String) -> Bool {
        var check : Bool
        
        if userAnswer == "True"{
            check = true
        } else {
            check = false
        }
        
        if check == currentQuestion.answer{
            quesstionNum += 1
            currentScore += 1
            return true
        } else {
            quesstionNum += 1
            return false
        }
    }
    
    mutating func resetGame(){
        currentScore = 0
        quesstionNum = 0
    }
    
}
