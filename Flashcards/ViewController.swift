//
//  ViewController.swift
//  Flashcards
//
//  Created by Maya Kuzak on 2/26/22.
//

import UIKit

struct Flashcard {
    var question: String
    var answer: String
    var extra1: String
    var extra2: String
}

class ViewController: UIViewController {

    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var card: UIView!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
    
    var flashcards = [Flashcard]()
    var currentIndex = 0
    var correctAnswerButton: UIButton!
    var wrong1 = ""
    var wrong2 = ""
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //make flashcardc pop by starting out smaller
        card.alpha = 0.0
        card.transform = CGAffineTransform.identity.scaledBy(x: 0.75, y: 0.75)
        UIView.animate(withDuration: 0.6, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [], animations: {
            self.card.alpha = 1.0
            self.card.transform = CGAffineTransform.identity
        })
        
        buttonOne.alpha = 0.0
        buttonTwo.alpha = 0.0
        buttonThree.alpha = 0.0
        card.transform = CGAffineTransform.identity.scaledBy(x: 0.75, y: 0.75)
        UIView.animate(withDuration: 0.6, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [], animations: {
            self.card.alpha = 1.0
            self.card.transform = CGAffineTransform.identity
        })
        buttonOne.transform = CGAffineTransform.identity.scaledBy(x: 0.75, y: 0.75)
        UIView.animate(withDuration: 0.6, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [], animations: {
            self.buttonOne.alpha = 1.0
            self.buttonOne.transform = CGAffineTransform.identity
        })
        buttonTwo.transform = CGAffineTransform.identity.scaledBy(x: 0.75, y: 0.75)
        UIView.animate(withDuration: 0.6, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [], animations: {
            self.buttonTwo.alpha = 1.0
            self.buttonTwo.transform = CGAffineTransform.identity
        })
        buttonThree.transform = CGAffineTransform.identity.scaledBy(x: 0.75, y: 0.75)
        UIView.animate(withDuration: 0.6, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [], animations: {
            self.buttonThree.alpha = 1.0
            self.buttonThree.transform = CGAffineTransform.identity
        })
    }
    
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
        
        buttonOne.setTitle("", for: .normal)
        buttonThree.setTitle("", for: .normal)
        
        
        if flashcards.count == 0 {
            updateFlashcard(question: "What's the capital of Brazil?", answer: "Brasilia", extra1: "Río de Janerio", extra2: "São Paulo", isExisting: false)
        }
        else {
            updateLabels()
            updateNextPrevButtons()
        }
        deleteButton.superview?.bringSubviewToFront(deleteButton)
        editButton.superview?.bringSubviewToFront(editButton)
        
    }

    @IBAction func didTapOnFlashcard(_ sender: Any) {
        flipFlashcard()
       
    }
    
    func flipFlashcard() {
        
        UIView.transition(with: card, duration: 0.3, options: .transitionFlipFromRight, animations: {
                if self.questionLabel.isHidden == false {
                    self.questionLabel.isHidden = true
                }
                else {
                    self.questionLabel.isHidden = false
                }
        })
        deleteButton.bringSubviewToFront(deleteButton)
        editButton.bringSubviewToFront(editButton)
    }

    func animateCardOut() {
        UIView.animate(withDuration: 0.3, animations: {
            self.card.transform = CGAffineTransform.identity.translatedBy(x: -300.0, y: 0.0)
        }, completion: { finished in
            self.animateCardIn()
            self.updateLabels()
        })
        
    }
    
    func animateCardIn() {
        
        card.transform = CGAffineTransform.identity.translatedBy(x: 300.0, y: 0.0)
        UIView.animate(withDuration: 0.3) {
            self.card.transform = CGAffineTransform.identity
            
        }
    }
    
    func revAnimateCardOut() {
        UIView.animate(withDuration: 0.3, animations: {
            self.card.transform = CGAffineTransform.identity.translatedBy(x: 300.0, y: 0.0)
        }, completion: { finished in
            self.revAnimateCardIn()
            self.updateLabels()
        })
    }
    
    func revAnimateCardIn() {
        
        card.transform = CGAffineTransform.identity.translatedBy(x: -300.0, y: 0.0)
        UIView.animate(withDuration: 0.3) {
            self.card.transform = CGAffineTransform.identity
            
        }
    }
    
    
    @IBAction func tappedOne(_ sender: Any) {
        
        if buttonOne == correctAnswerButton {
            //buttonOne.isHidden = true
            flipFlashcard()
        } else {
            questionLabel.isHidden = false
            buttonOne.isEnabled = false
        }
        
    }
    
    @IBAction func tappedTwo(_ sender: Any) {
        //questionLabel.isHidden = true
        
        if buttonTwo == correctAnswerButton {
            //buttonOne.isHidden = true
            flipFlashcard()
        } else {
            questionLabel.isHidden = false
            buttonTwo.isEnabled = false
        }
    }
    
    @IBAction func tappedThree(_ sender: Any) {
        //buttonThree.isHidden = true
        
        if buttonThree == correctAnswerButton {
            //buttonOne.isHidden = true
            flipFlashcard()
        } else {
            questionLabel.isHidden = false
            buttonThree.isEnabled = false
        }
    }
    
    @IBAction func didTapOnNext(_ sender: Any) {
        currentIndex = currentIndex + 1
        buttonOne.isEnabled = true
        buttonTwo.isEnabled = true
        buttonThree.isEnabled = true
        questionLabel.isHidden = false
        updateNextPrevButtons()
        animateCardOut()
    }
    
    @IBAction func didTapOnPrev(_ sender: Any) {
        currentIndex = currentIndex - 1
        buttonOne.isEnabled = true
        buttonTwo.isEnabled = true
        buttonThree.isEnabled = true
        questionLabel.isHidden = false
        updateNextPrevButtons()
        revAnimateCardOut()
    }
    
    @IBAction func didTapOnDelete(_ sender: Any) {
        let alert = UIAlertController(title: "Delete flashcard", message: "Are you sure you want to delete it?", preferredStyle: .actionSheet)
        present(alert, animated: true)
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { action in
            self.deleteCurrentFlashcard()
        }
        alert.addAction(deleteAction)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(cancelAction)
        
    }
    
    func deleteCurrentFlashcard() {
        if flashcards.count == 1 {
            let alert = UIAlertController(title: "Can't Delete Flashcard", message: "Need at least one card", preferredStyle: .alert)
            present(alert, animated: true)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            alert.addAction(cancelAction)
        }
        else {
            flashcards.remove(at: currentIndex)
            
            if currentIndex>flashcards.count - 1
            {
                currentIndex = flashcards.count - 1
            }
            updateNextPrevButtons()
            updateLabels()
            saveAllFlashcardsToDisk()
        }
    }
    
    
    func updateFlashcard(question: String, answer: String, extra1: String, extra2: String, isExisting: Bool) {
        
        let flashcard = Flashcard(question: question, answer: answer, extra1: extra1, extra2: extra2)
        
        if isExisting {
            flashcards[currentIndex] = flashcard
        }
        else {
            flashcards.append(flashcard)
            print("Added new flashcard")
            print("We now have \(flashcards.count) flashcards")
            
            buttonOne.isEnabled = true
            buttonTwo.isEnabled = true
            buttonThree.isEnabled = true
            
            currentIndex = flashcards.count - 1
            print("Our current index is \(currentIndex)")
        }
        updateNextPrevButtons()
        updateLabels()
        saveAllFlashcardsToDisk()
    }
    
    func updateNextPrevButtons() {
        if currentIndex == flashcards.count-1 && currentIndex != 0
        {
            prevButton.isEnabled = true
            nextButton.isEnabled = false
            
        }
        else if currentIndex == flashcards.count-1 && currentIndex == 0
        {
            prevButton.isEnabled = false
            nextButton.isEnabled = false
        }
        else if currentIndex != flashcards.count-1 && currentIndex == 0
        {
            prevButton.isEnabled = false
            nextButton.isEnabled = true
        }
        else
        {
            nextButton.isEnabled = true
            prevButton.isEnabled = true
        }
    }
    
    func updateLabels() {
        
        let currentFlashcard = flashcards[currentIndex]
        questionLabel.text = currentFlashcard.question
        answerLabel.text = currentFlashcard.answer
        
        let buttons = [buttonOne, buttonTwo, buttonThree].shuffled()
        let answers = [currentFlashcard.answer, currentFlashcard.extra1, currentFlashcard.extra2].shuffled()
        wrong1 = currentFlashcard.extra1
        wrong2 = currentFlashcard.extra2

        for (button,answer) in zip(buttons,answers) {
            button?.setTitle(answer, for: .normal)
            
            if answer == currentFlashcard.answer {
                correctAnswerButton = button
            }
        }
        

        //buttonOne.setTitle(currentFlashcard.extra1, for: .normal)
        //buttonTwo.setTitle(currentFlashcard.answer, for: .normal)
        //buttonThree.setTitle(currentFlashcard.extra2, for: .normal)
    }
    
    func saveAllFlashcardsToDisk() {
        
        let dictionaryArray = flashcards.map { (card) -> [String:String] in
            return ["question": card.question, "answer": card.answer, "extra1": card.extra1, "extra2": card.extra2]
        }
        
        UserDefaults.standard.set(dictionaryArray, forKey: "flashcards")
        print("Flashcards saved to UserDefaults")
    }
    
    func readSavedFlashcards() {
        if let dictionaryArray = UserDefaults.standard.array(forKey: "flashcards") as? [[String:String]]
        {
            let savedCards = dictionaryArray.map { dictionary -> Flashcard in
                return Flashcard(question: dictionary["question"]!, answer: dictionary["answer"]!, extra1: dictionary["extra1"]!, extra2: dictionary["extra2"]!)
            }
            flashcards.append(contentsOf: savedCards)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationController = segue.destination as! UINavigationController
        let creationController = navigationController.topViewController as! CreationViewController
        creationController.flashcardsController = self
        
        if segue.identifier == "EditSegue" {
            creationController.initialQuestion = questionLabel.text
            creationController.initialAnswer = answerLabel.text
            creationController.initialExtraAnswer1 = wrong1
            creationController.initialExtraAnswer2 = wrong2
            print(answerLabel.text)
            print(buttonOne.currentTitle)
        }
    }
}

