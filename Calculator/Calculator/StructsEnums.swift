//
//  StructsEnums.swift
//  Calculator
//
//  Created by Jose Melendez on 8/25/17.
//  Copyright © 2017 JoseMelendez. All rights reserved.
//

import Foundation


enum Operator: String {
    
    case add = "+"
    
    case subtract = "-"
    
    case times = "*"
    
    case divide = "/"
    
    case nothing = ""
    
}

enum CalculationState: String {
    
    case enteringNum = "enteringNum"
    
    case newNumStarted = "newNumStarted"
}
