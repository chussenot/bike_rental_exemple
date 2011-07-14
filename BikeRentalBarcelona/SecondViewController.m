//
//  SecondViewController.m
//  BikeRentalBarcelona
//
//  Created by Clément Hussenot-Desenonges on 07/06/11.
//  Copyright 2011 Emeth Animation. All rights reserved.
//

// JSON C Lib exemples
// http://gabriel.github.com/yajl-objc/


#define FONT_SIZE 14.0f
#define PORT 3000

#import "SecondViewController.h"

@implementation SecondViewController

@synthesize dayInfoLabel;
@synthesize fromDateButton;
@synthesize toDateButton;
@synthesize bikesTableView;
//views
@synthesize vcFilter, vcDateFrom, vcDateTo, form;


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (int)daysBetweenDates:(NSDate *)dt1:(NSDate *)dt2 {
    int numDays;
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSUInteger unitFlags = NSDayCalendarUnit;
    NSDateComponents *components = [gregorian components:unitFlags fromDate:dt1 toDate:dt2 options:0];
    numDays = [components day];
    //[gregorian release];
    
    return numDays;
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    NSLog(@"new RentViewController");
    
    appDelegate = (BikeRentalBarcelonaAppDelegate *)[[UIApplication sharedApplication] delegate];
    
    nextButton.enabled = NO;
    NSDate *localDate = [[NSDate alloc] init];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"UTC"];
    [dateFormatter setTimeZone:timeZone];
    [dateFormatter setDateFormat:@"dd/MM/yyyy"];
    NSString *dateString = [dateFormatter stringFromDate:localDate];
    //[dateFormatter release];    
    NSString *days = [[NSString alloc] initWithFormat: @"%d day(s)", 3];
    
    fromDateButton.titleLabel.text = dateString;
    toDateButton.titleLabel.text   = dateString;
    dayInfoLabel.text = days;
    

	
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setBikesTableView:nil];

    [self setDayInfoLabel:nil];
    [self setFromDateButton:nil];
    [self setToDateButton:nil];
    nextButton = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.bikesTableView reloadData];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (IBAction)filterBikes:(id)sender {
    vcFilter = [[UIViewController alloc] initWithNibName:nil bundle:nil];
    vcFilter.view.backgroundColor = [UIColor orangeColor];
    
    
    UIButton *all = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [all setFrame:CGRectMake(20.0f, 50.0f, 280.0f, 40.0f)];
	[all setTitle:@"All" forState:UIControlStateNormal];
	[all addTarget:self action:@selector(dismissFilterView) forControlEvents:UIControlEventTouchUpInside];
    
	[vcFilter.view addSubview:all];
    
    UINavigationBar *top = [[UINavigationBar alloc] init];
    //UIBarButtonItem *ok  = [UIBarButtonItem alloc];
    //[top :ok];
    
    [vcFilter.view addSubview:top];
    
    
    [self presentModalViewController:vcFilter animated:YES];
}

- (IBAction)changeFromDate:(id)sender {
    /*
    vcDateFrom = [[UIViewController alloc] initWithNibName:nil bundle:nil];
    vcDateFrom.view.backgroundColor = [UIColor clearColor];
    
    
    UIButton *close = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [close setFrame:CGRectMake(20.0f, 50.0f, 280.0f, 40.0f)];
	[close setTitle:@"Close" forState:UIControlStateNormal];
	[close addTarget:self action:@selector(dismissDateFromView) forControlEvents:UIControlEventTouchUpInside];
    
	[vcDateFrom.view addSubview:close];
    
    UIDatePicker *picker = [[UIDatePicker alloc] init];
    [vcDateFrom.view addSubview:picker];
    picker.datePickerMode = UIDatePickerModeDate;
    
    [self presentModalViewController:vcDateFrom animated:YES];
     */
}

- (IBAction)changeToDate:(id)sender {
}



- (void)dismissFilterView {
	[self dismissModalViewControllerAnimated:YES];
	//[vcFilter release];
}

- (void)dismissDateFromView {
	[self dismissModalViewControllerAnimated:YES];
	//[vcFilter release];
}

- (void)dismissDateToView {
	[self dismissModalViewControllerAnimated:YES];
	//[vcFilter release];
}


#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //[[appDelegate parser ] loadBikes];
    return [[ appDelegate  bikes ] count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        /*cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];*/
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
          
    currentBike = [[appDelegate bikes] objectAtIndex:[indexPath row]];
    
    if ([[[appDelegate checkboxArray ] objectAtIndex:indexPath.row] boolValue] == YES ) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        //NSLog(@"---> %@ %@", currentBike.name, @"OK" );
    }
    else {
        cell.accessoryType = UITableViewCellAccessoryNone;
        //NSLog(@"---> %@ %@", currentBike.name, @"KO" );
    }
    
    // define the range you're interested in
    NSRange stringRange = {0, MIN([currentBike.name length], 26)};
    // adjust the range to include dependent chars
    stringRange = [currentBike.name rangeOfComposedCharacterSequencesForRange:stringRange];
    // Now you can create the short string
    NSString *name = [currentBike.name substringWithRange:stringRange];
    [cell.textLabel setText: name ];
    [cell.detailTextLabel setText: currentBike.description];
    
    NSString *url = [[NSString alloc] initWithFormat:@"http://quiet-fire-822.heroku.com/bikes/tn/%@_tn.jpg",  [currentBike.image substringToIndex:[currentBike.image length ] - 4 ]] ;
    

    UIImage *img = [UIImage imageWithData: [NSData dataWithContentsOfURL: [NSURL URLWithString: url]]] ;
	if (img != nil) { // Image was loaded successfully.
        cell.imageView.image = img;
	}
    
    // Set up the cell...
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"-------" );
    currentBike = [[appDelegate bikes] objectAtIndex:[indexPath row]];
    
    if ([[[appDelegate checkboxArray ] objectAtIndex:indexPath.row] boolValue]){
        //[checkboxArray objectAtIndex:indexPath.row] = NO;
        //[request setPostValue:[propertyValues objectAtInstance:i] forKey:[propertyKeys objectAtInstance:i]];
        //[checkboxArray replaceObjectAtIndex:indexPath.row withObject:NO];
        NSNumber *b = [[NSNumber alloc] initWithBool:NO];
        [[appDelegate checkboxArray ] replaceObjectAtIndex:indexPath.row withObject:b];
        NSLog(@"---> %@ %@", currentBike.name, @"KO" );
    } else {
       //[checkboxArray objectAtIndex:indexPath.row] = YES;
        //[checkboxArray replaceObjectAtIndex:indexPath.row withObject:YES];
        NSNumber *b = [[NSNumber alloc] initWithBool:YES];
        [[appDelegate checkboxArray ] replaceObjectAtIndex:indexPath.row withObject:b];
        NSLog(@"---> %@ %@", currentBike.name, @"OK" );
    }
     NSLog(@"-------" );
    [self checkNextButton];
    [self.bikesTableView reloadData];
}

-(void) checkNextButton
{
    nextButton.enabled = NO;
    for (NSString *b in [appDelegate checkboxArray ]) {
        if( [b boolValue] )
        {
           nextButton.enabled = YES;
           break;
        }
    }

    
}




@end
