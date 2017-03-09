//
//  ViewController.swift
//  tipCalculator
//
//  Created by etudiant-09 on 02/03/2017.
//  Copyright © 2017 etudiant-09. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        self.navigationController?.navigationBar.tintColor = UIColor.magenta
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

