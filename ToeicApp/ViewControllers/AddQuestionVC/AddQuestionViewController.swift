//
//  AddQuestionViewController.swift
//  ToeicApp
//
//  Created by Admin on 8/12/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import Firebase

class AddQuestionViewController: UIViewController {
    
    var ref:DatabaseReference?

    @IBOutlet weak var menuBtn: UIBarButtonItem!
    @IBOutlet weak var testNameTf: UITextField!
    @IBOutlet weak var questionTf: UITextField!
    @IBOutlet weak var aTf: UITextField!
    @IBOutlet weak var bTf: UITextField!
    @IBOutlet weak var cTf: UITextField!
    @IBOutlet weak var dTf: UITextField!
    @IBOutlet weak var answerTf: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuBtn.target = revealViewController()
        menuBtn.action = #selector(SWRevealViewController().revealToggle(_:))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    private func refreshTextField(){
        questionTf.text = ""
        aTf.text = ""
        bTf.text = ""
        cTf.text = ""
        dTf.text = ""
        answerTf.text = ""
        
    }
    

    @IBAction func addQuestionBtnPress(_ sender: UIButton) {
        
        guard let testName = testNameTf.text, testName != "" else { return }
        guard let question = questionTf.text, question != "" else { return }
        guard let a = aTf.text, a != "" else { return }
        guard let b = bTf.text, b != "" else { return }
        guard let c = cTf.text, c != "" else { return }
        guard let d = dTf.text, d != "" else { return }
        guard let answer = answerTf.text, answer != "" else { return }
        
        ref = Database.database().reference()
        self.ref?.child("\(testName)").childByAutoId().setValue(
            ["question":question, "A":a, "B":b, "C":c, "D":d, "answer":answer])
        print("a question is added")
        
        refreshTextField()
        
    }
}
