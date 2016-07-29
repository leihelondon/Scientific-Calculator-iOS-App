//
//  Brain.swift
//  ScientificCalc
//
//  Created by Vishal Chandran on 29/07/16.
//  Copyright © 2016 Vishal Chandran. All rights reserved.
//

import Foundation

public class Brain {
    
    var checkOperator = false
    var operatorString = String()
    var operand = [NSNumber]()
    var result: Double = 0
    
    func clearMemory() {
        self.operand.removeAll()
    }
    
    func getOperand(operand: Double) {
        let operandObject: NSNumber = NSNumber(double: operand)
        self.operand.append(operandObject)
        print(self.operand)
    }
    
    func setOperand() -> Double {
        
        let operandEntry: NSNumber = self.operand.last!
        
        if operandEntry != 0 {
            self.operand.removeLast()
        }
        return CDouble(operandEntry)
        
    }
    
    
    func setSecondLastOperand() -> Double {
        
        let aCount = self.operand.count
        
        let operandEntry: NSNumber = self.operand[aCount - 2]
        
        if operandEntry != 0 {
            self.operand.removeAtIndex(aCount - 2)
        }
        return CDouble(operandEntry)
        
        
    }
    
    func performBasicCalculation(basicOperation: String) -> Double {
        
        if (checkOperator) {
            
            checkOperator = false
            
            if (operatorString == "+") {
                result = self.setSecondLastOperand() + self.setSecondLastOperand()
            }
            else if (operatorString == "-") {
                let substrahend: Double = self.setSecondLastOperand()
                result = self.setSecondLastOperand() - substrahend
            }
            else if (operatorString == "x") {
                result = self.setSecondLastOperand() * self.setSecondLastOperand()
            }
            else if (operatorString == "/") {
                let divisor: Double = self.setSecondLastOperand()
                result = self.setSecondLastOperand() / divisor
            }
            
        } else {
            
            if (basicOperation == "+") {
                result = self.setOperand() + self.setOperand()
            }
            else if (basicOperation == "-") {
                let substrahend: Double = self.setOperand()
                result = self.setOperand() - substrahend
            }
            else if (basicOperation == "x") {
                result = self.setOperand() * self.setOperand()
            }
            else if (basicOperation == "/") {
                let divisor: Double = self.setOperand()
                result = self.setOperand() / divisor
            }
            
        }
        
        self.getOperand(result)
        return result
    }
    
    func performAdvancedCalculation(advancedOperation: String) -> Double {
        var result: Double = 0
        if (advancedOperation == "sin") {
            let sine: Double = self.setOperand()
            result = sin(sine * M_PI / 180)
        }
        else if (advancedOperation == "sin\u{207b}\u{00b9}") {
            let arcsine: Double = self.setOperand()
            result = (asin(arcsine)) * 180 / M_PI
        }
        else if (advancedOperation == "cos") {
            let cosine: Double = self.setOperand()
            result = cos(cosine * M_PI / 180)
        }
        else if (advancedOperation == "cos\u{207b}\u{00b9}") {
            let arccosine: Double = self.setOperand()
            result = (acos(arccosine)) * 180 / M_PI
        }
        else if (advancedOperation == "tan") {
            let tangent: Double = self.setOperand()
            result = tan(tangent * M_PI / 180)
        }
        else if (advancedOperation == "tan\u{207b}\u{00b9}") {
            let arctangent: Double = self.setOperand()
            result = (atan(arctangent)) * 180 / M_PI
        }
        else if (advancedOperation == "x\u{00B2}") {
            let square: Double = self.setOperand()
            result = pow(square, 2)
        }
        else if (advancedOperation == "\u{221A}") {
            let squareRoot: Double = self.setOperand()
            result = sqrt(squareRoot)
        }
        else if (advancedOperation == "1/x") {
            let reciprocal: Double = self.setOperand()
            result = 1 / reciprocal
        }
        else if (advancedOperation == "log") {
            let logarithm: Double = self.setOperand()
            result = log10(logarithm)
        }
        else if (advancedOperation == "In") {
            let logarithmBaseE: Double = self.setOperand()
            result = log(logarithmBaseE)
        }
        else if (advancedOperation == "%") {
            let percentage: Double = self.setOperand()
            result = percentage / 100
        }
        
        self.getOperand(result)
        return result
    }
    
    
    func performAdvancedCalculationWithRadian(advancedOperationWithRadian: String) -> Double {
        var result: Double = 0
        if (advancedOperationWithRadian == "sin") {
            let sineRadian: Double = self.setOperand()
            result = sin(sineRadian)
        }
        else if (advancedOperationWithRadian == "sin\u{207b}\u{00b9}") {
            let arcsineRadian: Double = self.setOperand()
            result = asin(arcsineRadian)
        }
        else if (advancedOperationWithRadian == "cos") {
            let cosineRadian: Double = self.setOperand()
            result = cos(cosineRadian)
        }
        else if (advancedOperationWithRadian == "cos\u{207b}\u{00b9}") {
            let arccosineRadian: Double = self.setOperand()
            result = acos(arccosineRadian)
        }
        else if (advancedOperationWithRadian == "tan") {
            let tangentRadian: Double = self.setOperand()
            result = tan(tangentRadian)
        }
        else if (advancedOperationWithRadian == "tan\u{207b}\u{00b9}") {
            let arctangentRadian: Double = self.setOperand()
            result = atan(arctangentRadian)
        }
        else if (advancedOperationWithRadian == "x\u{00B2}") {
            let squareWithRadian: Double = self.setOperand()
            result = pow(squareWithRadian, 2)
        }
        else if (advancedOperationWithRadian == "\u{221A}") {
            let squareRootsquareWithRadian: Double = self.setOperand()
            result = sqrt(squareRootsquareWithRadian)
        }
        else if (advancedOperationWithRadian == "1/x") {
            let reciprocalsquareWithRadian: Double = self.setOperand()
            result = 1 / reciprocalsquareWithRadian
        }
        else if (advancedOperationWithRadian == "log") {
            let logarithmsquareWithRadian: Double = self.setOperand()
            result = log10(logarithmsquareWithRadian)
        }
        else if (advancedOperationWithRadian == "In") {
            let logarithmBaseEsquareWithRadian: Double = self.setOperand()
            result = log(logarithmBaseEsquareWithRadian)
        }
        else if (advancedOperationWithRadian == "%") {
            let percentagesquareWithRadian: Double = self.setOperand()
            result = percentagesquareWithRadian / 100
        }
        
        self.getOperand(result)
        return result
    }
    
}