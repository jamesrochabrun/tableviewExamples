//
//  Cars.m
//  Tableview
//
//  Created by James Rochabrun on 10-05-16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

#import "Cars.h"

@implementation Cars
- (instancetype)initWithName:(NSString *)name model:(NSString*)model year:(int)year {
    
    self = [super init];
    if(self){
        
        //and here we set the values of the dragons properties with the arguments passed in the view controller
        self.name = name;
        self.model = model;
        self.year = year;
    }
    return self;
}

@end
