//
//  ListTestViewController.swift
//  ToeicApp
//
//  Created by Admin on 8/28/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import Firebase

class ListTestViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
    var ref:DatabaseReference?
    var listTests = ["Test 1", "Test 2", "Test 3"]
    @IBOutlet weak var listTestTableView: UITableView!
    @IBOutlet weak var menuBarBtn: UIBarButtonItem!
    private let listTestCellIdentify = "listTestCell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set up list test tableview
        listTestTableView.delegate = self
        listTestTableView.dataSource = self
        
        //set up menuBtn
        if revealViewController() != nil{
            menuBarBtn.target = revealViewController()
            menuBarBtn.action = #selector(SWRevealViewController().revealToggle(_:))
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetchListTestName(){
        ref?.observeSingleEvent(of: .value, with: { (snapshot) in
            let test = snapshot.value as? [String:AnyObject]
            for item in test!{
                let testName = item.key
                self.listTests.append(testName)
            }
            DispatchQueue.main.async {
                self.listTestTableView.reloadData()
            }
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listTests.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = listTestTableView.dequeueReusableCell(withIdentifier: listTestCellIdentify, for: indexPath)
        cell.textLabel?.text = listTests[indexPath.row]
        return cell
    }
    
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let indexPath = self.listTestTableView.indexPathForSelectedRow {
            if let cell = self.listTestTableView.cellForRow(at: indexPath) {
                let testVC = segue.destination as! TestCollectionViewController
                testVC.testName = cell.textLabel?.text
            }
        }
        
     }
    
    
}
