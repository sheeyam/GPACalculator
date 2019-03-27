//
//  FinalProjectViewController.m
//  Assignment02
//
//  Created by Sheeyam Shellvacumar on 10/3/18.
//  Copyright © 2018 UHCL. All rights reserved.
//

#import "FinalProjectViewController.h"

@interface FinalProjectViewController ()
@property (weak, nonatomic) IBOutlet UITextField *projectMarksTextField;

@end

NSUserDefaults* finalProjectPrefs;

@implementation FinalProjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    finalProjectPrefs = [NSUserDefaults standardUserDefaults];
    NSUInteger marks = [finalProjectPrefs integerForKey:@"finalproject"];
    NSLog(@"FinalProjectViewController ===  viewDidLoad %lu", marks);
    _projectMarksTextField.text = [NSString stringWithFormat:@"%@", @(marks)];
}

-(void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:YES];
    // Do any additional setup after loading the view.
    finalProjectPrefs = [NSUserDefaults standardUserDefaults];
    NSUInteger marks = [finalProjectPrefs integerForKey:@"finalproject"];
    NSLog(@"FinalProjectViewController ===  viewDidLoad %lu", marks);
    _projectMarksTextField.text = [NSString stringWithFormat:@"%@", @(marks)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)updateFinalProjectMarks:(id)sender {
    NSString* finalProjMarks = _projectMarksTextField.text;
    if([finalProjMarks intValue] > 0 && [finalProjMarks intValue] <= 100) {
        NSUserDefaults* prefs = [NSUserDefaults standardUserDefaults];
        [prefs setObject:finalProjMarks forKey:@"finalproject"];
        NSLog(@"Final Project Marks Updated");
        [self showAlertMsg:self title:@"Final Project" message:@"Marks Updated"];
    } else {
        NSLog(@"Final Project Marks Invalid");
        [self showAlertMsg:self title:@"Final Project" message:@"Marks Invalid"];
    }
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}

//Alert function
- (void) showAlertMsg:(UIViewController *)viewController title:(NSString *)title message:(NSString *)message {
    
    UIAlertController * alert = [UIAlertController alertControllerWithTitle : title
                                                                    message : message
                                                             preferredStyle : UIAlertControllerStyleAlert];
    
    UIAlertAction * ok = [UIAlertAction
                          actionWithTitle:@"OK"
                          style:UIAlertActionStyleDefault
                          handler:^(UIAlertAction * action)
                          { }];
    
    [alert addAction:ok];
    dispatch_async(dispatch_get_main_queue(), ^{
        [viewController presentViewController:alert animated:YES completion:nil];
    });
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
