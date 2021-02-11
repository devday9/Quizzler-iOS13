//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Deven Day on 2/10/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answers: [String]
    let correctAnswer: String
    
    init(q: String, a: [String], ca: String) {
        text = q
        answers = a
        correctAnswer = ca
    }
}
