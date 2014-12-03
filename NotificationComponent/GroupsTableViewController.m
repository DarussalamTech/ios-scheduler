//
//  GroupsTableViewController.m
//  NotificationComponent
//
//  Created by M Faheem Rajput on 27/11/2014.
//  Copyright (c) 2014 Dtech Systems. All rights reserved.
//

#import "GroupsTableViewController.h"

@interface GroupsTableViewController ()

@end

@implementation GroupsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}
-(void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:YES];
    
    [self readData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    

    // Return the number of rows in the section.
    return [groupArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL" forIndexPath:indexPath];
    
    GroupsModel*groupObj = (GroupsModel*)[groupArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@",groupObj.groupName];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    
    selectedIndex = indexPath.row;
    
    AddGroupViewController *AGVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ADDVIEW"];
    
    GroupsModel*groupObj = (GroupsModel*)[groupArray objectAtIndex:selectedIndex];
    
    AGVC.selectedGroupObj         = groupObj;
    AGVC.editMode                 = YES;
    
    [self.navigationController pushViewController:AGVC animated:YES];

    
//    UIAlertView *alertViewChangeName = [[UIAlertView alloc] initWithTitle:@"Edit Group Name" message:@"" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel", nil];
//    
//    alertViewChangeName.alertViewStyle=UIAlertViewStylePlainTextInput;
//    UITextField *textInput = [alertViewChangeName textFieldAtIndex:0];
//    [textInput setText:groupObj.groupName];
//    [alertViewChangeName show];

}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    
    if (buttonIndex == 0) {
        NSString *editedGroupName = [[alertView textFieldAtIndex:0] text];
        if (editedGroupName.length >0) {
            
             GroupsModel*groupObj = (GroupsModel*)[groupArray objectAtIndex:selectedIndex];
            
             groupObj.groupName   = editedGroupName;
            [groupArray replaceObjectAtIndex:selectedIndex withObject:groupObj];
            [[DatabaseClass sharedManager] updateGroup:groupObj];
            [self.tableView reloadData];
        }
        
    }

}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        
        [[DatabaseClass sharedManager] deleteGroupWithNotifications:[groupArray objectAtIndex:indexPath.row]];
        
        NotificationManager *notificationManagerObj = [[NotificationManager alloc] init];
        [notificationManagerObj updateNotifications];
        
        [groupArray removeObjectAtIndex:indexPath.row];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        

        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    
}





// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    

    if ([segue.identifier isEqualToString:@"ADDGROUP"]){
        AddGroupViewController * AGVC = (AddGroupViewController*)[segue destinationViewController];
        AGVC.editMode                 = NO;
    }
   
    
    
}


-(void)readData{
    
   groupArray = nil;
   groupArray = [[DatabaseClass sharedManager] selectAllGroupWithNotification];
    [self.tableView reloadData ];

}
@end
