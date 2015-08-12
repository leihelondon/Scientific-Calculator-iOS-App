//
//  LandscapeViewController.m
//  Calc
//
//  Created by leihe on 25/02/2015.
//  Copyright (c) 2015 leihe. All rights reserved.
//

#import "LandscapeViewController.h"

@interface LandscapeViewController ()
@property (strong, nonatomic) UIView *backView;


@end

@implementation LandscapeViewController

@synthesize display=_display;
@synthesize squareButton=_squareButton;
@synthesize squareRootButton=_squareRootButton;
@synthesize sineButton=_sineButton;
@synthesize cosButton=_cosButton;
@synthesize tanButton=_tanButton;
@synthesize secondButton=_secondButton;
@synthesize secondButtonPressed=_secondButtonPressed;
@synthesize piButton=_piButton;
@synthesize infoButton=_infoButton;
@synthesize displayTapeView=_displayTapeView;
@synthesize displayTapeViewLandscape=_displayTapeViewLandscape;
@synthesize displayTapeLandscape=_displayTapeLandscape;
@synthesize backView=_backView;
@synthesize radianDegreeSwitch=_radianDegreeSwitch;
@synthesize userIsInTheMiddleOfEnteringANumber=_userIsInTheMiddleOfEnteringANumber;
@synthesize radianIsOn=_radianIsOn;
@synthesize brain=_brain;
@synthesize basicOperation=_basicOperation;
@synthesize advancedOperation=_advancedOperation;
@synthesize advancedOperationWithRadian=_advancedOperationWithRadian;
@synthesize signChange=_signChange;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _display.text=@"0";
    [_squareButton setTitle:@"x\u00B2" forState:UIControlStateNormal];
    [_squareRootButton setTitle:@"\u221A" forState:UIControlStateNormal];
    [_piButton setTitle:@"\u03c0" forState:UIControlStateNormal];
    [_secondButtonPressed setHidden:YES];
    //self.displayInfoView.hidden=NO;
    // _radianIsOn.transform = CGAffineTransformMakeScale(1.2, 1);
    //_TextViewDisplayTape.text=@"";
    //_TextViewDisplayTape.editable=NO;
}

- (Brain *)brain
{
    if (!_brain)_brain=[[Brain alloc] init];
    return _brain;
}




- (IBAction)digitPressed:(id)sender {
    NSString *digit=[sender currentTitle];
    //_TextViewDisplayTape.text=[_TextViewDisplayTape.text stringByAppendingString:digit];
    if ([_display.text isEqualToString:@"0"]) {
        _display.text=@"";
        if (digit==0) {
            _display.text=@"0";
        }
    }
    if (_userIsInTheMiddleOfEnteringANumber) {
        _display.text=[_display.text stringByAppendingString:digit];
    }
    else
    {
        _display.text=digit;
        _userIsInTheMiddleOfEnteringANumber=YES;
    }
}

- (IBAction)piKeyPressed:(id)sender {
    
    _display.text=@"3.14159265";
    _userIsInTheMiddleOfEnteringANumber=NO;
    _TextViewDisplayTape.text=[_TextViewDisplayTape.text stringByAppendingString:@"3.14159265"];
    
}

- (IBAction)basicOperationPressed:(id)sender {
    _basicOperation=[sender currentTitle];
    _TextViewDisplayTape.text=[_TextViewDisplayTape.text stringByAppendingString:_basicOperation];
    [self.brain getOperand:[self.display.text doubleValue]];
    self.userIsInTheMiddleOfEnteringANumber=NO;
}

- (IBAction)advancedOperationPressed:(id)sender {
    if(!_radianIsOn){
        _advancedOperation=[sender currentTitle];
        [self.brain getOperand:[self.display.text doubleValue]];
        self.userIsInTheMiddleOfEnteringANumber=NO;
        double result=[self.brain performAdvancedCalculation:_advancedOperation];
        //NSString *displayTapeResult=[NSString stringWithFormat:@"%g", result];
        //NSString *equalSign=@"=";
        //NSString *combinedForTape = [NSString stringWithFormat: @"%@%@ \n",equalSign, displayTapeResult];
        //NSString *combinedForSequence=[ _TextViewDisplayTape.text stringByAppendingString:combinedForTape];
        //_TextViewDisplayTape.text=[_advancedOperation stringByAppendingString:combinedForSequence];
        // NSString *combinedForTape = [NSString stringWithFormat: @"%@%@%@ \n",_advancedOperation,equalSign, displayTapeResult];
        // _TextViewDisplayTape.text=[_TextViewDisplayTape.text stringByAppendingString:combinedForTape];
        self.display.text=[NSString stringWithFormat:@"%g", result];}
}

- (IBAction)advancedOperationWithRadianPressed:(id)sender {
    if (_radianIsOn){
        _advancedOperationWithRadian=[sender currentTitle];
        [self.brain getOperand:[self.display.text doubleValue]];
        self.userIsInTheMiddleOfEnteringANumber=NO;
        double result=[self.brain performAdvancedCalculationWithRadian:_advancedOperationWithRadian];
        self.display.text=[NSString stringWithFormat:@"%g", result];
       // NSString *displayTapeResult=[NSString stringWithFormat:@"%g", result];
        //NSString *equalSign=@"=";
       // NSString *combinedForTape = [NSString stringWithFormat: @"%@%@ \n",equalSign, displayTapeResult];
       // NSString *combinedForSequence=[ _TextViewDisplayTape.text stringByAppendingString:combinedForTape];
        //_TextViewDisplayTape.text=[_advancedOperation stringByAppendingString:combinedForSequence];
    }
}

