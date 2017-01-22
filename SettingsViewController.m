//
//  SettingsViewController.m
//  tipViewController
//
//  Created by William Thai on 1/22/17.
//  Copyright © 2017 Y.CORP.YAHOO.COM\willthai. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *segTipValue;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onSegControlChange:(UISegmentedControl *)sender {
    NSUInteger defaultSelectedIndex = self.segTipValue.selectedSegmentIndex;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:defaultSelectedIndex forKey:@"defaultSegIndex"];
    [defaults synchronize];
}

- (void) viewWillAppear:(BOOL)animated {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger defaultSegIndex = [defaults integerForKey:@"defaultSegIndex"];
    
    if (defaultSegIndex >= 0) {
        self.segTipValue.selectedSegmentIndex = defaultSegIndex;
    }
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
