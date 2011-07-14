//
//  BikeRentalBarcelonaAppDelegate.h
//  BikeRentalBarcelona
//
//  Created by Clément Hussenot-Desenonges on 07/06/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "sqlite3.h"
#import "Bike.h"
#import "BikesParser.h"

@interface BikeRentalBarcelonaAppDelegate : UIResponder <UIApplicationDelegate>
{
      NSString          *databaseName;
      NSString          *databasePath;
    
    //Bikes
    NSMutableArray *bikes;
    BikesParser *parser;
    NSMutableArray *checkboxArray;
    
}

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) NSMutableArray *bikes;
@property (nonatomic, retain) BikesParser *parser;
@property (nonatomic, retain ) NSMutableArray   *checkboxArray;


-(void)readBikesFromDatabase;
-(void)checkAndCreateDatabase;

@end
