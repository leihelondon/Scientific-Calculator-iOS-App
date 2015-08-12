//
//  Brain.m
//  Calc
//
//  Created by leihe on 12/02/2015.
//  Copyright (c) 2015 leihe. All rights reserved.
//

#import "Brain.h"

@interface Brain();
@end


@implementation Brain
@synthesize operand=_operand;
-(NSMutableArray *)operand
{
    if(!_operand){
        _operand=[[NSMutableArray alloc] init];
    }
    return _operand;
}

-(void) clearMemory{
    [self.operand removeAllObjects];
}

-(void)getOperand:(double)operand
{
    NSNumber *operandObject=[NSNumber numberWithDouble:operand];
    [self.operand addObject:operandObject];
}

-(double)setOperand
{
    NSNumber *operandEntry=[self.operand lastObject];
    if (operandEntry) {
        [self.operand removeLastObject];
    }
    return [operandEntry doubleValue];
}


-(double)performBasicCalculation:(NSString *)basicOperation
{
    double result=0;
    if ([basicOperation isEqualToString:@"+"]) {
        result=[self setOperand] + [self setOperand];
    }
    else if ([basicOperation isEqualToString:@"-"]){
        double substrahend=[self setOperand];
        result=[self setOperand] - substrahend;
    }
    else if ([basicOperation isEqualToString:@"x"]){
        result=[self setOperand] * [self setOperand];
    }
    else if ([basicOperation isEqualToString:@"/"]){
        double divisor =[self setOperand];
        result=[self setOperand]/divisor;
    }
        [self getOperand:result];
    return result;
}



-(double)performAdvancedCalculation:(NSString *)advancedOperation
{
    double result=0;
        if ([advancedOperation isEqualToString:@"sin"]){
        double sine =[self setOperand];
        result=sin(sine * M_PI/180);
    }
    else if ([advancedOperation isEqualToString:@"sin\u207b\u00b9"]){
        double arcsine =[self setOperand];
        result=(asin(arcsine)) * 180/M_PI;
    }
    else if ([advancedOperation isEqualToString:@"cos"]){
        double cosine =[self setOperand];
        result=cos(cosine * M_PI/180);
    }
    else if ([advancedOperation isEqualToString:@"cos\u207b\u00b9"]){
        double arccosine =[self setOperand];
        result=(acos(arccosine)) * 180/M_PI;
    }
    else if ([advancedOperation isEqualToString:@"tan"]){
        double tangent =[self setOperand];
        result=tan(tangent * M_PI/180);
    }
    else if ([advancedOperation isEqualToString:@"tan\u207b\u00b9"]){
        double arctangent =[self setOperand];
        result=(atan(arctangent)) * 180/M_PI;
    }
    else if ([advancedOperation isEqualToString:@"x\u00B2"]){
        double square =[self setOperand];
        result=pow(square, 2);
    }
    else if ([advancedOperation isEqualToString:@"\u221A"]){
        double squareRoot =[self setOperand];
        result=sqrt(squareRoot);
    }
    else if ([advancedOperation isEqualToString:@"1/x"]){
        double reciprocal =[self setOperand];
        result=1/reciprocal;
    }
    else if ([advancedOperation isEqualToString:@"log"]){
        double logarithm =[self setOperand];
        result=log10(logarithm);
    }
    else if ([advancedOperation isEqualToString:@"In"]){
        double logarithmBaseE =[self setOperand];
        result=log(logarithmBaseE);
    }
    else if ([advancedOperation isEqualToString:@"%"]){
        double percentage =[self setOperand];
        result=percentage/100;
    }
    [self getOperand:result];
    return result;
}

-(double)performAdvancedCalculationWithRadian:(NSString *)advancedOperationWithRadian
{
    double result=0;
    if ([advancedOperationWithRadian isEqualToString:@"sin"]){
        double sineRadian =[self setOperand];
        result=sin(sineRadian);
    }
    else if ([advancedOperationWithRadian isEqualToString:@"sin\u207b\u00b9"]){
        double arcsineRadian =[self setOperand];
        result=asin(arcsineRadian);
    }
    else if ([advancedOperationWithRadian isEqualToString:@"cos"]){
        double cosineRadian =[self setOperand];
        result=cos(cosineRadian);
    }
    else if ([advancedOperationWithRadian isEqualToString:@"cos\u207b\u00b9"]){
        double arccosineRadian =[self setOperand];
        result=acos(arccosineRadian);
    }
    else if ([advancedOperationWithRadian isEqualToString:@"tan"]){
        double tangentRadian =[self setOperand];
        result=tan(tangentRadian);
    }
    else if ([advancedOperationWithRadian isEqualToString:@"tan\u207b\u00b9"]){
        double arctangentRadian =[self setOperand];
        result=atan(arctangentRadian);
    }
    else if ([advancedOperationWithRadian isEqualToString:@"x\u00B2"]){
        double squareWithRadian =[self setOperand];
        result=pow(squareWithRadian, 2);
    }
    else if ([advancedOperationWithRadian isEqualToString:@"\u221A"]){
        double squareRootsquareWithRadian =[self setOperand];
        result=sqrt(squareRootsquareWithRadian);
    }
    else if ([advancedOperationWithRadian isEqualToString:@"1/x"]){
        double reciprocalsquareWithRadian =[self setOperand];
        result=1/reciprocalsquareWithRadian;
    }
    else if ([advancedOperationWithRadian isEqualToString:@"log"]){
        double logarithmsquareWithRadian =[self setOperand];
        result=log10(logarithmsquareWithRadian);
    }
    else if ([advancedOperationWithRadian isEqualToString:@"In"]){
        double logarithmBaseEsquareWithRadian =[self setOperand];
        result=log(logarithmBaseEsquareWithRadian);
    }
    else if ([advancedOperationWithRadian isEqualToString:@"%"]){
        double percentagesquareWithRadian =[self setOperand];
        result=percentagesquareWithRadian/100;
    }
    [self getOperand:result];
    return result;
}


@end
