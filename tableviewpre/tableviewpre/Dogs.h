//
//  Dogs.h
//  tableviewpre
//
//  Created by James Rochabrun on 24-03-16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dogs : NSObject
@property NSString *name;
@property NSString *raza;
-(instancetype)initWithName:(NSString  *)name raza:(NSString *)raza;


@end
