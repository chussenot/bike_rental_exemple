//
//  Bike.m
//  BikeRentalBarcelona
//
//  Created by Clément Hussenot-Desenonges on 09/06/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Bike.h"

@implementation Bike

@synthesize description, name, features, image;
@synthesize A_24h, A_2h, A_3_6h, A_extra, A_week, B_24h, B_2h, B_3_6h, B_week, B_extra;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
        //name = [[NSString alloc] initWithFormat:@"Dahon"];
    }
    
    return self;
}

-(id)initWithName:(NSString *)n description:(NSString *)d url:(NSString *)u {
	self.name = n;
	self.description = d;
	self.image = u;
	return self;
}

@end
