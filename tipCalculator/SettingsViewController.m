//
//  SettingsViewController.m
//  tipCalculator
//
//  Created by  Santosh Sharanappa Mandi on 1/22/17.
//  Copyright © 2017  Santosh Sharanappa Mandi. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *defaultTipPicker;
@property NSArray *tipValues;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tipValues = @[@(0.15), @(0.2), @(0.25)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onSave:(UIBarButtonItem *)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int defaultTipIndex = self.defaultTipPicker.selectedSegmentIndex;
    [defaults setInteger:defaultTipIndex forKey:@"default_tip_index"];
    [defaults synchronize];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
