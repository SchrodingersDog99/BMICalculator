//
//  ViewController.m
//  BMICalculator
//
//  Created by DonghuiLi on 16/6/29.
//  Copyright © 2016年 SchrodingersDog. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

static bool genderValue = YES;
static bool unitValue = YES;

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (IBAction)unitButton:(id)sender {
	unitValue = !unitValue;
	if (unitValue == NO) {
		self.weightUnitLabel.text = @"lb";
		self.heightUnitLabel.text = @"in";
	}
	else {
		self.weightUnitLabel.text = @"kg";
		self.heightUnitLabel.text = @"m";
	}
}

- (IBAction)genderButton:(id)sender {
	genderValue = !genderValue;
	//NSLog(@"%d", genderValue);
}

- (IBAction)calculateButton:(id)sender {
	[self.weightLabel resignFirstResponder];
	[self.heightLabel resignFirstResponder];
	[self.ageLabel resignFirstResponder];

	Person *p = [Person sharedPersonInstance];
	//NSLog(@"%@", [p description]);
	
	
	
	p.weightInKG = @(self.weightLabel.text.doubleValue);
	p.heightINM = @(self.heightLabel.text.doubleValue);
	p.ageInYear = @(self.ageLabel.text.doubleValue);
	p.sex = @(genderValue);
	
	if (unitValue == NO) [p unitTrans];
	//p.weightInKg = [NSNumber numberWithFloat: self.weightLabel.text.doubleValue];
	//4.285; 0.04572
	if (p.heightINM.doubleValue != 0) {
		//NSLog(@"%@	%@", p.weightInKG, p.heightINM);
		self.bmiLabel.text = [NSString stringWithFormat:@"%0.2f",([p bmi]).doubleValue];
		double t = ([p bmi]).doubleValue;
		NSBundle* myBundle = [NSBundle mainBundle];
		NSString* path;
		if (t < 16)
			self.resultLabel.text = @"Severe Thinness";
		else if (t < 17)
			self.resultLabel.text = @"Moderate Thinness";
		else if (t < 18.5)
			self.resultLabel.text = @"Mild Thinness";
		else if (t < 25)
			self.resultLabel.text = @"Normal Range";
		else if (t < 30)
			self.resultLabel.text = @"Overweight";
		else if (t < 35)
			self.resultLabel.text = @"Obese(Moderate)";
		else if (t < 40)
			self.resultLabel.text = @"Obese(Severe)";
		else
			self.resultLabel.text = @"Obese(Very Severe)";
		
		if (p.sex.boolValue == YES)
			path = [myBundle pathForResource:@"photo" ofType:@"jpg"];
		else
			path = [myBundle pathForResource:@"photo" ofType:@"jpg"];
		
		UIImage* newImage = [UIImage imageWithContentsOfFile:path];
		
		if (t < 18.5) {
			self.picture_thin.image = newImage;
			self.picture_normal.image = nil;
			self.picture_overwgt.image = nil;
			self.picture.image = nil;
		}
		else if (t < 25) {
			self.picture_thin.image = nil;
			self.picture_normal.image = newImage;
			self.picture_overwgt.image = nil;
			self.picture.image = nil;
		}
		else if (t < 30){
			self.picture_thin.image = nil;
			self.picture_normal.image = nil;
			self.picture_overwgt.image = newImage;
			self.picture.image = nil;
		}
		else{
			self.picture_thin.image = nil;
			self.picture_normal.image = nil;
			self.picture_overwgt.image = nil;
			self.picture.image = newImage;
		}

		
		//self.bmiLabel.text = bmi.stringValue;
		
		self.bmrLabel.text = [NSString stringWithFormat:@"%0.2f", ([p bmr].doubleValue)];
		self.dietPlanLabel.text = [p dietPlanDescription];
	}
	else {
		self.bmiLabel.text = @"Please enter a valid number";
	}
}

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
	[self.weightLabel resignFirstResponder];
	[self.heightLabel resignFirstResponder];
	[self.ageLabel resignFirstResponder];
}

@end
