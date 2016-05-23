//
//  Todo.m
//  EditingItemsInTableView
//
//  Created by James Rochabrun on 10-05-16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

#import "Todo.h"

@implementation Todo
- (instancetype)initWithName:(NSString*)name {
    
    self = [super init];
    if(self){
        self.name = name;
    }
    return self;
    
}

@end
