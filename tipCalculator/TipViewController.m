//
//  ViewController.m
//  tipCalculator
//
//  Created by  Santosh Sharanappa Mandi on 1/22/17.
//  Copyright © 2017  Santosh Sharanappa Mandi. All rights reserved.
//

#import "TipViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
@property NSArray *tipValues;

@end

@implementation TipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Tip Calculator";
    self.tipValues = @[@(0.15), @(0.2), @(0.25)];

    [self setDefaults];
    [self updateValues];
}


- (void)setDefaults {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger defaultTipInteger = [defaults integerForKey:@"default_tip_index"];
    
    [self.tipControl setSelectedSegmentIndex: defaultTipInteger];

}

- (void)viewWillAppear:(BOOL)animated {
    [self setDefaults];
    [self updateValues];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onTap:(UITapGestureRecognizer *)sender {
    [self.view endEditing:(YES)];
    [self updateValues];
}
- (IBAction)onValueChanged:(UISegmentedControl *)sender {
    [self updateValues];
}

- (void)updateValues {
    float billAmount = [self.billTextField.text floatValue];
    
    float tipAmount = [self.tipValues[self.tipControl.selectedSegmentIndex] floatValue] * billAmount;
    float totalAmout = billAmount + tipAmount;
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f", totalAmout];
    
}

@end
