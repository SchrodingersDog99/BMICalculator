//
//  ViewController.h
//  BMICalculator
//
//  Created by DonghuiLi on 16/6/29.
//  Copyright © 2016年 SchrodingersDog. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *bmiLabel;

@property (weak, nonatomic) IBOutlet UITextField *ageLabel;
@property (weak, nonatomic) IBOutlet UITextField *weightLabel;
@property (weak, nonatomic) IBOutlet UITextField *heightLabel;
@property (weak, nonatomic) IBOutlet UIImageView *picture;
@property (weak, nonatomic) IBOutlet UIImageView *picture_thin;
@property (weak, nonatomic) IBOutlet UILabel *weightUnitLabel;
@property (weak, nonatomic) IBOutlet UILabel *heightUnitLabel;

@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UILabel *bmrLabel;
@property (weak, nonatomic) IBOutlet UILabel *dietPlanLabel;
@property (weak, nonatomic) IBOutlet UIImageView *picture_normal;
@property (weak, nonatomic) IBOutlet UIImageView *picture_overwgt;

- (IBAction)unitButton:(id)sender;
- (IBAction)genderButton:(id)sender;
- (IBAction)calculateButton:(id)sender;
@end

