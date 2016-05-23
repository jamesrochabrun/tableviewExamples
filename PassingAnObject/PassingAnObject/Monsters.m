//
//  Monsters.m
//  PassingAnObject
//
//  Created by James Rochabrun on 10-05-16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

#import "Monsters.h"

@implementation Monsters
-(instancetype)initWithName:(NSString  *)name location:(NSString *)location age:(NSString*)age color:(NSString*)color
{
    //this is like a backup
    self = [super init];
    if(self){
        
        //and here we set the values of the dragons properties with the arguments passed in the view controller
        self.name = name;
        self.location = location;
        self.age = age;
        self.color = color;
    }
    return self;
}


@end
