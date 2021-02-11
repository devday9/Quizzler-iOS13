//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Properties
    var quizBrain = QuizBrain()

    //MARK: - Outlets
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    //MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupQuestion()
    }
    
    //MARK: - Actions
    @IBAction func answerButtonTapped(_ sender: UIButton) {
        answerSelected(button: sender)
    }
    
    //MARK: - Helper Functions
    @objc func setupQuestion() {
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score : \(quizBrain.getScore())"
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }
    
    func answerQuestion() {
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(setupQuestion), userInfo: nil, repeats: false)
    }
    
    func answerSelected(button: UIButton) {
        
        let userAnswer = button.currentTitle
        let userGotItRight = quizBrain.checkAnswer(userAnswer ?? "")
        
        if userGotItRight {
            button.backgroundColor = UIColor.green
        } else {
            button.backgroundColor = UIColor.red
        }
        
        answerQuestion()
    }
}//END OF CLASS

