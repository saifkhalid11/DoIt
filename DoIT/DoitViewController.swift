//
//  DoitViewController.swift
//  DoIT
//
//  Created by Muhammad Rehman on 1/8/18.
//  Copyright © 2018 Unit. All rights reserved.
//

import UIKit

class DoitViewController: UIViewController {
    
    @IBOutlet weak var OnSwitch: UISwitch!
    
    @IBOutlet weak var ImportantLabel: UILabel!
    
    @IBOutlet weak var textText: UITextField!
    
    @IBOutlet weak var NameLabel: UILabel!
    
    var previousVC = TaskViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ADDButton(_ sender: Any) {
        let task = Task()
        task.Name = textText.text!
        task.Important = OnSwitch.isOn
        
        previousVC.DoIt.append(task)
        previousVC.TableviewLabel.reloadData()
        navigationController!.popViewController(animated: true)
    }
    
    
}
