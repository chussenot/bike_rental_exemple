//
//  Bike.h
//  BikeRentalBarcelona
//
//  Created by Clément Hussenot-Desenonges on 09/06/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

/*
 rails generate scaffold bike name:string description:text features:text A_2h:integer A_3_6h:integer A_24h:integer A_extra:integer A_week:integer B_2h:integer B_3_6h:integer B_24h:integer B_extra:integer B_week:integer image:string
*/

#import <Foundation/Foundation.h>

@interface Bike : NSObject {

    NSString    *name;
    NSString    *description;
    NSString    *features;
    NSString    *image;
    
    NSString   *A_2h;
    NSString   *A_3_6h;
    NSString   *A_24h;
    NSString   *A_extra;
    NSString   *A_week;
    NSString   *B_2h;
    NSString   *B_3_6h;
    NSString   *B_24h;
    NSString   *B_extra;
    NSString   *B_week;    
    
}

@property (nonatomic, retain ) NSString   *name;
@property (nonatomic, retain ) NSString   *description;
@property (nonatomic, retain ) NSString   *features;
@property (nonatomic, retain ) NSString   *image;

@property (nonatomic, retain ) NSString   *A_2h;
@property (nonatomic, retain ) NSString   *A_3_6h;
@property (nonatomic, retain ) NSString   *A_24h;
@property (nonatomic, retain ) NSString   *A_extra;
@property (nonatomic, retain ) NSString   *A_week;
@property (nonatomic, retain ) NSString   *B_2h;
@property (nonatomic, retain ) NSString   *B_3_6h;
@property (nonatomic, retain ) NSString   *B_24h;
@property (nonatomic, retain ) NSString   *B_extra;
@property (nonatomic, retain ) NSString   *B_week;   

-(id)initWithName:(NSString *)n description:(NSString *)d url:(NSString *)u;


@end
