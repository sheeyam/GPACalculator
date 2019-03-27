//
//  AssignmentsTableViewController.m
//  Assignment02
//
//  Created by Sheeyam Shellvacumar on 10/3/18.
//  Copyright © 2018 UHCL. All rights reserved.
//

#import "AssignmentsTableViewController.h"
#import "EnterMarksViewController.h"

@interface AssignmentsTableViewController ()

@end

@implementation AssignmentsTableViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    _dataArray = [[NSMutableArray alloc] initWithObjects:@"Assignment 01", @"Assignment 02", @"Assignment 03", @"Assignment 04", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"assignmentcell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [_dataArray objectAtIndex:indexPath.row];
    return cell;
}

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"Assignments";
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString* selectedCategory = [_dataArray objectAtIndex:indexPath.row];
    NSLog(@"selectedCategory ---- %@", selectedCategory);
    _sCategory = selectedCategory;
    [self performSegueWithIdentifier:@"AssignmentList2EnterMarks" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue is to emarksVC
    if ([[segue identifier] isEqualToString:@"AssignmentList2EnterMarks"])
    {
        UINavigationController *navController = [segue destinationViewController];
        // Get reference to emarksVC
        EnterMarksViewController *emarksVC = (EnterMarksViewController *)([navController viewControllers][0]);
        
        // Pass guess word to emarksVC
        emarksVC.category = _sCategory;
    }
}




/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
