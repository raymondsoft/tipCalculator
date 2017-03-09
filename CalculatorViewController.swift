//
//  CalculatorViewController.swift
//  tipCalculator
//
//  Created by etudiant-09 on 02/03/2017.
//  Copyright © 2017 etudiant-09. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController{


    @IBOutlet weak var chackAmountLabel: UILabel!
    @IBOutlet weak var checkAmountTextField: UITextField!
    
    @IBOutlet weak var serviceLabel: UILabel!
    
    
    @IBOutlet weak var starButtonPoor: UIButton!
    
    @IBOutlet weak var starButtonGood: UIButton!
    
    @IBOutlet weak var starButtonEscellent: UIButton!
    
    @IBOutlet weak var deviceSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var tipDollardLabel: UILabel!
    
    @IBOutlet weak var tipEuroLabel: UILabel!
    
    @IBOutlet weak var tipLivreLabel: UILabel!
    
    
    
    var brain = CalculatorModel()
  
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.deviceSegmentedControl.removeAllSegments()
        for deviceIndex in 1...self.brain.devices.count{
            print(deviceIndex)
            self.deviceSegmentedControl.insertSegment(withTitle: brain.devicesNames[deviceIndex-1], at: deviceIndex, animated: true)
        }
        self.deviceSegmentedControl.selectedSegmentIndex = 0
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        self.chackAmountLabel.text = "3WA Test"
        
        self.checkAmountTextField.text = "\(brain.checkAmount)"
 //       self.checkAmountTextField.keyboardType = UIKeyboardType.numberPad
        
        self.serviceLabel.text = "Service poor 10 %"
        self.starButtonPoor.setImage(#imageLiteral(resourceName: "fleche_pleine"), for: UIControlState.normal)
        self.starButtonGood.setImage(#imageLiteral(resourceName: "fleche_creuse"), for: UIControlState.normal)
        self.starButtonEscellent.setImage(#imageLiteral(resourceName: "fleche_creuse"), for: UIControlState.normal)
        
        self.updateLabels()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        updateLabels()
    }
    
    @IBAction func serviceButtonTapped(_ sender: UIButton) {
        print("button \(sender.tag)")
        brain.serviceLevel = sender.tag

        
        self.starButtonPoor.setImage(#imageLiteral(resourceName: "fleche_pleine"), for: UIControlState.normal)
        self.starButtonGood.setImage(brain.serviceLevel > 0 ? #imageLiteral(resourceName: "fleche_pleine") : #imageLiteral(resourceName: "fleche_creuse"), for: UIControlState.normal)
        self.starButtonEscellent.setImage(brain.serviceLevel > 1 ? #imageLiteral(resourceName: "fleche_pleine") : #imageLiteral(resourceName: "fleche_creuse"), for: UIControlState.normal)
        

//        switch sender.tag {
//        case 0:
//            self.serviceLabel.text = "Service poor 10 %"
//            self.starButtonPoor.setImage(#imageLiteral(resourceName: "fleche_pleine"), for: UIControlState.normal)
//            self.starButtonGood.setImage(#imageLiteral(resourceName: "fleche_creuse"), for: UIControlState.normal)
//            self.starButtonEscellent.setImage(#imageLiteral(resourceName: "fleche_creuse"), for: UIControlState.normal)
//        case 1:
//            self.serviceLabel.text = "Service good 15 %"
//            self.starButtonPoor.setImage(#imageLiteral(resourceName: "fleche_pleine"), for: UIControlState.normal)
//            self.starButtonGood.setImage(#imageLiteral(resourceName: "fleche_pleine"), for: UIControlState.normal)
//            self.starButtonEscellent.setImage(#imageLiteral(resourceName: "fleche_creuse"), for: UIControlState.normal)
//        case 2:
//            self.serviceLabel.text = "Service excellent 20 %"
//            self.starButtonPoor.setImage(#imageLiteral(resourceName: "fleche_pleine"), for: UIControlState.normal)
//            self.starButtonGood.setImage(#imageLiteral(resourceName: "fleche_pleine"), for: UIControlState.normal)
//            self.starButtonEscellent.setImage(#imageLiteral(resourceName: "fleche_pleine"), for: UIControlState.normal)
//        default:
//            self.serviceLabel.text = "Service poor 10 %"
//            self.starButtonPoor.setImage(#imageLiteral(resourceName: "fleche_pleine"), for: UIControlState.normal)
//            self.starButtonGood.setImage(#imageLiteral(resourceName: "fleche_creuse"), for: UIControlState.normal)
//            self.starButtonEscellent.setImage(#imageLiteral(resourceName: "fleche_creuse"), for: UIControlState.normal)
//        }
        
        
        
        updateLabels()
    }

    @IBAction func deviceSegmentedControlTapped(_ sender: UISegmentedControl) {
        
        let indexDevice = self.deviceSegmentedControl.selectedSegmentIndex
        brain.deviceLevel = self.deviceSegmentedControl.selectedSegmentIndex
        print("devise sélectionnée : \(indexDevice)")
/*        switch indexDevice {
        case 0:
            print("Devise sélectionnée : $")
//            self.tipLabel.text = "000 $"
        case 1:
            print("Devise sélectionnée : €")
//            self.tipLabel.text = "000 €"
        case 2:
            print("Devise sélectionnée : £")
//            self.tipLabel.text = "000 £"
        default:
            print("Aucune devise sélectionnée")
        }
 */
        updateAmount()
        updateTipLabel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateLabels() {
        updateAmount()
        updateTipLabel()
        self.serviceLabel.text = brain.serviceLabelText
    }

    func updateTipLabel(){

        if let convertAmount = brain.convertedTip[0].toFormattedString {
            tipDollardLabel.text = "\(convertAmount) $"
        }
        if let convertAmount = brain.convertedTip[1].toFormattedString {
            tipEuroLabel.text = "\(convertAmount) €"
        }
        if let convertAmount = brain.convertedTip[2].toFormattedString {
            tipLivreLabel.text = "\(convertAmount) £"
        }


        
    }

    func updateAmount()
    {
        if let amount = checkAmountTextField.text , let formattedAmount = stringToDouble(amount) {
        brain.checkAmount = formattedAmount
        print(brain.checkAmount)
        }
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


}
