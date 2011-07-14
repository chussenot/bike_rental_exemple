//
//  FirstViewController.h
//  BikeRentalBarcelona
//
//  Created by Clément Hussenot-Desenonges on 07/06/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>


@interface FirstViewController : UIViewController <UIActionSheetDelegate> {
    UIViewController *vc;
}

- (IBAction)showContactMenu:(id)sender;
- (IBAction)sendEmail:(id)sender;
- (IBAction)viewWebsite:(id)sender;
- (IBAction)makeCall:(id)sender;


@property (nonatomic, retain) UIViewController *vc;

@end
