//
//  ViewController.m
//  tipViewController
//
//  Created by William Thai on 1/22/17.
//  Copyright © 2017 Y.CORP.YAHOO.COM\willthai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"Tip Calc";
    NSLog(@"view did load");
    
}

- (IBAction)onTap:(UITapGestureRecognizer *)sender {
    [self.view endEditing:YES];
    [self updateValue];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onSegValueChange:(UISegmentedControl *)sender {
    [self updateValue];
}

- (void) viewWillAppear:(BOOL)animated {
    NSLog(@"view will appear");
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger defaultSegIndex = [defaults integerForKey:@"defaultSegIndex"];
    
    if (defaultSegIndex >= 0) {
        self.tipControl.selectedSegmentIndex = defaultSegIndex;
    }
    [self updateValue];
}

- (void)updateValue {
    //calculat bill amt + tip
    float billAmount = [self.billTextField.text floatValue];
    NSArray *tipValues = @[@(0.15), @(.18), @(0.2)];
    float tipAmount = [tipValues[self.tipControl.selectedSegmentIndex] floatValue] * billAmount;
    float totalAmount = billAmount + tipAmount;
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];
}
@end
