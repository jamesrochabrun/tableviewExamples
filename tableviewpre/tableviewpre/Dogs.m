//
//  Dogs.m
//  tableviewpre
//
//  Created by James Rochabrun on 24-03-16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

#import "Dogs.h"

@interface Dogs ()


@end

@implementation Dogs
-(instancetype)initWithName:(NSString  *)name raza:(NSString *)raza
{
    //this is like a backup
    self = [super init];
    if(self){
        
        //and here we set the values of the dragons properties with the arguments passed in the view controller
        self.name = name;
        self.raza = raza;
    }
    return self;
}

@end
