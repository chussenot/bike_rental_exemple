//
//  BikesParser.h
//  BikeRentalBarcelona
//
//  Created by Clément Hussenot-Desenonges on 10/06/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Bike.h"

@interface BikesParser : NSObject <NSXMLParserDelegate>
{
    //Bikes
    UITableView *bikesTableView;
    NSMutableArray *bikes;
    NSInteger parsedBikesCounter;
    Boolean bikeResult;
    Bike *currentBike;
    NSString *currentBikeProperty;
    
    NSURL       *url;
    
}

-(void)loadBikes;
-(id)initWithURL:(NSString *)u;
-(void)parseBikes:(NSData *)file;

@property (nonatomic, retain ) NSURL         *url;
@property (nonatomic, retain ) NSMutableArray   *bikes;


@end
