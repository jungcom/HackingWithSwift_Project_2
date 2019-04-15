//
//  ViewController.swift
//  HackingWithSwift_Project_2
//
//  Created by Anthony Lee on 4/10/19.
//  Copyright © 2019 anthonyLee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var buttonOne: UIButton!
    @IBOutlet var buttonTwo: UIButton!
    @IBOutlet var buttonThree: UIButton!
    @IBOutlet var scoreLabel: UILabel!
    
    @IBOutlet var restartButton: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var questionsAsked = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        countries.append("estonia")
        countries.append("france")
        countries.append("germany")
        countries.append("ireland")
        countries.append("italy")
        countries.append("monaco")
        countries.append("nigeria")
        countries.append("poland")
        countries.append("russia")
        countries.append("spain")
        countries.append("uk")
        countries.append("us")
        
        buttonOne.layer.borderColor = UIColor.lightGray.cgColor
        buttonTwo.layer.borderColor = UIColor.lightGray.cgColor
        buttonThree.layer.borderColor = UIColor.lightGray.cgColor
        
        buttonOne.layer.borderWidth = 1
        buttonTwo.layer.borderWidth = 1
        buttonThree.layer.borderWidth = 1
        
        askQuestion()
    }
    
    func askQuestion(){
        questionsAsked += 1
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        navigationItem.title = "\(countries[correctAnswer].uppercased())"
        scoreLabel.text = "Your Score : \(score)"
        
        buttonOne.setImage(UIImage(named: countries[0]), for: .normal)
        buttonTwo.setImage(UIImage(named: countries[1]), for: .normal)
        buttonThree.setImage(UIImage(named: countries[2]), for: .normal)
        
        
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        
        var title: String
        var message: String
        
        if questionsAsked == 10{
            title = "Final Score"
            let ac = UIAlertController(title: title, message: "Your score is \(score) of out 10", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Dismiss", style: .cancel) { (_) in
            }
            ac.addAction(alertAction)
            present(ac, animated: true, completion: nil)
            score = 0
            return
        }
        
        if sender.tag == correctAnswer{
            title = "Correct"
            score += 1
            message = "Your score is \(score)"
        } else {
            title = "Incorrect"
            message = "Wrong! That is the flag of \(countries[sender.tag].uppercased())"
            score -= 1
        }
        
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Continue", style: .default) { (_) in
            self.askQuestion()
        }
        
        ac.addAction(alertAction)
        present(ac, animated: true, completion: nil)
    }
    
    @IBAction func restartTapped(_ sender: UIButton) {
        score = 0
        questionsAsked = 0
        askQuestion()
    }
    
}

