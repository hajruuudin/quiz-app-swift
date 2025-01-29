//
//  Question.swift
//  quizlyapp
//
//  Created by Hajrudin Imamovic on 29/01/2025.
//

import Foundation

struct Question{
    let question : String;
    let answer : Bool;
    
    init(q: String, a: Bool) {
        self.question = q
        self.answer = a
    }
}
