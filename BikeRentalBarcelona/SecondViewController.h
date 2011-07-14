//
//  SecondViewController.h
//  BikeRentalBarcelona
//
//  Created by Clément Hussenot-Desenonges on 07/06/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Bike.h"
#import "BikesParser.h"
#import "BikeRentalBarcelonaAppDelegate.h"
#import "FormViewController.h"
@interface SecondViewController : UIViewController
{
    BikeRentalBarcelonaAppDelegate *appDelegate;
    
    //views
    UIViewController *vcFilter;
    UIViewController *vcDateFrom;
    UIViewController *vcDateTo;
    FormViewController *form;
    
    UIButton *changeToDate;
    UILabel *dayInfoLabel;
    UIButton *fromDateButton;
    UIButton *toDateButton;
    IBOutlet UIBarButtonItem *nextButton;
    
    //Date
    NSDate *fromDate;
    NSDate *toDate;
    
    //Bikes
    UITableView *bikesTableView;
    Bike *currentBike;
    
    
    //Form
    
}

- (IBAction)filterBikes:(id)sender;
- (IBAction)changeFromDate:(id)sender;
- (IBAction)changeToDate:(id)sender;

- (void)checkNextButton;


@property (nonatomic, strong) IBOutlet UITableView *bikesTableView;
@property (nonatomic, retain) UIViewController *vcFilter;
@property (nonatomic, retain) UIViewController *vcDateFrom;
@property (nonatomic, retain) UIViewController *vcDateTo;
@property (nonatomic, strong) IBOutlet UILabel *dayInfoLabel;
@property (nonatomic, strong) IBOutlet UIButton *fromDateButton;
@property (nonatomic, strong) IBOutlet UIButton *toDateButton;
@property(nonatomic, retain) FormViewController *form; 


@end 