-(IBAction)switchPressed:(id)sender{
    /*
     if (_radianDegreeSwitch.on) {
     _radianSwitchText.text=@"radian(on)";
     _radianIsOn=YES;
     _TextViewDisplayTape.text=[_TextViewDisplayTape.text stringByAppendingString:@"Radian is on \n"];
     }*/
    if ([_radianDegreeSwitch isOn]) {
        _radianSwitchText.text=@"radian(on)";
        _degRadText.text=@"Rad";
        _radianIsOn=YES;
        //_TextViewDisplayTape.text=[_TextViewDisplayTape.text stringByAppendingString:@"Radian is on \n"];
    }
    else {
        _radianSwitchText.text=@"radian(off)";
        _degRadText.text=@"Deg";
        _radianIsOn=NO;
        //_TextViewDisplayTape.text=[_TextViewDisplayTape.text stringByAppendingString:@"Radian is off "];
    }
    
}

- (IBAction)equalPressed:(id)sender {
    [self.brain getOperand:[self.display.text doubleValue]];
    self.userIsInTheMiddleOfEnteringANumber=NO;
    double result=[self.brain performBasicCalculation:_basicOperation];
    self.display.text=[NSString stringWithFormat:@"%g", result];
    //NSString *displayTapeResult=[NSString stringWithFormat:@"%g", result];
    //NSString *equalSign=[sender currentTitle];
    //NSString *combinedForTape = [NSString stringWithFormat: @"%@%@ \n",equalSign, displayTapeResult];
    //_TextViewDisplayTape.text=[_TextViewDisplayTape.text stringByAppendingString:combinedForTape];
}

-(IBAction)decimalPressed:(id)sender{
    NSRange range=[self.display.text rangeOfString:@"."];
    if (range.location==NSNotFound) {
        self.display.text=[self.display.text stringByAppendingFormat:@"."];
        //_TextViewDisplayTape.text=[_TextViewDisplayTape.text stringByAppendingString:@"."];
    }
    self.userIsInTheMiddleOfEnteringANumber=YES;
}


-(IBAction)ACPressed:(id)sender{
    [self.brain clearMemory];
    self.display.text=@"0";
    _TextViewDisplayTape.text=[_TextViewDisplayTape.text stringByAppendingString:@"Clear All \n"];
}

-(IBAction)CPressed:(id)sender{
    self.display.text=@"0";
    _TextViewDisplayTape.text=[_TextViewDisplayTape.text stringByAppendingString:@"Clear \n"];
    
}

//negative positive button
-(IBAction)negativePositivePressed:(id)sender{
    if ([_display.text isEqualToString:@"0"]) {
        return;
    }
    else{
        NSString *neg=@"-";
        if (!_signChange) {
            _signChange=YES;
            _display.text=[neg stringByAppendingString:_display.text];
            //_TextViewDisplayTape.text=[neg stringByAppendingString:_TextViewDisplayTape.text];
        }else{
            _signChange=NO;
            _display.text=[self.display.text substringFromIndex:1];
        }
        
    }
    
}

-(IBAction)secondButtonPressed:(id)sender{
    _secondButton.hidden=YES;
    _secondButtonPressed.hidden=NO;
    [_sineButton setTitle:@"sin\u207b\u00b9" forState:UIControlStateNormal];
    [_cosButton setTitle:@"cos\u207b\u00b9" forState:UIControlStateNormal];
    [_tanButton setTitle:@"tan\u207b\u00b9" forState:UIControlStateNormal];
}

-(IBAction)secondButtonReleased:(id)sender{
    _secondButton.hidden=NO;
    _secondButtonPressed.hidden=YES;
    [_sineButton setTitle:@"sin" forState:UIControlStateNormal];
    [_cosButton setTitle:@"cos" forState:UIControlStateNormal];
    [_tanButton setTitle:@"tan" forState:UIControlStateNormal];
}
- (IBAction)infoButtonPressed:(id)sender {
    InfoView *infoView=[[InfoView alloc] initWithNibName:nil bundle:nil];
    infoView.modalTransitionStyle=UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:infoView animated:YES completion:nil];
    
}

- (IBAction)tapeButtonPressedLandscape:(id)sender {
    //self.displayTapeViewLandscape.hidden=NO;
    //_displayTapeLandscape.text=_display.text;
    //[UIView beginAnimations:nil context:NULL];
    //[UIView setAnimationDuration:1.0];
    //[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.displayTapeViewLandscape cache:YES];
    //self.displayTapeViewLandscape.layer.masksToBounds=NO;
    //self.displayTapeViewLandscape.layer.shadowOffset=CGSizeMake(-15.0,20.0);
    //self.displayTapeViewLandscape.layer.shadowRadius=5.0;
    //self.displayTapeViewLandscape.layer.shadowOpacity=0.5;

    //[UIView commitAnimations];
    [self.view addSubview:_displayTapeViewLandscape];
    //[[self displayTapeView] removeFromSuperview];
    /*
     if (!_backView) {
     _backView=[[UIView alloc] init];
     }
     CGRect frame=CGRectMake(0.0, 20.0, 600.0, 400.0);
     _backView.frame=frame;
     _backView.alpha=0.3;
     _backView.backgroundColor=[UIColor blueColor];
     [[self view] addSubview:_backView];*/
}

/*

- (IBAction)backButtonPressed:(id)sender {
    self.displayTapeView.hidden=YES;
    //self.backView.hidden=YES;
    NSLog(@"backButtonpressed");
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0];
    //[[self displayTapeView] removeFromSuperview];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.displayTapeView cache:YES];
    [UIView commitAnimations];
    
}
 */

/*

- (IBAction)clearAllButtonPressed:(id)sender {
    //[self.brain clearMemory];
    self.TextViewDisplayTape.text=@"";
}
 */


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
