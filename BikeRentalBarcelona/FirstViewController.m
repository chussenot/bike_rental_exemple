//
//  FirstViewController.m
//  BikeRentalBarcelona
//
//  Created by Clément Hussenot-Desenonges on 07/06/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//


#import "FirstViewController.h"

@implementation FirstViewController

@synthesize vc;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
   
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
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

- (IBAction)showContactMenu:(id)sender {
    
    /*
    vc = [[UIViewController alloc] initWithNibName:nil bundle:nil];
    vc.view.backgroundColor = [UIColor orangeColor];
   
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setFrame:CGRectMake(20.0f, 380.0f, 280.0f, 40.0f)];
	[button setTitle:@"Cancel" forState:UIControlStateNormal];
	[button addTarget:self action:@selector(dismissContactView) forControlEvents:UIControlEventTouchUpInside];
    
	[vc.view addSubview:button];
    
    UIButton *add = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [add setFrame:CGRectMake(20.0f, 130.0f, 280.0f, 40.0f)];
	[add setTitle:@"Add Contact" forState:UIControlStateNormal];
	[add addTarget:self action:@selector(addContact) forControlEvents:UIControlEventTouchUpInside];
    
	[vc.view addSubview:add];
    
    UIButton *share = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [share setFrame:CGRectMake(20.0f, 200.0f, 280.0f, 40.0f)];
	[share setTitle:@"Share Contact" forState:UIControlStateNormal];
	[share addTarget:self action:@selector(dismissContactView) forControlEvents:UIControlEventTouchUpInside];
    
	[vc.view addSubview:share];
    
    [self presentModalViewController:vc animated:YES];
    */
    
    UIActionSheet *popupQuery = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Add Contact", @"Share Contact", nil];
	popupQuery.actionSheetStyle = UIActionSheetStyleBlackOpaque;
    [popupQuery showInView:self.view];
	//[popupQuery release];
    
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
	if (buttonIndex == 0) {
		//self.label.text = @"Destructive Button Clicked";
	} else if (buttonIndex == 1) {
		//self.label.text = @"Add Button Clicked";
	} else if (buttonIndex == 2) {
		//self.label.text = @"Share Button Clicked";
	} else if (buttonIndex == 3) {
		//self.label.text = @"Cancel Button Clicked";
	}
}

- (void)dismissContactView {
	[self dismissModalViewControllerAnimated:YES];
	//[vc release];
}

- (void)addContact {
	//[self dismissModalViewControllerAnimated:YES];
	    
}


- (IBAction)sendEmail:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"mailto://info@bikerentalbarcelona.es"]];
}

- (IBAction)viewWebsite:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.bikerentalbarcelona.es/"]];
}

- (IBAction)makeCall:(id)sender {
    
    NSURL *url = [ [ NSURL alloc ] initWithString: @"tel:+34666057655" ];
    UIDevice *device = [UIDevice currentDevice];
    if ([[device model] isEqualToString:@"iPhone"] ) {
        [[UIApplication sharedApplication] openURL:url];
    } else {
        UIAlertView *Notpermitted=[[UIAlertView alloc] initWithTitle:@"Alert" message:@"Your device doesn't support this feature." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [Notpermitted show];
       
    }
    
}


@end
