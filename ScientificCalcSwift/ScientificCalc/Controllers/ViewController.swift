//
//  ViewController.swift
//  ScientificCalc
//
//  Created by Vishal Chandran on 29/07/16.
//  Copyright © 2016 Vishal Chandran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Variables
    
    
    var brain = Brain()
    
    var userIsInTheMiddleOfEnteringANumber = Bool()
    var radianIsOn = false
    var signChange = Bool()
    
    var basicOperation = [NSString]()
    var advancedOperation = NSString()
    var advancedOperationWithRadian = NSString()
    
    
    // MARK: - Outlets
    
    
    var secondButton = UIButton(type: .System)
    
    var radianDegreeSwitch = UISwitch()
    var radianSwitchText = UILabel()
    
    var display = UILabel()
    var degRadText = UILabel()
    var secondButtonPressed = false
    
    var squareButton = UIButton(type: .System)
    var piButton = UIButton(type: .System)
    
    var tanButton = UIButton(type: .System)
    var cosButton = UIButton(type: .System)
    var sineButton = UIButton(type: .System)
    
    var radianSwitchButton = UIButton(type: .System)
    var squareRootButton = UIButton(type: .System)
    
    
    // MARK: - View Life Cycle Methods
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        // Setting up the Title View in the Navigation Bar
        
        
        let aHeaderTitleSubtitleFrame: CGRect = CGRectMake(0, 0, 200, 44)
        let aHeaderTitleSubtitleView: UIView = UILabel(frame: aHeaderTitleSubtitleFrame)
        aHeaderTitleSubtitleView.backgroundColor = UIColor.clearColor()
        aHeaderTitleSubtitleView.autoresizesSubviews = false
        
        let aTitleFrame: CGRect = CGRectMake(0, 10, 200, 24)
        let aTitleView: UILabel = UILabel(frame: aTitleFrame)
        aTitleView.backgroundColor = UIColor.clearColor()
        aTitleView.textAlignment = .Center
        aTitleView.textColor = UIColor.whiteColor()
        aTitleView.text = "Calculator"
        aTitleView.adjustsFontSizeToFitWidth = true
        
        aHeaderTitleSubtitleView.addSubview(aTitleView)
        self.navigationItem.titleView = aHeaderTitleSubtitleView
        
        
        // Setting up basic colors and fonts
        
        
        let aBlackColor = UIColor.blackColor()
        
        let anAdvancedButtonBGColor = UIColor(red: 214/255, green: 214/255, blue: 214/255, alpha: 1.0)
        let aBasicButtonBGColor = UIColor(red: 245/255, green: 145/255, blue: 56/255, alpha: 1.0)
        let aNumberButtonBGColor = UIColor(red: 224/255, green: 224/255, blue: 224/255, alpha: 1.0)
        
        self.view.backgroundColor = UIColor(red: 72/255, green: 85/255, blue: 162/255, alpha: 1)
        
        
        // Setting up Views
        
        
        let aDisplayLabelHeight = self.view.frame.size.height / 4
        
        display.frame = CGRect(x: 2.5, y: 0, width: self.view.frame.size.width - 5, height: aDisplayLabelHeight)
        display.adjustsFontSizeToFitWidth = true
        display.font = UIFont(name: "Helvetica", size: 48)
        display.textAlignment = .Right
        display.textColor = UIColor.whiteColor()
        self.view.addSubview(display)
        
        
        // Setting up Switch Fonts and Colors
        
        
        let aButtonFont = UIFont(name: "Helvetica", size: 18)
        
        let anAdditionalHeight = aDisplayLabelHeight + 64
        
        let aButtonHeight = ((self.view.frame.size.height - anAdditionalHeight) / 6)
        let aButtonWidth = (self.view.frame.size.width / 5)
        
        let aButtonTextColor = UIColor.blackColor()
        
        
        // Setting up Switch Button
        
        
        radianSwitchButton = UIButton(frame: CGRect(x: 0, y: CGRectGetMaxY(display.frame) - 25, width: aButtonWidth, height: 25))
        radianSwitchButton.backgroundColor = anAdvancedButtonBGColor
        radianSwitchButton.titleLabel?.font = UIFont(name: "Roboto-Regular", size: 15)
        radianSwitchButton.setTitleColor(aBlackColor, forState: .Normal)
        radianSwitchButton.setTitle("Deg", forState: .Normal)
        radianSwitchButton.addTarget(self, action: #selector(ViewController.switchPressed(_:)), forControlEvents: .TouchUpInside)
        
        self.view.addSubview(radianSwitchButton)
        
        
        // Setting up Advanced Function Buttons
        
        
        sineButton.frame = CGRect(x: 0, y: CGRectGetMaxY(display.frame) + 1, width: aButtonWidth, height: aButtonHeight)
        sineButton.backgroundColor = anAdvancedButtonBGColor
        sineButton.titleLabel?.font = aButtonFont
        sineButton.setTitleColor(aButtonTextColor, forState: .Normal)
        sineButton.setTitle("sin", forState: .Normal)
        sineButton.addTarget(self, action: #selector(ViewController.advancedOperationPressed(_:)), forControlEvents: .TouchUpInside)
        
        self.view.addSubview(sineButton)
        
        
        cosButton.frame = CGRect(x: CGRectGetMaxX(sineButton.frame) + 1, y: CGRectGetMaxY(display.frame) + 1, width: aButtonWidth, height: aButtonHeight)
        cosButton.backgroundColor = anAdvancedButtonBGColor
        cosButton.titleLabel?.font = aButtonFont
        cosButton.setTitleColor(aButtonTextColor, forState: .Normal)
        cosButton.setTitle("cos", forState: .Normal)
        cosButton.addTarget(self, action: #selector(ViewController.advancedOperationPressed(_:)), forControlEvents: .TouchUpInside)
        
        self.view.addSubview(cosButton)
        
        
        tanButton.frame = CGRect(x: CGRectGetMaxX(cosButton.frame) + 1, y: CGRectGetMaxY(display.frame) + 1, width: aButtonWidth, height: aButtonHeight)
        tanButton.backgroundColor = anAdvancedButtonBGColor
        tanButton.titleLabel?.font = aButtonFont
        tanButton.setTitleColor(aButtonTextColor, forState: .Normal)
        tanButton.setTitle("tan", forState: .Normal)
        tanButton.addTarget(self, action: #selector(ViewController.advancedOperationPressed(_:)), forControlEvents: .TouchUpInside)
        
        self.view.addSubview(tanButton)
        
        
        let anLnButton = UIButton(type: .System)
        anLnButton.frame = CGRect(x: CGRectGetMaxX(tanButton.frame) + 1, y: CGRectGetMaxY(display.frame) + 1, width: aButtonWidth, height: aButtonHeight)
        anLnButton.backgroundColor = anAdvancedButtonBGColor
        anLnButton.titleLabel?.font = aButtonFont
        anLnButton.setTitleColor(aButtonTextColor, forState: .Normal)
        anLnButton.setTitle("ln", forState: .Normal)
        anLnButton.addTarget(self, action: #selector(ViewController.advancedOperationPressed(_:)), forControlEvents: .TouchUpInside)
        
        self.view.addSubview(anLnButton)
        
        
        let anByXButton = UIButton(type: .System)
        anByXButton.frame = CGRect(x: CGRectGetMaxX(anLnButton.frame) + 1, y: CGRectGetMaxY(display.frame) + 1, width: aButtonWidth, height: aButtonHeight)
        anByXButton.backgroundColor = anAdvancedButtonBGColor
        anByXButton.titleLabel?.font = aButtonFont
        anByXButton.setTitleColor(aButtonTextColor, forState: .Normal)
        anByXButton.setTitle("1/x", forState: .Normal)
        anByXButton.addTarget(self, action: #selector(ViewController.advancedOperationPressed(_:)), forControlEvents: .TouchUpInside)
        
        self.view.addSubview(anByXButton)
        
        
        squareRootButton.frame = CGRect(x: 0, y: CGRectGetMaxY(sineButton.frame) + 1, width: aButtonWidth, height: aButtonHeight)
        squareRootButton.backgroundColor = anAdvancedButtonBGColor
        squareRootButton.titleLabel?.font = aButtonFont
        squareRootButton.setTitleColor(aButtonTextColor, forState: .Normal)
        squareRootButton.setTitle("\u{221A}", forState: .Normal)
        squareRootButton.addTarget(self, action: #selector(ViewController.advancedOperationPressed(_:)), forControlEvents: .TouchUpInside)
        
        self.view.addSubview(squareRootButton)
        
        
        squareButton.frame = CGRect(x: CGRectGetMaxX(squareRootButton.frame) + 1, y: CGRectGetMaxY(cosButton.frame) + 1, width: aButtonWidth, height: aButtonHeight)
        squareButton.backgroundColor = anAdvancedButtonBGColor
        squareButton.titleLabel?.font = aButtonFont
        squareButton.setTitleColor(aButtonTextColor, forState: .Normal)
        squareButton.setTitle("x\u{00B2}", forState: .Normal)
        squareButton.addTarget(self, action: #selector(ViewController.advancedOperationPressed(_:)), forControlEvents: .TouchUpInside)
        
        self.view.addSubview(squareButton)
        
        
        let aPercentageButton = UIButton(type: .System)
        aPercentageButton.frame = CGRect(x: CGRectGetMaxX(squareButton.frame) + 1, y: CGRectGetMaxY(tanButton.frame) + 1, width: aButtonWidth, height: aButtonHeight)
        aPercentageButton.backgroundColor = anAdvancedButtonBGColor
        aPercentageButton.titleLabel?.font = aButtonFont
        aPercentageButton.setTitleColor(aButtonTextColor, forState: .Normal)
        aPercentageButton.setTitle("%", forState: .Normal)
        aPercentageButton.addTarget(self, action: #selector(ViewController.advancedOperationPressed(_:)), forControlEvents: .TouchUpInside)
        
        self.view.addSubview(aPercentageButton)
        
        
        let aLogButton = UIButton(type: .System)
        aLogButton.frame = CGRect(x: CGRectGetMaxX(aPercentageButton.frame) + 1, y: CGRectGetMaxY(anLnButton.frame) + 1, width: aButtonWidth, height: aButtonHeight)
        aLogButton.backgroundColor = anAdvancedButtonBGColor
        aLogButton.titleLabel?.font = aButtonFont
        aLogButton.setTitleColor(aButtonTextColor, forState: .Normal)
        aLogButton.setTitle("log", forState: .Normal)
        aLogButton.addTarget(self, action: #selector(ViewController.advancedOperationPressed(_:)), forControlEvents: .TouchUpInside)
        
        self.view.addSubview(aLogButton)
        
        
        secondButton.frame = CGRect(x: CGRectGetMaxX(aLogButton.frame) + 1, y: CGRectGetMaxY(anByXButton.frame) + 1, width: aButtonWidth, height: aButtonHeight)
        secondButton.backgroundColor = anAdvancedButtonBGColor
        secondButton.titleLabel?.font = aButtonFont
        secondButton.setTitleColor(aButtonTextColor, forState: .Normal)
        secondButton.setTitle("2nd", forState: .Normal)
        secondButton.addTarget(self, action: #selector(ViewController.secondButtonPressed(_:)), forControlEvents: .TouchUpInside)
        
        self.view.addSubview(secondButton)
        
        
        // Setting up Number Buttons
        
        
        let aNumberSevenButton = UIButton(type: .System)
        aNumberSevenButton.frame = CGRect(x: 0, y: CGRectGetMaxY(squareButton.frame) + 1, width: aButtonWidth, height: aButtonHeight)
        aNumberSevenButton.backgroundColor = aNumberButtonBGColor
        aNumberSevenButton.titleLabel?.font = aButtonFont
        aNumberSevenButton.setTitleColor(aBlackColor, forState: .Normal)
        aNumberSevenButton.setTitle("7", forState: .Normal)
        aNumberSevenButton.addTarget(self, action: #selector(ViewController.digitPressed(_:)), forControlEvents: .TouchUpInside)
        
        self.view.addSubview(aNumberSevenButton)
        
        
        let aNumberEightButton = UIButton(type: .System)
        aNumberEightButton.frame = CGRect(x: CGRectGetMaxX(aNumberSevenButton.frame) + 1, y: CGRectGetMaxY(squareButton.frame) + 1, width: aButtonWidth, height: aButtonHeight)
        aNumberEightButton.backgroundColor = aNumberButtonBGColor
        aNumberEightButton.titleLabel?.font = aButtonFont
        aNumberEightButton.setTitleColor(aBlackColor, forState: .Normal)
        aNumberEightButton.setTitle("8", forState: .Normal)
        aNumberEightButton.addTarget(self, action: #selector(ViewController.digitPressed(_:)), forControlEvents: .TouchUpInside)
        
        self.view.addSubview(aNumberEightButton)
        
        
        let aNumberNineButton = UIButton(type: .System)
        aNumberNineButton.frame = CGRect(x: CGRectGetMaxX(aNumberEightButton.frame) + 1, y: CGRectGetMaxY(squareButton.frame) + 1, width: aButtonWidth, height: aButtonHeight)
        aNumberNineButton.backgroundColor = aNumberButtonBGColor
        aNumberNineButton.titleLabel?.font = aButtonFont
        aNumberNineButton.setTitleColor(aBlackColor, forState: .Normal)
        aNumberNineButton.setTitle("9", forState: .Normal)
        aNumberNineButton.addTarget(self, action: #selector(ViewController.digitPressed(_:)), forControlEvents: .TouchUpInside)
        
        self.view.addSubview(aNumberNineButton)
        
        
        let aNumberFourButton = UIButton(type: .System)
        aNumberFourButton.frame = CGRect(x: 0, y: CGRectGetMaxY(aNumberSevenButton.frame) + 1, width: aButtonWidth, height: aButtonHeight)
        aNumberFourButton.backgroundColor = aNumberButtonBGColor
        aNumberFourButton.titleLabel?.font = aButtonFont
        aNumberFourButton.setTitleColor(aBlackColor, forState: .Normal)
        aNumberFourButton.setTitle("4", forState: .Normal)
        aNumberFourButton.addTarget(self, action: #selector(ViewController.digitPressed(_:)), forControlEvents: .TouchUpInside)
        
        self.view.addSubview(aNumberFourButton)
        
        
        let aNumberFiveButton = UIButton(type: .System)
        aNumberFiveButton.frame = CGRect(x: CGRectGetMaxX(aNumberFourButton.frame) + 1, y: CGRectGetMaxY(aNumberSevenButton.frame) + 1, width: aButtonWidth, height: aButtonHeight)
        aNumberFiveButton.backgroundColor = aNumberButtonBGColor
        aNumberFiveButton.titleLabel?.font = aButtonFont
        aNumberFiveButton.setTitleColor(aBlackColor, forState: .Normal)
        aNumberFiveButton.setTitle("5", forState: .Normal)
        aNumberFiveButton.addTarget(self, action: #selector(ViewController.digitPressed(_:)), forControlEvents: .TouchUpInside)
        
        self.view.addSubview(aNumberFiveButton)
        
        
        let aNumberSixButton = UIButton(type: .System)
        aNumberSixButton.frame = CGRect(x: CGRectGetMaxX(aNumberFiveButton.frame) + 1, y: CGRectGetMaxY(aNumberSevenButton.frame) + 1, width: aButtonWidth, height: aButtonHeight)
        aNumberSixButton.backgroundColor = aNumberButtonBGColor
        aNumberSixButton.titleLabel?.font = aButtonFont
        aNumberSixButton.setTitleColor(aBlackColor, forState: .Normal)
        aNumberSixButton.setTitle("6", forState: .Normal)
        aNumberSixButton.addTarget(self, action: #selector(ViewController.digitPressed(_:)), forControlEvents: .TouchUpInside)
        
        self.view.addSubview(aNumberSixButton)
        
        
        let aNumberOneButton = UIButton(type: .System)
        aNumberOneButton.frame = CGRect(x: 0, y: CGRectGetMaxY(aNumberFourButton.frame) + 1, width: aButtonWidth, height: aButtonHeight)
        aNumberOneButton.backgroundColor = aNumberButtonBGColor
        aNumberOneButton.titleLabel?.font = aButtonFont
        aNumberOneButton.setTitleColor(aBlackColor, forState: .Normal)
        aNumberOneButton.setTitle("1", forState: .Normal)
        aNumberOneButton.addTarget(self, action: #selector(ViewController.digitPressed(_:)), forControlEvents: .TouchUpInside)
        
        self.view.addSubview(aNumberOneButton)
        
        
        let aNumberTwoButton = UIButton(type: .System)
        aNumberTwoButton.frame = CGRect(x: CGRectGetMaxX(aNumberOneButton.frame) + 1, y: CGRectGetMaxY(aNumberFourButton.frame) + 1, width: aButtonWidth, height: aButtonHeight)
        aNumberTwoButton.backgroundColor = aNumberButtonBGColor
        aNumberTwoButton.titleLabel?.font = aButtonFont
        aNumberTwoButton.setTitleColor(aBlackColor, forState: .Normal)
        aNumberTwoButton.setTitle("2", forState: .Normal)
        aNumberTwoButton.addTarget(self, action: #selector(ViewController.digitPressed(_:)), forControlEvents: .TouchUpInside)
        
        self.view.addSubview(aNumberTwoButton)
        
        
        let aNumberThreeButton = UIButton(type: .System)
        aNumberThreeButton.frame = CGRect(x: CGRectGetMaxX(aNumberTwoButton.frame) + 1, y: CGRectGetMaxY(aNumberFourButton.frame) + 1, width: aButtonWidth, height: aButtonHeight)
        aNumberThreeButton.backgroundColor = aNumberButtonBGColor
        aNumberThreeButton.titleLabel?.font = aButtonFont
        aNumberThreeButton.setTitleColor(aBlackColor, forState: .Normal)
        aNumberThreeButton.setTitle("3", forState: .Normal)
        aNumberThreeButton.addTarget(self, action: #selector(ViewController.digitPressed(_:)), forControlEvents: .TouchUpInside)
        
        self.view.addSubview(aNumberThreeButton)
        
        
        let aNumberZeroButton = UIButton(type: .System)
        aNumberZeroButton.frame = CGRect(x: 0, y: CGRectGetMaxY(aNumberOneButton.frame) + 1, width: aButtonWidth, height: aButtonHeight)
        aNumberZeroButton.backgroundColor = aNumberButtonBGColor
        aNumberZeroButton.titleLabel?.font = aButtonFont
        aNumberZeroButton.setTitleColor(aBlackColor, forState: .Normal)
        aNumberZeroButton.setTitle("0", forState: .Normal)
        aNumberZeroButton.addTarget(self, action: #selector(ViewController.digitPressed(_:)), forControlEvents: .TouchUpInside)
        
        self.view.addSubview(aNumberZeroButton)
        
        
        let aDecimalButton = UIButton(type: .System)
        aDecimalButton.frame = CGRect(x: CGRectGetMaxX(aNumberZeroButton.frame) + 1, y: CGRectGetMaxY(aNumberOneButton.frame) + 1, width: aButtonWidth, height: aButtonHeight)
        aDecimalButton.backgroundColor = aNumberButtonBGColor
        aDecimalButton.titleLabel?.font = aButtonFont
        aDecimalButton.setTitleColor(aBlackColor, forState: .Normal)
        aDecimalButton.setTitle(".", forState: .Normal)
        aDecimalButton.addTarget(self, action: #selector(ViewController.decimalPressed(_:)), forControlEvents: .TouchUpInside)
        
        self.view.addSubview(aDecimalButton)
        
        
        piButton.frame = CGRect(x: CGRectGetMaxX(aDecimalButton.frame) + 1, y: CGRectGetMaxY(aNumberOneButton.frame) + 1, width: aButtonWidth, height: aButtonHeight)
        piButton.backgroundColor = aNumberButtonBGColor
        piButton.titleLabel?.font = aButtonFont
        piButton.setTitleColor(aBlackColor, forState: .Normal)
        piButton.setTitle("\u{03c0}", forState: .Normal)
        piButton.addTarget(self, action: #selector(ViewController.piKeyPressed(_:)), forControlEvents: .TouchUpInside)
        
        self.view.addSubview(piButton)
        
        
        // Setting up Basic Calculation Buttons
        
        
        let aClearButton = UIButton(type: .System)
        aClearButton.frame = CGRect(x: CGRectGetMaxX(aNumberNineButton.frame) + 1, y: CGRectGetMaxY(aLogButton.frame) + 1, width: aButtonWidth, height: aButtonHeight)
        aClearButton.backgroundColor = aBasicButtonBGColor
        aClearButton.titleLabel?.font = aButtonFont
        aClearButton.setTitleColor(aBlackColor, forState: .Normal)
        aClearButton.setTitle("C", forState: .Normal)
        aClearButton.addTarget(self, action: #selector(ViewController.CPressed(_:)), forControlEvents: .TouchUpInside)
        
        self.view.addSubview(aClearButton)
        
        
        let anAllClearButton = UIButton(type: .System)
        anAllClearButton.frame = CGRect(x: CGRectGetMaxX(aClearButton.frame) + 1, y: CGRectGetMaxY(aLogButton.frame) + 1, width: aButtonWidth, height: aButtonHeight)
        anAllClearButton.backgroundColor = aBasicButtonBGColor
        anAllClearButton.titleLabel?.font = aButtonFont
        anAllClearButton.setTitleColor(aBlackColor, forState: .Normal)
        anAllClearButton.setTitle("AC", forState: .Normal)
        anAllClearButton.addTarget(self, action: #selector(ViewController.ACPressed(_:)), forControlEvents: .TouchUpInside)
        
        self.view.addSubview(anAllClearButton)
        
        
        let aMultiplyButton = UIButton(type: .System)
        aMultiplyButton.frame = CGRect(x: CGRectGetMaxX(aNumberSixButton.frame) + 1, y: CGRectGetMaxY(aClearButton.frame) + 1, width: aButtonWidth, height: aButtonHeight)
        aMultiplyButton.backgroundColor = aBasicButtonBGColor
        aMultiplyButton.titleLabel?.font = aButtonFont
        aMultiplyButton.setTitleColor(aBlackColor, forState: .Normal)
        aMultiplyButton.setTitle("x", forState: .Normal)
        aMultiplyButton.addTarget(self, action: #selector(ViewController.basicOperationPressed(_:)), forControlEvents: .TouchUpInside)
        
        self.view.addSubview(aMultiplyButton)
        
        
        let aDivisionButton = UIButton(type: .System)
        aDivisionButton.frame = CGRect(x: CGRectGetMaxX(aMultiplyButton.frame) + 1, y: CGRectGetMaxY(aClearButton.frame) + 1, width: aButtonWidth, height: aButtonHeight)
        aDivisionButton.backgroundColor = aBasicButtonBGColor
        aDivisionButton.titleLabel?.font = aButtonFont
        aDivisionButton.setTitleColor(aBlackColor, forState: .Normal)
        aDivisionButton.setTitle("/", forState: .Normal)
        aDivisionButton.addTarget(self, action: #selector(ViewController.basicOperationPressed(_:)), forControlEvents: .TouchUpInside)
        
        self.view.addSubview(aDivisionButton)
        
        
        let anAddButton = UIButton(type: .System)
        anAddButton.frame = CGRect(x: CGRectGetMaxX(aNumberThreeButton.frame) + 1, y: CGRectGetMaxY(aMultiplyButton.frame) + 1, width: aButtonWidth, height: aButtonHeight)
        anAddButton.backgroundColor = aBasicButtonBGColor
        anAddButton.titleLabel?.font = aButtonFont
        anAddButton.setTitleColor(aBlackColor, forState: .Normal)
        anAddButton.setTitle("+", forState: .Normal)
        anAddButton.addTarget(self, action: #selector(ViewController.basicOperationPressed(_:)), forControlEvents: .TouchUpInside)
        
        self.view.addSubview(anAddButton)
        
        
        let aSubtractButton = UIButton(type: .System)
        aSubtractButton.frame = CGRect(x: CGRectGetMaxX(anAddButton.frame) + 1, y: CGRectGetMaxY(aMultiplyButton.frame) + 1, width: aButtonWidth, height: aButtonHeight)
        aSubtractButton.backgroundColor = aBasicButtonBGColor
        aSubtractButton.titleLabel?.font = aButtonFont
        aSubtractButton.setTitleColor(aBlackColor, forState: .Normal)
        aSubtractButton.setTitle("-", forState: .Normal)
        aSubtractButton.addTarget(self, action: #selector(ViewController.basicOperationPressed(_:)), forControlEvents: .TouchUpInside)
        
        self.view.addSubview(aSubtractButton)
        
        
        let anEqualButton = UIButton(type: .System)
        anEqualButton.frame = CGRect(x: CGRectGetMaxX(piButton.frame) + 1, y: CGRectGetMaxY(anAddButton.frame) + 1, width: aButtonWidth, height: aButtonHeight)
        anEqualButton.backgroundColor = aBasicButtonBGColor
        anEqualButton.titleLabel?.font = aButtonFont
        anEqualButton.setTitleColor(aBlackColor, forState: .Normal)
        anEqualButton.setTitle("=", forState: .Normal)
        anEqualButton.addTarget(self, action: #selector(ViewController.equalPressed(_:)), forControlEvents: .TouchUpInside)
        
        self.view.addSubview(anEqualButton)
        
        
        let aPlusOrMinusButton = UIButton(type: .System)
        aPlusOrMinusButton.frame = CGRect(x: CGRectGetMaxX(anEqualButton.frame) + 1, y: CGRectGetMaxY(anAddButton.frame) + 1, width: aButtonWidth, height: aButtonHeight)
        aPlusOrMinusButton.backgroundColor = aBasicButtonBGColor
        aPlusOrMinusButton.titleLabel?.font = aButtonFont
        aPlusOrMinusButton.setTitleColor(aBlackColor, forState: .Normal)
        aPlusOrMinusButton.setTitle("+/-", forState: .Normal)
        aPlusOrMinusButton.addTarget(self, action: #selector(ViewController.negativePositivePressed(_:)), forControlEvents: .TouchUpInside)
        
        self.view.addSubview(aPlusOrMinusButton)
        
        
        // Setting up lines for section views
        
        
        let aVerticalLineOne = UIView(frame: CGRect(x: CGRectGetMaxX(sineButton.frame), y: CGRectGetMaxY(display.frame), width: 1, height: self.view.frame.size.height - 100))
        aVerticalLineOne.backgroundColor = aBlackColor
        
        self.view.addSubview(aVerticalLineOne)
        
        
        let aVerticalLineTwo = UIView(frame: CGRect(x: CGRectGetMaxX(cosButton.frame), y: CGRectGetMaxY(display.frame), width: 1, height: self.view.frame.size.height - 100))
        aVerticalLineTwo.backgroundColor = aBlackColor
        
        self.view.addSubview(aVerticalLineTwo)
        
        
        let aVerticalLineThree = UIView(frame: CGRect(x: CGRectGetMaxX(tanButton.frame), y: CGRectGetMaxY(display.frame), width: 1, height: self.view.frame.size.height - 100))
        aVerticalLineThree.backgroundColor = aBlackColor
        
        self.view.addSubview(aVerticalLineThree)
        
        
        let aVerticalLineFour = UIView(frame: CGRect(x: CGRectGetMaxX(anLnButton.frame), y: CGRectGetMaxY(display.frame), width: 1, height: self.view.frame.size.height - 100))
        aVerticalLineFour.backgroundColor = aBlackColor
        
        self.view.addSubview(aVerticalLineFour)
        
        
        let aHorizontalLineOne = UIView(frame: CGRect(x: 0, y: CGRectGetMaxY(display.frame), width: self.view.frame.size.width, height: 1))
        aHorizontalLineOne.backgroundColor = aBlackColor
        
        self.view.addSubview(aHorizontalLineOne)
        
        
        let aHorizontalLineTwo = UIView(frame: CGRect(x: 0, y: CGRectGetMaxY(sineButton.frame), width: self.view.frame.size.width, height: 1))
        aHorizontalLineTwo.backgroundColor = aBlackColor
        
        self.view.addSubview(aHorizontalLineTwo)
        
        
        let aHorizontalLineThree = UIView(frame: CGRect(x: 0, y: CGRectGetMaxY(squareRootButton.frame), width: self.view.frame.size.width, height: 1))
        aHorizontalLineThree.backgroundColor = aBlackColor
        
        self.view.addSubview(aHorizontalLineThree)
        
        
        let aHorizontalLineFour = UIView(frame: CGRect(x: 0, y: CGRectGetMaxY(aNumberSevenButton.frame), width: self.view.frame.size.width, height: 1))
        aHorizontalLineFour.backgroundColor = aBlackColor
        
        self.view.addSubview(aHorizontalLineFour)
        
        
        let aHorizontalLineFive = UIView(frame: CGRect(x: 0, y: CGRectGetMaxY(aNumberFourButton.frame), width: self.view.frame.size.width, height: 1))
        aHorizontalLineFive.backgroundColor = aBlackColor
        
        self.view.addSubview(aHorizontalLineFive)
        
        
        let aHorizontalLineSix = UIView(frame: CGRect(x: 0, y: CGRectGetMaxY(aNumberOneButton.frame), width: self.view.frame.size.width, height: 1))
        aHorizontalLineSix.backgroundColor = aBlackColor
        
        self.view.addSubview(aHorizontalLineSix)
        
        
        // Setting up Initial values
        
        
        self.display.text = "0"
        self.display.adjustsFontSizeToFitWidth = true
        
        
    }
    
    
    override func viewWillAppear(animated: Bool) {
        
        // Setting up the Navigation Bar tint
        
        
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 45/255, green: 58/255, blue: 114/255, alpha: 1)
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.translucent = false
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Private Methods
    
    
    func goBack() {
        
        self.navigationController?.popViewControllerAnimated(true)
        
    }
    
    
    func ACPressed(sender: UIButton) {
        
        self.brain.clearMemory()
        self.display.text = "0"
        
    }
    
    
    func advancedOperationPressed(sender: UIButton) {
        
        if !radianIsOn {
            
            self.advancedOperation = sender.currentTitle!
            self.brain.getOperand(CDouble(self.display.text!)!)
            self.userIsInTheMiddleOfEnteringANumber = false
            let result: Double = self.brain.performAdvancedCalculation(advancedOperation as String)
            self.display.text = "\(result)"
            
        } else {
            
            self.advancedOperationWithRadian = sender.currentTitle!
            self.brain.getOperand(CDouble(self.display.text!)!)
            self.userIsInTheMiddleOfEnteringANumber = false
            let result: Double = self.brain.performAdvancedCalculationWithRadian(advancedOperationWithRadian as String)
            self.display.text = "\(result)"
            
        }
        
    }
    
    
    func basicOperationPressed(sender: UIButton) {
        
        self.basicOperation.append(sender.currentTitle!)
        self.brain.getOperand(CDouble(self.display.text!)!)
        self.userIsInTheMiddleOfEnteringANumber = false
        
    }
    
    
    func CPressed(sender: UIButton) {
        
        self.display.text = "0"
        
    }
    
    
    func decimalPressed(sender: UIButton) {
        
        if (self.display.text!.rangeOfString(".") == nil) {
            self.display.text = self.display.text!.stringByAppendingFormat(".")
        }
        
        self.userIsInTheMiddleOfEnteringANumber = true
        
    }
    
    
    func digitPressed(sender: UIButton) {
        
        let digit: String = sender.currentTitle!
        
        if (display.text! == "0") {
            self.display.text = ""
            if digit == "0" {
                self.display.text = "0"
            }
        }
        
        if userIsInTheMiddleOfEnteringANumber {
            self.display.text = display.text!.stringByAppendingString(digit)
        } else {
            self.display.text = digit
            self.userIsInTheMiddleOfEnteringANumber = true
        }
        
    }
    
    
    func equalPressed(sender: UIButton) {
        
        self.brain.getOperand(CDouble(self.display.text!)!)
        self.userIsInTheMiddleOfEnteringANumber = false
        
        var result = Double()
        
        while (basicOperation.count != 0) {
            
            if (basicOperation.count != 1) {
                
                let aCount = basicOperation.count
                
                if ((basicOperation.last == "+" || basicOperation.last == "-") && (basicOperation[aCount - 2] == "x" || basicOperation[aCount - 2] == "/")) {
                    
                    self.brain.checkOperator = true
                    self.brain.operatorString = basicOperation[aCount - 2] as String
                    
                    result = self.brain.performBasicCalculation(basicOperation[aCount - 2] as String)
                    basicOperation.removeAtIndex(aCount - 2)
                    
                } else {
                    
                    result = self.brain.performBasicCalculation(basicOperation.last as! String)
                    basicOperation.removeLast()
                    
                }
                
            } else {
                
                result = self.brain.performBasicCalculation(basicOperation.last as! String)
                basicOperation.removeLast()
                
            }
            
        }
        
        self.display.text = "\(result)"
        
    }
    
    
    func negativePositivePressed(sender: UIButton) {
        
        if (display.text! == "0") {
            return
        } else {
            let neg: String = "-"
            if !signChange {
                self.signChange = true
                self.display.text = neg.stringByAppendingString(display.text!)
            }
            else {
                self.signChange = false
                self.display.text = self.display.text!.substringFromIndex(self.display.text!.startIndex.advancedBy(1))
            }
        }
        
        
    }
    
    
    func piKeyPressed(sender: UIButton) {
        
        self.display.text = "3.14159"
        self.userIsInTheMiddleOfEnteringANumber = false
        
    }
    
    
    func secondButtonPressed(sender: UIButton) {
        
        if (secondButtonPressed == true) {
            
            secondButtonPressed = false
            secondButton.backgroundColor = UIColor(red: 224/255, green: 224/255, blue: 224/255, alpha: 1.0)
            sineButton.setTitle("sin\u{207b}\u{00b9}", forState: .Normal)
            cosButton.setTitle("cos\u{207b}\u{00b9}", forState: .Normal)
            tanButton.setTitle("tan\u{207b}\u{00b9}", forState: .Normal)
            
        } else {
            
            secondButtonPressed = true
            secondButton.backgroundColor = UIColor(red: 214/255, green: 214/255, blue: 214/255, alpha: 1.0)
            sineButton.setTitle("sin", forState: .Normal)
            cosButton.setTitle("cos", forState: .Normal)
            tanButton.setTitle("tan", forState: .Normal)
            
        }
        
    }
    
    
    func switchPressed(sender: UIButton) {
        
        if (radianIsOn == false) {
            self.radianSwitchButton.setTitle("Rad", forState: .Normal)
            self.radianIsOn = true
        } else {
            self.radianSwitchButton.setTitle("Deg", forState: .Normal)
            self.radianIsOn = false
        }
        
        
    }


}

