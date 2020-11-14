//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Sandun Liyanage on 11/14/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let question: String
    let answer: String
    
    init(q: String, a: String) {
        question = q
        answer = a
    }
}
