//
//  ViewController.swift
//  calculator
//
//  Created by Ekansh Anand on 29/08/17.
//  Copyright © 2017 Avi Srivastava. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var outputlbl: UILabel!
    var runningnumber = ""
    
    enum Operation: String{
        case Divide = "/"
        case Multiply = "*"
        case Addition = "+"
        case Subtraction = "-"
        case Empty = "Empty"
        
    }
    var currentOperation = Operation.Empty
    var leftvalstr = ""
    var rightvalstr = ""
    var result = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    @IBAction func pressed(_ sender: UIButton)
    {
        runningnumber += "\(sender.tag)"
        outputlbl.text = runningnumber
    }
    
    @IBAction func onDivide(_ sender: AnyObject)
    {
        processOperation(.Divide)
    }
    @IBAction func onMultiply(_ sender: AnyObject)
    {
        processOperation(.Multiply)
    }
    @IBAction func onAddition(_ sender: AnyObject)
    {
        processOperation(.Addition)
    }
    @IBAction func onSubtract(_ sender: AnyObject)
    {
        processOperation(.Subtraction)
    }
    @IBAction func onEqual(_ sender: AnyObject)
    {
        processOperation(currentOperation)
    }

    func processOperation(_ operation: Operation)
{
    if currentOperation != Operation.Empty{
        // user selected an operator,but then selected another operator without entering a number
        if runningnumber != ""{
            
            rightvalstr = runningnumber
            runningnumber = ""
            
            if currentOperation == Operation.Multiply{
                result = "\(Double(leftvalstr)! * Double(rightvalstr)!)"
            }
            else if currentOperation == Operation.Divide{
                result = "\(Double(leftvalstr)! / Double(rightvalstr)!)"
            }
            else if currentOperation == Operation.Addition{
                result = "\(Double(leftvalstr)! + Double(rightvalstr)!)"
            }
            else if currentOperation == Operation.Subtraction{
                result = "\(Double(leftvalstr)! - Double(rightvalstr)!)"
            }
            
            leftvalstr = result
            outputlbl.text = result
}
currentOperation = operation
    } else{
        leftvalstr = runningnumber
        runningnumber = ""
        currentOperation = operation
    }
}

}
