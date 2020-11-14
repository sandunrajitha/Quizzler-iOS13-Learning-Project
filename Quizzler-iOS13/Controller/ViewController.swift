//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var option1: UIButton!
    @IBOutlet weak var option2: UIButton!
    @IBOutlet weak var option3: UIButton!
    
    
    var quizBrain = QuizBrain()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        updateUI()
    }
    
    @IBAction func answerButtonClicked(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let isCorrect = quizBrain.checkAnswer(userAnswer)
        
        if isCorrect {
            sender.backgroundColor = UIColor.systemGreen
        } else {
            sender.backgroundColor = UIColor.systemRed
        }
        
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.25, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        option1.setTitle(quizBrain.getOption(1), for: .normal)
        option2.setTitle(quizBrain.getOption(2), for: .normal)
        option3.setTitle(quizBrain.getOption(3), for: .normal)
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        option1.backgroundColor = UIColor.clear
        option2.backgroundColor = UIColor.clear
        option3.backgroundColor = UIColor.clear
    }
    
}

