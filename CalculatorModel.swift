//
//  CalculatorModel.swift
//  tipCalculator
//
//  Created by etudiant-09 on 06/03/2017.
//  Copyright © 2017 etudiant-09. All rights reserved.
//

import Foundation

struct CalculatorModel {
    
    
    var checkAmount = 0.0
    
    var serviceLevel = 0
    
    let tipRates = [0.10, 0.15, 0.20]
    
    let tipLabel = ["Poor 💩", "Good 🙂", "Excellent 😃"]
    	
    var deviceLevel = 0
    
    let devices = ["$", "€", "£"]
    let devicesNames = ["Dollar", "Euro", "Livre"]
    
    let conversionRate = [1.0, 1.5, 2]
    
    var computedTip: Double {
        return checkAmount * tipRates[serviceLevel] * conversionRate[deviceLevel]
    }
    
    var serviceLabelText: String {
        return tipLabel[serviceLevel]
    }
    

    
    var convertedTip: [Double] {
        var conversion = [
            conversionRate[0] / conversionRate[deviceLevel],
            conversionRate[1] / conversionRate[deviceLevel],
            conversionRate[2]  / conversionRate[deviceLevel]
        ]
        return [
            checkAmount * tipRates[serviceLevel] * conversion[0] ,
            checkAmount * tipRates[serviceLevel] * conversion[1] ,
            checkAmount * tipRates[serviceLevel] * conversion[2]
        ]
    }
    
}
