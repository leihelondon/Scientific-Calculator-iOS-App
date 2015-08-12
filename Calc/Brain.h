//
//  Brain.h
//  Calc
//
//  Created by leihe on 12/02/2015.
//  Copyright (c) 2015 leihe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Brain : NSObject
-(void)getOperand:(double)operand;
-(double)performBasicCalculation:(NSString *)basicOperation;
-(double)performAdvancedCalculation:(NSString*)advancedOperation;
-(double)performAdvancedCalculationWithRadian:(NSString*)advancedOperationWithRadian;
-(void)clearMemory;
@property (nonatomic, strong) NSMutableArray *operand;

@end
