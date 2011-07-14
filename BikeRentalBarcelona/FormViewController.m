//
//  FormViewController.m
//  BikeRentalBarcelona
//
//  Created by Clément Hussenot-Desenonges on 16/06/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FormViewController.h"
#import "DetailUserViewController.h"

@implementation FormViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    appDelegate = (BikeRentalBarcelonaAppDelegate *)[[UIApplication sharedApplication] delegate];
    
    [super viewDidLoad];
}


#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        /*cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];*/
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellIdentifier];
    }
    //cell.selectionStyle = UITableViewCellEditingStyleNone;
    cell.accessoryType  = UITableViewCellAccessoryDisclosureIndicator;
    
    
    switch (indexPath.section) {
            //Attribute Section
        case 0:
            switch (indexPath.row) {
                case 0:
                    cell.textLabel.text = @"Title";
                    cell.detailTextLabel.text = @"Mr";
                    break;    
                case 1:
                    cell.textLabel.text = @"First Name";
                    cell.detailTextLabel.text = @"Clément";
                    break;
                case 2:
                    cell.textLabel.text = @"Name";
                    cell.detailTextLabel.text = @"Hussenot-Desenonges";
                    break;
                case 3:
                    cell.textLabel.text = @"E-mail";
                    cell.detailTextLabel.text = @"chussenot@gmail.com";
                    break;
                case 4:
                    cell.textLabel.text = @"Phone";
                    cell.detailTextLabel.text = @"33 616 772 183";
                    break;
                case 5:
                    cell.textLabel.text = @"Note";
                    cell.detailTextLabel.text = @"working hard !";
                    break;
                default:
                    break;
            }
            break;    
       default:
       break;
    }    
        
    // Set up the cell...
    return cell;
  
}
    
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"---YEP----" );
    /*
    DetailUserViewController *dvController = [[DetailUserViewController alloc] initWithNibName:@"test" bundle:nil];
    [self.navigationController pushViewController:dvController animated:YES];
    dvController = nil;
    */
   /* 
   UIViewController *cont = [[UIViewController alloc] initWithNibName:nil bundle:nil];
   cont.view.backgroundColor = [UIColor yellowColor];
   [self.navigationController pushViewController:cont animated:YES];
   */
}


- (void)viewDidUnload
{
    
    formTableView = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
