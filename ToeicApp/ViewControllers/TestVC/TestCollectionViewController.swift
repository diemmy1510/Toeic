//
//  TestCollectionViewController.swift
//  ToeicApp
//
//  Created by Admin on 8/12/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import Firebase

private let reuseIdentifier = "collectionCell"

class TestCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
//    @IBOutlet weak var menuBtn: UIBarButtonItem!
    var ref:DatabaseReference?
    var testName:String?
    var arrayQuestions = [Question]()
    var answerTableView:UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        //1.set up collectionView
        self.collectionView?.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionView?.setCollectionViewLayout(collectionViewFlowLayout, animated: true)
        collectionViewFlowLayout.scrollDirection = .horizontal
        //2.collectionView database
        
        loadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadData(){
        if testName == "Test 1"{
            fetchQuestion()
        }
        else if testName == "Test 2"{
            fetchTest2()
        }
        else if testName == "Test 3"{
            fetchTest3()
        }
    }
    
    
    
    func fetchQuestion(){
        ref = Database.database().reference()
        ref?.child("Questions").observeSingleEvent(of: .value) { (snapshot) in
            let data = snapshot.value as? [String:AnyObject]
//            print(data)
            for item in data!{
                let questionItem = Question()
                questionItem.question = item.value["question"] as? String ?? ""
                questionItem.a = item.value["A"] as? String ?? ""
                questionItem.b = item.value["B"] as? String ?? ""
                questionItem.c = item.value["C"] as? String ?? ""
                questionItem.d = item.value["D"] as? String ?? ""
                questionItem.answer = item.value["answer"] as? String ?? ""
                self.arrayQuestions.append(questionItem)
            }
            DispatchQueue.main.async {
                self.collectionView?.reloadData()
            }
        }
        
    }
    func fetchTest2(){
        ref = Database.database().reference()
        ref?.child("Test2").observeSingleEvent(of: .value) { (snapshot) in
            let data = snapshot.value as? [String:AnyObject]
            for item in data!{
                let questionItem = Question()
                questionItem.question = item.value["question"] as? String ?? ""
                questionItem.a = item.value["A"] as? String ?? ""
                questionItem.b = item.value["B"] as? String ?? ""
                questionItem.c = item.value["C"] as? String ?? ""
                questionItem.d = item.value["D"] as? String ?? ""
                questionItem.answer = item.value["answer"] as? String ?? ""
                self.arrayQuestions.append(questionItem)
            }
            DispatchQueue.main.async {
                self.collectionView?.reloadData()
            }
        }
        
    }
    func fetchTest3(){
        ref = Database.database().reference()
        ref?.child("Test 3").observeSingleEvent(of: .value) { (snapshot) in
            let data = snapshot.value as? [String:AnyObject]
            for item in data!{
                let questionItem = Question()
                questionItem.question = item.value["question"] as? String ?? ""
                questionItem.a = item.value["A"] as? String ?? ""
                questionItem.b = item.value["B"] as? String ?? ""
                questionItem.c = item.value["C"] as? String ?? ""
                questionItem.d = item.value["D"] as? String ?? ""
                questionItem.answer = item.value["answer"] as? String ?? ""
                self.arrayQuestions.append(questionItem)
            }
            DispatchQueue.main.async {
                self.collectionView?.reloadData()
            }
        }
        
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return arrayQuestions.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
    
        // Configure the cell
        cell.backgroundColor = UIColor.white
        cell.setUpTableView()
        cell.showAnswerLbl.isHidden = true
        cell.setUpQuestionLbl()
        cell.setUpShowAnswerLbl()
        let question = arrayQuestions[indexPath.item]
        cell.questionLbl.text = question.question
        cell.question = question
        
        
        return cell
    }
    
    //adjust size for collectionViewItemCell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.size.width
        let height = collectionView.frame.height * 0.9
        
        return CGSize(width: width, height: height)
    }
 

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
