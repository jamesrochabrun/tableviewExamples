//
//  Monsters.h
//  PassingAnObject
//
//  Created by James Rochabrun on 10-05-16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Monsters : NSObject
@property NSString *name;
@property NSString *location;
@property NSString *age;
@property NSString *color;
-(instancetype)initWithName:(NSString  *)name location:(NSString *)location age:(NSString*)age color:(NSString*)color;


@end
