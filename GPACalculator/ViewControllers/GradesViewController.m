//
//  GradesViewController.m
//  Assignment02
//
//  Created by Sheeyam Shellvacumar on 10/3/18.
//  Copyright © 2018 UHCL. All rights reserved.
//

#import "GradesViewController.h"

@interface GradesViewController ()
@property (weak, nonatomic) IBOutlet UILabel *totalScoreTextLbl;
@property (weak, nonatomic) IBOutlet UILabel *gradeLbl;
@property (weak, nonatomic) IBOutlet UIButton *refreshMarksBtn;
@end

NSUserDefaults* prefs;
@implementation GradesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    prefs = [NSUserDefaults standardUserDefaults];
    
    // Load Marks and Calculate Grade
    NSUInteger getMarks;
    getMarks = [prefs integerForKey:@"totalMarks"];
    NSLog(@"getMarks ===  viewDidLoad %lu", getMarks);
    _totalScoreTextLbl.text = [NSString stringWithFormat:@"%@", @(getMarks)];
    
    // Call function to decide grade.
    [self decideGrade: getMarks];
}

-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    [self calculateMarks];
}

- (IBAction)refreshMarks:(id)sender {
    NSUserDefaults* prefs = [NSUserDefaults standardUserDefaults];
    _totalScoreTextLbl.text = [NSString stringWithFormat:@"%@", @([prefs integerForKey:@"totalMarks"])];
    [self decideGrade: [prefs integerForKey:@"totalMarks"]];
}

-(void) calculateMarks {
    prefs = [NSUserDefaults standardUserDefaults];
    NSUInteger getMarks = [prefs integerForKey:@"totalMarks"];
    _totalScoreTextLbl.text = [NSString stringWithFormat:@"%lu",getMarks];
    NSLog(@"getMarks ===  viewDidAppear %lu", [prefs integerForKey:@"totalMarks"]);
    [self decideGrade: getMarks];
    
    NSLog(@"Assignment 01 %lu", [prefs integerForKey:@"Assignment 01"]);
    NSUInteger assignment01 = [prefs integerForKey:@"Assignment 01"];
    NSLog(@"Assignment 02 %lu", [prefs integerForKey:@"Assignment 02"]);
    NSUInteger assignment02 = [prefs integerForKey:@"Assignment 02"];
    NSLog(@"Assignment 03 %lu", [prefs integerForKey:@"Assignment 03"]);
    NSUInteger assignment03 = [prefs integerForKey:@"Assignment 03"];
    NSLog(@"Assignment 04 %lu", [prefs integerForKey:@"Assignment 04"]);
    NSUInteger assignment04 = [prefs integerForKey:@"Assignment 04"];
    
    NSLog(@"Midterm %lu", [prefs integerForKey:@"Midterm"]);
    NSUInteger midterm = [prefs integerForKey:@"Midterm"];
    NSLog(@"Final Exam %lu", [prefs integerForKey:@"Final"]);
    NSUInteger final = [prefs integerForKey:@"Final"];
    
    NSLog(@"finalproject %lu", [prefs integerForKey:@"finalproject"]);
    NSUInteger finalProject = [prefs integerForKey:@"finalproject"];
    
    // Calcualte Total Marks Function
    // Assignments 25%
    // Final Project 30%
    // Midterm Exam 20%
    // Final Exam 25%
    NSUInteger finalPoints = ((assignment01 + assignment02 + assignment03 + assignment04) * 0.25/4.00 ) + (midterm * 0.2) + (final * 0.25) + (finalProject * 0.3);
    NSLog(@"finalPoints ===== %lu", finalPoints);
    
    [prefs setInteger:finalPoints forKey:@"totalMarks"];
    [self decideGrade: finalPoints];
}

- (void)decideGrade:(NSUInteger)getMarks {
    /* local variable declaration */
    if(getMarks <= 100 && getMarks >= 91){
        _gradeLbl.text = @"A";
    } else if(getMarks < 91 && getMarks >= 89){
        _gradeLbl.text = @"A-";
    } else if(getMarks < 89 && getMarks >= 86){
        _gradeLbl.text = @"B+";
    } else if(getMarks < 86 && getMarks >= 82){
        _gradeLbl.text = @"B";
    } else if(getMarks < 82 && getMarks >= 79){
        _gradeLbl.text = @"B-";
    } else if(getMarks < 79 && getMarks >= 76){
        _gradeLbl.text = @"C+";
    } else if(getMarks < 76 && getMarks >= 72){
        _gradeLbl.text = @"C";
    } else if(getMarks < 72 && getMarks >= 70){
        _gradeLbl.text = @"C-";
    } else if(getMarks < 70 && getMarks >= 60){
        _gradeLbl.text = @"D";
    } else if(getMarks < 60 && getMarks > 0){
        _gradeLbl.text = @"F";
    } else {
        _gradeLbl.text = @"N/A";
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
