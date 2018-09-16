//
//  ViewController.h
//  scorekeeper
//
//  Created by Richard Dawson on 9/12/16.
//  Copyright © 2016 Richard Dawson. All rights reserved.
//

#import <UIKit/UIKit.h>

//For User when stepper is used to change the score
@interface ViewController : UIViewController
{
    UILabel* scoreTeamOne;
    UILabel* scoreTeamTwo;
    UIStepper* stepper2;
    UIStepper* stepper1;
}


@end

