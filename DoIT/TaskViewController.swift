//
//  TaskViewController.swift
//  DoIT
//
//  Created by Muhammad Rehman on 1/8/18.
//  Copyright © 2018 Unit. All rights reserved.
//

import UIKit

class TaskViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var TableviewLabel: UITableView!
    
    var DoIt : [Task] = []
    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        DoIt = makeTaskarray()
        
        TableviewLabel.dataSource = self
        TableviewLabel.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DoIt.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let task = DoIt[indexPath.row]
        let cell = UITableViewCell()
        if task.Important == true {
            cell.textLabel?.text = "☞\(task.Name)"
        }else{
        cell.textLabel?.text = task.Name
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedIndex = indexPath.row
        let task = DoIt[indexPath.row]
        performSegue(withIdentifier: "SelectTaskSegue", sender: task)
    }
    
    func makeTaskarray() -> [Task] {
        let task1 = Task()
        task1.Name = "Walk the Dog"
        task1.Important = false
        
        let task2 = Task()
        task2.Name = "Buy Cheese"
        task2.Important = true
        
        let task3 = Task()
        task3.Name = "Go to Sleep"
        task3.Important = true
        
        let task4 = Task()
        task4.Name = "Curb the Dog"
        task4.Important = false
        
        return [task1,task2,task3,task4]
    }

    @IBAction func Add(_ sender: Any) {
        performSegue(withIdentifier: "AddSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddSegue"{
            let nextVC = segue.destination as! DoitViewController
            nextVC.previousVC = self
        }
        
        if segue.identifier == "SelectTaskSegue"{
            let nextVC = segue.destination as! CompleteTaskViewController
            nextVC.task = sender as! Task
            nextVC.previousVC = self

        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

