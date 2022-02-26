//
//  ViewController.swift
//  Flashcards
//
//  Created by Maya Kuzak on 2/26/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var card: UIView!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        card.layer.cornerRadius = 20.0
        questionLabel.layer.cornerRadius = 20.0
        answerLabel.layer.cornerRadius = 20.0
        buttonOne.layer.cornerRadius = 20.0
        buttonTwo.layer.cornerRadius = 20.0
        buttonThree.layer.cornerRadius = 20.0
        questionLabel.clipsToBounds = true
        answerLabel.clipsToBounds = true
        buttonOne.clipsToBounds = true
        buttonTwo.clipsToBounds = true
        buttonThree.clipsToBounds = true
                
        card.layer.shadowRadius = 15.0
        card.layer.shadowOpacity = 0.2
        
        buttonOne.layer.borderWidth = 2.0
        buttonTwo.layer.borderWidth = 2.0
        buttonThree.layer.borderWidth = 2.0
        
        buttonOne.layer.borderColor = UIColor.gray.cgColor
        buttonTwo.layer.borderColor = UIColor.gray.cgColor
        buttonThree.layer.borderColor = UIColor.gray.cgColor
        
    }

    @IBAction func didTapOnFlashcard(_ sender: Any) {
        
        if questionLabel.isHidden == false {
            questionLabel.isHidden = true
        }
        else {
            questionLabel.isHidden = false
        }
    }
    
    @IBAction func tappedOne(_ sender: Any) {
        buttonOne.isHidden = true
    }
    
    @IBAction func tappedTwo(_ sender: Any) {
        questionLabel.isHidden = true
    }
    
    @IBAction func tappedThree(_ sender: Any) {
        buttonThree.isHidden = true
    }
    
}

