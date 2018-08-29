//
//  CollectionViewCell.swift
//  ToeicApp
//
//  Created by Admin on 8/13/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell, UITableViewDelegate, UITableViewDataSource {
    
    
    
//    var isChoose:Bool = false
//    var actionChooseAnswer: ((UIButton)->())? = nil
    var question = Question()
    var indexOfAnswer:Int?
    var trueAnswer:String?

    @IBOutlet weak var questionLbl: UILabel!
    @IBOutlet weak var answerTableView: UITableView!
    @IBOutlet weak var showAnswerLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        answerTableView.delegate = self
        answerTableView.dataSource = self
        
        answerTableView.register(UINib(nibName: "AnswerTableViewCell", bundle: nil), forCellReuseIdentifier: "answerCell")
    }
    
    func setUpQuestionLbl(){
        questionLbl.backgroundColor = UIColor(red: 240.0, green: 220.0, blue: 214.0, alpha: 1.0)
        questionLbl.layer.cornerRadius = 5.0
        questionLbl.layer.shadowColor = UIColor.darkGray.cgColor
        questionLbl.layer.shadowOffset = CGSize(width: 2.0, height: 3.0)
        questionLbl.layer.shadowOpacity = 1
        questionLbl.layer.masksToBounds = false
    }
    
    func setUpShowAnswerLbl(){
        showAnswerLbl.backgroundColor = UIColor(red: 240.0, green: 220.0, blue: 214.0, alpha: 1.0)
        showAnswerLbl.layer.cornerRadius = 5.0
        showAnswerLbl.layer.shadowColor = UIColor.darkGray.cgColor
        showAnswerLbl.layer.shadowOffset = CGSize(width: 2.0, height: 3.0)
        showAnswerLbl.layer.shadowOpacity = 1
        showAnswerLbl.layer.masksToBounds = false
        showAnswerLbl.textColor = UIColor.white

    }
    
    
    func setUpTableView(){
        answerTableView.backgroundColor = UIColor(red: 240.0, green: 220.0, blue: 214.0, alpha: 1.0)
        answerTableView.layer.cornerRadius = 5.0
        answerTableView.layer.shadowColor = UIColor.darkGray.cgColor
        answerTableView.layer.shadowOffset = CGSize(width: 2.0, height: 3.0)
        answerTableView.layer.shadowOpacity = 1
        answerTableView.layer.masksToBounds = false
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:AnswerTableViewCell = answerTableView.dequeueReusableCell(withIdentifier: "answerCell", for: indexPath) as! AnswerTableViewCell
        let ques = self.question
        if indexPath.row == 0{
            cell.textLabel?.text = ques.a
            if ques.a == ques.answer{
                self.indexOfAnswer = 0
            }
        }
        if indexPath.row == 1{
            cell.textLabel?.text = ques.b
            if ques.b == ques.answer{
                self.indexOfAnswer = 1
            }
        }
        if indexPath.row == 2{
            cell.textLabel?.text = ques.c
            if ques.c == ques.answer{
                self.indexOfAnswer = 2
            }
        }
        if indexPath.row == 3{
            cell.textLabel?.text = ques.d
            if ques.d == ques.answer
            {
                self.indexOfAnswer = 3
            }
        }
        self.trueAnswer = ques.answer
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.showAnswerLbl.isHidden = false
        if indexPath.row == indexOfAnswer{
            self.showAnswerLbl.backgroundColor = UIColor.cyan
            self.showAnswerLbl.text = "TRUE"
//            answerTableView.cellForRow(at: indexPath)?.backgroundColor = UIColor.green
        }
        else{
//            answerTableView.cellForRow(at: indexPath)?.backgroundColor = UIColor.red
            self.showAnswerLbl.backgroundColor = UIColor.red
            self.showAnswerLbl.text = "FALSE __  true answer is :  \(trueAnswer!)"
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.answerTableView.frame.size.height / 4
    }

}
