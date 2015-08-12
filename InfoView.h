//
//  InfoView.h
//  Calc
//
//  Created by leihe on 25/02/2015.
//  Copyright (c) 2015 leihe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InfoView : UIViewController
@property(weak,nonatomic) IBOutlet UITextView *infoTextView;
-(IBAction)infoBackButtonPressed:(id)sender;

@end
