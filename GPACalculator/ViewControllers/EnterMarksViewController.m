//
//  EnterMarksViewController.m
//  Assignment02
//
//  Created by Sheeyam Shellvacumar on 10/3/18.
//  Copyright © 2018 UHCL. All rights reserved.
//

#import "EnterMarksViewController.h"

@interface EnterMarksViewController ()
@property (weak, nonatomic) IBOutlet UITextField *enterMarksTextField;

@end

NSUserDefaults* enterMarksPrefs;

@implementation EnterMarksViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"Category ----- %@", _category);
    
    enterMarksPrefs = [NSUserDefaults standardUserDefaults];
    NSUInteger marks = [enterMarksPrefs integerForKey:_category];
    NSLog(@"EnterMarksViewController ===  viewDidLoad %lu", marks);
    _enterMarksTextField.text = [NSString stringWithFormat:@"%@", @(marks)];
}

-(void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:YES];
    // Do any additional setup after loading the view.
    NSLog(@"Category ----- %@", _category);
    
    enterMarksPrefs = [NSUserDefaults standardUserDefaults];
    NSUInteger marks = [enterMarksPrefs integerForKey:_category];
    NSLog(@"EnterMarksViewController ===  viewDidLoad %lu", marks);
    _enterMarksTextField.text = [NSString stringWithFormat:@"%@", @(marks)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)addMarks:(id)sender {
    NSString* marks = _enterMarksTextField.text;
    if([marks intValue] > 0 && [marks intValue] <= 100) {
        enterMarksPrefs = [NSUserDefaults standardUserDefaults];
        [enterMarksPrefs setInteger:[marks intValue] forKey:_category];
        NSLog(@"_category Marks Updated");
        [self showAlertMsg:self title:_category message:@"Marks Updated"];
    } else {
        NSLog(@"_category Marks Invalid");
        [self showAlertMsg:self title:_category message:@"Marks Invalid"];
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
