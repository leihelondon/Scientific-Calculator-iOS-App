//
//  LandscapeViewController.h
//  Calc
//
//  Created by leihe on 25/02/2015.
//  Copyright (c) 2015 leihe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Brain.h"
#import "InfoView.h"

@interface LandscapeViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *display;
@property (strong, nonatomic) IBOutlet UILabel *radianSwitchText;
@property (weak, nonatomic) IBOutlet UIButton *sineButton;
@property (weak, nonatomic) IBOutlet UILabel *degRadText;
@property (weak, nonatomic) IBOutlet UIButton *cosButton;
@property (weak, nonatomic) IBOutlet UIButton *tanButton;
@property (weak, nonatomic) IBOutlet UIButton *squareButton;
@property (weak, nonatomic) IBOutlet UIButton *squareRootButton;
@property (weak, nonatomic) IBOutlet UIButton *piButton;
@property (weak, nonatomic) IBOutlet UIButton *secondButton;
@property (weak, nonatomic) IBOutlet UIButton *secondButtonPressed;
@property (weak, nonatomic) IBOutlet UIButton *infoButton;
@property (weak, nonatomic) IBOutlet UIButton *tapeButton;
@property (nonatomic) BOOL userIsInTheMiddleOfEnteringANumber;
@property (nonatomic) BOOL radianIsOn;
@property (weak, nonatomic) IBOutlet UISwitch *radianDegreeSwitch;
@property (nonatomic, strong) Brain *brain;
@property (nonatomic, weak) NSString *basicOperation;
@property (nonatomic, weak) NSString *advancedOperation;
@property (nonatomic, weak) NSString *advancedOperationWithRadian;
@property (nonatomic) BOOL signChange;
@property (weak, nonatomic) IBOutlet UIView *_portraitView;
@property (weak, nonatomic) IBOutlet UIView *displayTapeView;
@property (weak, nonatomic) IBOutlet UIView *displayTapeViewLandscape;
@property (weak, nonatomic) IBOutlet UITextView *TextViewDisplayTape;
@property (weak, nonatomic) IBOutlet UILabel *displayTapeLandscape;
-(IBAction)switchPressed:(id)sender;
-(IBAction)secondButtonPressed:(id)sender;
-(IBAction)secondButtonReleased:(id)sender;

@end
