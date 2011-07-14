//
//  FormViewController.h
//  BikeRentalBarcelona
//
//  Created by Clément Hussenot-Desenonges on 16/06/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BikeRentalBarcelonaAppDelegate.h"

@interface FormViewController : UIViewController
{
    BikeRentalBarcelonaAppDelegate *appDelegate;
    
    IBOutlet UITableView *formTableView;
}

@end
