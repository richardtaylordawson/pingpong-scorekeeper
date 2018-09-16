//
//  ViewController.m
//  scorekeeper
//
//  Created by Richard Dawson on 9/12/16.
//  Copyright © 2016 Richard Dawson. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /*
     *
     * Left Side of the Tracker
     *
     */
    
    //Left View
    UIView* leftSide = [[UIView alloc]initWithFrame:CGRectZero];
    leftSide.backgroundColor = [UIColor lightGrayColor];
    leftSide.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:leftSide];
    
    //Left Text Field aka Team Name
    UITextField* teamOne = [UITextField new];
    teamOne.backgroundColor = [UIColor redColor];
    teamOne.textColor = [UIColor whiteColor];
    teamOne.layer.borderColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.2].CGColor;
    teamOne.layer.borderWidth = 2.5;
    teamOne.text = @"Team One";
    teamOne.layer.cornerRadius = 20.0;
    teamOne.textAlignment = NSTextAlignmentCenter;
    teamOne.translatesAutoresizingMaskIntoConstraints = NO;
    [leftSide addSubview:teamOne];
    
    //Left "Score" Label
    scoreTeamOne = [UILabel new];
    scoreTeamOne.backgroundColor = [UIColor colorWithRed:0.12 green:0.27 blue:0.51 alpha:1.0];
    scoreTeamOne.textColor = [UIColor whiteColor];
    scoreTeamOne.layer.borderColor = [UIColor whiteColor].CGColor;
    scoreTeamOne.layer.borderWidth = 3.0;
    scoreTeamOne.translatesAutoresizingMaskIntoConstraints = NO;
    scoreTeamOne.text = @"0";
    scoreTeamOne.font = [UIFont systemFontOfSize:50];
    scoreTeamOne.textAlignment = NSTextAlignmentCenter;
    [leftSide addSubview: scoreTeamOne];
    
    //Left Stepper Counter
    stepper1 = [UIStepper new];
    stepper1.translatesAutoresizingMaskIntoConstraints = NO;
    stepper1.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [stepper1 addTarget:self action:@selector(stepperChangedLeft:) forControlEvents:UIControlEventValueChanged];
    stepper1.maximumValue = 21;
    stepper1.layer.borderWidth = 3.0;
    stepper1.layer.borderColor = [UIColor whiteColor].CGColor;
    stepper1.backgroundColor = [UIColor whiteColor];
    stepper1.layer.cornerRadius = 3.0;
    [leftSide addSubview:stepper1];
    
    
    /*
     *
     * Right Side of the Tracker
     *
     */
    
    //Right View
    UIView* rightSide = [[UIView alloc]initWithFrame:CGRectZero];
    rightSide.backgroundColor = [UIColor lightGrayColor];
    rightSide.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:rightSide];
    
    //Right Text Field aka Team Name
    UITextField* teamTwo = [UITextField new];
    teamTwo.backgroundColor = [UIColor blueColor];
    teamTwo.textColor = [UIColor whiteColor];
    teamTwo.layer.borderColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.2].CGColor;
    teamTwo.layer.borderWidth = 2.5;
    teamTwo.text = @"Team Two";
    teamTwo.textAlignment = NSTextAlignmentCenter;
    teamTwo.layer.cornerRadius = 20.0;
    teamTwo.translatesAutoresizingMaskIntoConstraints = NO;
    [rightSide addSubview:teamTwo];
    
    //Right "Score" Label
    scoreTeamTwo = [UILabel new];
    scoreTeamTwo.backgroundColor = [UIColor colorWithRed:0.12 green:0.27 blue:0.51 alpha:1.0];
    scoreTeamTwo.layer.borderColor = [UIColor whiteColor].CGColor;
    scoreTeamTwo.layer.borderWidth = 3.0;
    scoreTeamTwo.textColor = [UIColor whiteColor];
    scoreTeamTwo.translatesAutoresizingMaskIntoConstraints = NO;
    scoreTeamTwo.text = @"0";
    scoreTeamTwo.font = [UIFont systemFontOfSize:50];
    scoreTeamTwo.textAlignment = NSTextAlignmentCenter;
    [rightSide addSubview: scoreTeamTwo];
    
    //Right Stepper Counter
    stepper2 = [UIStepper new];
    stepper2.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    stepper2.translatesAutoresizingMaskIntoConstraints = NO;
    [stepper2 addTarget:self action:@selector(stepperChangedRight:) forControlEvents:UIControlEventValueChanged];
    stepper2.maximumValue = 21;
    stepper2.backgroundColor = [UIColor whiteColor];
    stepper2.layer.borderWidth = 3.0;
    stepper2.layer.cornerRadius = 3.0;
    stepper2.layer.borderColor = [UIColor whiteColor].CGColor;
    [rightSide addSubview:stepper2];
    
    /*
     *
     * Bottom of the Tracker
     *
     */
    
    //Bottom Section
    UIView* bottomView = [[UIView alloc]initWithFrame:CGRectZero];
    bottomView.backgroundColor = [UIColor lightGrayColor];
    bottomView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:bottomView];
    
    //Reset Button
    UIButton* resetButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [resetButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [resetButton setTitle:@"Reset Score" forState:UIControlStateNormal];
    resetButton.translatesAutoresizingMaskIntoConstraints = NO;
    resetButton.backgroundColor = [UIColor colorWithRed:0.12 green:0.27 blue:0.51 alpha:1.0];
    [resetButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    resetButton.layer.borderColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.15].CGColor;
    resetButton.frame = CGRectMake(self.view.frame.size.width,0,100,50);
    resetButton.layer.borderWidth = 2.5;
    [bottomView addSubview:resetButton];
    
 
    //Dictionary of Constraints
    NSDictionary* variables = NSDictionaryOfVariableBindings(leftSide, teamOne, scoreTeamOne, stepper1, rightSide, teamTwo, scoreTeamTwo, stepper2, bottomView, resetButton);
    
    //Self.View constraints
    [self.view addConstraints: [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[leftSide(rightSide)][rightSide]|" options: 0 metrics:nil views:variables]];
    [self.view addConstraints: [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[bottomView]|" options: 0 metrics:nil views:variables]];
    [self.view addConstraints: [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[leftSide(320)][bottomView]|" options: 0 metrics:nil views:variables]];
    [self.view addConstraints: [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[rightSide(320)][bottomView]|" options: 0 metrics:nil views:variables]];
    
    //Left Side Constraints
    [leftSide addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-15-[teamOne]-10-|" options:0 metrics:nil views:variables]];
    [leftSide addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[scoreTeamOne]|" options:0 metrics:nil views:variables]];
    [leftSide addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[stepper1]-50-|" options:0 metrics:nil views:variables]];
    [leftSide addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-40-[teamOne(50)]-20-[scoreTeamOne(120)]-20-[stepper1]|" options:0 metrics:nil views:variables]];
    
    //Right Side Constraints
    [rightSide addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[teamTwo]-15-|" options:0 metrics:nil views:variables]];
    [rightSide addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[scoreTeamTwo]-10-|" options:0 metrics:nil views:variables]];
    [rightSide addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[stepper2]-50-|" options:0 metrics:nil views:variables]];
    [rightSide addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-40-[teamTwo(50)]-20-[scoreTeamTwo(120)]-20-[stepper2]|" options:0 metrics:nil views:variables]];
    
    //Bottom View Constraints
    [bottomView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-75-[resetButton]-75-|" options:0 metrics:nil views:variables]];
    [bottomView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[resetButton(50)]|" options:0 metrics:nil views:variables]];
    
}

//Changed Value of Team One
-(void)stepperChangedLeft:(UIStepper*)stepper {
    NSLog(@"%f", stepper.value);
    
    scoreTeamOne.text = [NSString stringWithFormat:@"%.f", stepper.value];
}

//Change Value of Team Two
-(void)stepperChangedRight:(UIStepper*)stepper {
    NSLog(@"%f", stepper.value);
    
    scoreTeamTwo.text = [NSString stringWithFormat:@"%.f", stepper.value];
}

//Reset the Scores
-(void)buttonPressed:(UIButton*)button {
    //Set both to 0
    scoreTeamOne.text = @"0";
    scoreTeamTwo.text = @"0";
    stepper1.value = 0;
    stepper2.value = 0;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
}

@end
