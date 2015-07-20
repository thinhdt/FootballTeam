//
//  NSArray+ExtendsArray.m
//  FootbalTeam
//
//  Created by mac on 7/16/15.
//  Copyright (c) 2015 mac. All rights reserved.
//

#import "NSArray+ExtendsArray.h"

@implementation NSArray (ExtendsArray)
-(NSArray* ) getArrayNotExist: (NSArray *) inputArray {
    NSMutableArray *team = [[NSMutableArray alloc] init];
    
    NSString *name = [[NSString alloc] init];
//    int counter = 0;
//    while (counter < 11) {
//        name = [self getPositionTeam:inputArray];
//        
//        BOOL exist = [self checkNameExist:name In:team];
//        if (!exist) {
//            [team addObject:name];
//            counter++;
//        }
//        
//    }
    
    for (int i = 0; i < inputArray.count; i++) {
        name = [self getPosition:i inTeam:inputArray];
        
        BOOL exist = [self checkNameExist:name In:team];
        if (!exist) {
            [team addObject:name];
        }
    }

    
    return team;
}

- (NSString*)getPosition: (int) position inTeam: (NSArray*) team {
    
    NSString *name = [[NSString alloc] init];
    name = team[position][@"name"];
    return name;
}

- (BOOL) checkNameExist: (NSString*) name In: (NSMutableArray *) team {
    return [team containsObject:name];
}

@end
