//
//  CreationViewController.swift
//  Flashcards
//
//  Created by Maya Kuzak on 3/12/22.
//

import UIKit

class CreationViewController: UIViewController {

    var flashcardsController: ViewController!
    var initialQuestion: String?
    var initialAnswer: String?
    var initialExtraAnswer1: String?
    var initialExtraAnswer2: String?
    

    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var questionText: UITextField!
    @IBOutlet weak var answerText: UITextField!
    @IBOutlet weak var extraAnswer1: UITextField!
    @IBOutlet weak var extraAnswer2: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        questionText.text = initialQuestion
        answerText.text = initialAnswer
        extraAnswer1.text = initialExtraAnswer1
        extraAnswer2.text = initialExtraAnswer2
        
        // Do any additional setup after loading the view.
    }

    @IBAction func tappedOnCancel(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func tappedOnDone(_ sender: Any) {
        let newQuestion = questionText.text
        let newAnswer = answerText.text
        let newAnswer1 = extraAnswer1.text
        let newAnswer2 = extraAnswer2.text
        
        if newQuestion == nil || newAnswer == nil || newAnswer1 == nil || newAnswer2 == nil || newQuestion!.isEmpty || newAnswer!.isEmpty || newAnswer1!.isEmpty || newAnswer2!.isEmpty {
            let alert = UIAlertController(title: "Missing Text", message: "You need a question, answer, and two wrong answers", preferredStyle: .alert)
            present(alert, animated: true)
            let okAction = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(okAction)
        }
        else {
            var isExisting = false
            if initialQuestion != nil {
                isExisting = true
            }
            flashcardsController.updateFlashcard(question: newQuestion!, answer: newAnswer!, extra1: newAnswer1!, extra2: newAnswer2!, isExisting: isExisting)
            dismiss(animated: true)
        }

    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
