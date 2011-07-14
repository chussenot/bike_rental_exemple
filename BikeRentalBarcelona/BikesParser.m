//
//  BikesParser.m
//  BikeRentalBarcelona
//
//  Created by Clément Hussenot-Desenonges on 10/06/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "BikesParser.h"

@implementation BikesParser

@synthesize bikes, url;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

-(id)initWithURL:(NSString *)u {
	self.url = [NSURL URLWithString:u];
    return self;
}

-(void) loadBikes
{
    if(bikes == nil){
        parsedBikesCounter = 0;
        bikeResult = NO;
        bikes = [[NSMutableArray alloc] init];
        // This will issue a request to a web service API via HTTP GET to the URL specified by urlString.
        // It will return the XML string returned from the HTTP GET.
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] 
                                        initWithURL:url];
        [request setHTTPMethod:@"GET"];
        NSURLResponse *response = nil;
        NSError *error = nil;
        NSData *result = [NSURLConnection sendSynchronousRequest:request 
                                               returningResponse:&response error:&error];
        
        [self parseBikes: result];
        //[request release];
        //NSString *xmlData = [[NSString alloc] initWithData:result encoding:NSUTF8StringEncoding];
        
        for (Bike *bike in bikes)
        {
            // You can retrieve individual values using objectForKey on the status NSDictionary
            // This will print the tweet and username to the console
            //NSLog( bike.name );
        }        
    }
}

- (void) parseBikes:(NSData *)file
{
	//----- PARSE THE XML -----
	NSXMLParser *parser = [[NSXMLParser alloc] initWithData:file];
	[parser setDelegate:self];
	[parser parse];
	//We hold here until the parser finishes execution
}

- (void) parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    if([elementName isEqualToString:@"bike"])
    {
        NSLog(@"New Bike !");
        parsedBikesCounter++;
        bikeResult = YES;
        currentBike = [[Bike alloc] init];
        
    }
    currentBikeProperty = nil; 
    if( bikeResult )
    {
        //NSLog(elementName); 
        currentBikeProperty = elementName; 
    } 
    
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if( bikeResult && currentBike != nil )
    {
        //NSLog([[NSString alloc] initWithFormat: @"->%@", string ]); 
        if( [currentBikeProperty isEqualToString: @"name"] ){ 
            currentBike.name = string; // do't copy my bike name...
            //NSLog([[NSString alloc] initWithFormat: @"name -> %@", string]); // trace my bike name...
        };
        if( [currentBikeProperty isEqualToString: @"description"] ){ [currentBike setDescription:string];};
        if( [currentBikeProperty isEqualToString: @"image"] ){ currentBike.image = string ; };
    }
    currentBikeProperty = nil;  
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if([elementName isEqualToString:@"bike"])
    {
        NSLog(@"End Bike !");
        bikeResult = NO;
        [bikes addObject:currentBike];
       
    }  
}

// error handler
- (void) parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError
{
    
}


@end
