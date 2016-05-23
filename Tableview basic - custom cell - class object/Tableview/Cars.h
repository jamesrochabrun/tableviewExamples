//
//  Cars.h
//  Tableview
//
//  Created by James Rochabrun on 10-05-16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cars : NSObject
@property NSString *name;
@property NSString *model;
@property int year;
- (instancetype)initWithName:(NSString *)name model:(NSString*)model year:(int)year;


@end
