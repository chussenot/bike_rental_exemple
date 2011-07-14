//
//  BikeRentalBarcelonaAppDelegate.m
//  BikeRentalBarcelona
//
//  Created by Clément Hussenot-Desenonges on 07/06/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "BikeRentalBarcelonaAppDelegate.h"
#import "Bike.h"

@implementation BikeRentalBarcelonaAppDelegate

@synthesize window = _window;
@synthesize bikes, parser, checkboxArray;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // load bikes remotely
    //parser = [[BikesParser alloc] initWithURL:@"http://quiet-fire-822.heroku.com/bikes.xml"];
    //[parser loadBikes];
    checkboxArray = [[NSMutableArray alloc] init];
    
    // Setup some globals
	databaseName = @"development.sqlite3";
    
	// Get the path to the documents directory and append the databaseName
	NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDir = [documentPaths objectAtIndex:0];
	databasePath = [documentsDir stringByAppendingPathComponent:databaseName];
    
	// Execute the "checkAndCreateDatabase" function
	[self checkAndCreateDatabase];
    
	// Query the database for all animal records and construct the "animals" array
	[self readBikesFromDatabase];
    
    // Override point for customization after application launch.
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)applicationDidFinishLaunching:(UIApplication *)application
{

    
}

-(void) checkAndCreateDatabase{
	// Check if the SQL database has already been saved to the users phone, if not then copy it over
	BOOL success;
    
	// Create a FileManager object, we will use this to check the status
	// of the database and to copy it over if required
	NSFileManager *fileManager = [NSFileManager defaultManager];
    
	// Check if the database has already been created in the users filesystem
	success = [fileManager fileExistsAtPath:databasePath];
    
	// If the database already exists then return without doing anything
	if(success) return;
    
	// If not then proceed to copy the database from the application to the users filesystem
    
	// Get the path to the database in the application package
	NSString *databasePathFromApp = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:databaseName];
    
	// Copy the database from the package to the users filesystem
	[fileManager copyItemAtPath:databasePathFromApp toPath:databasePath error:nil];

}

-(void) readBikesFromDatabase {
	// Setup the database object
	sqlite3 *database;
    
	// Init the bikes Array
	bikes = [[NSMutableArray alloc] init];
    
	// Open the database from the users filessytem
	if(sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK) {
		// Setup the SQL Statement and compile it for faster access
		const char *sqlStatement = "select * from bikes";
		sqlite3_stmt *compiledStatement;
		if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
			// Loop through the results and add them to the feeds array
			while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
				// Read the data from the result row
				NSString *bName = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 1)];
				NSString *bDescription = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 2)];
				NSString *bImageUrl = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 14)];
                
				// Create a new bike object with the data from the database
				Bike *bike = [[Bike alloc] initWithName:bName description:bDescription url:bImageUrl];
                
				// Add the bike object to the bikes Array
				[bikes addObject:bike];
                
                [checkboxArray addObject:[[NSNumber alloc] initWithBool:NO]];
			}
		}
		// Release the compiled statement from memory
		sqlite3_finalize(compiledStatement);
        
	}
	sqlite3_close(database);
    
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
    // Save bikes data if appropriate
}

@end
