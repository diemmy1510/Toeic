//
//  MenuViewController.swift
//  ToeicApp
//
//  Created by Admin on 8/19/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    private let reuseMenuCellIdentify = "menuCell"
    var arrayMenuOption = ["Test", "Add new question"]

    @IBOutlet weak var menuTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //set up menuTableView
        menuTableView.delegate = self
        menuTableView.dataSource = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayMenuOption.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = menuTableView.dequeueReusableCell(withIdentifier: reuseMenuCellIdentify, for: indexPath)
        cell.textLabel?.text = arrayMenuOption[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let revealVC:SWRevealViewController = self.revealViewController()
        if indexPath.row == 0 {
            let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let desViewController = mainStoryboard.instantiateViewController(withIdentifier: "listTestVC") as! ListTestViewController
            let newFrontVC = UINavigationController.init(rootViewController: desViewController)
            revealVC.pushFrontViewController(newFrontVC, animated: true)
        }
        
        if indexPath.row == 1 {
            let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let desViewController = mainStoryboard.instantiateViewController(withIdentifier: "AddQuestionVC") as! AddQuestionViewController
            let newFrontVC = UINavigationController.init(rootViewController: desViewController)
            revealVC.pushFrontViewController(newFrontVC, animated: true)
        }
    }

}
