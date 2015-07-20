//
//  ViewController.m
//  FootbalTeam
//
//  Created by mac on 7/16/15.
//  Copyright (c) 2015 mac. All rights reserved.
//

#import "ViewController.h"
#import "NSArray+ExtendsArray.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   
   }

- (IBAction)actionBai1:(id)sender {
    [self demoBai1];
}

- (IBAction)actionBai2:(id)sender {
    [self demoBai2];
}


- (void) demoBai1 {
    NSArray *football = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource: @"football" ofType:@"plist"]];
    NSMutableArray *team = [[NSMutableArray alloc] init];
    
    NSString *name = [[NSString alloc] init];
    int counter = 0;
    while (counter < 11) {
        name = [self getPositionTeam:football];
        
        BOOL exist = [self checkNameExist:name In:team];
        if (!exist) {
            [team addObject:name];
            counter++;
        }
        
    }
    
    
    NSLog(@"name = %@", team);
    //    for (NSString *tmp in team) {
    //        NSLog(@"name = %@", tmp);
    //    }
    
}

- (void) demoBai2 {
    NSArray *football = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource: @"team" ofType:@"plist"]];
    NSArray *team = [[NSMutableArray alloc] init];
    team = [football getArrayNotExist:football];
    
    NSLog(@"name = %@", team);

}
- (NSString*)getPositionTeam: (NSArray *)team {
    int position;
    NSString *name = [[NSString alloc] init];
    if ([team count] > 0) {
        position = arc4random_uniform([team count]);
        //NSLog(@"%@", team[position][@"name"]);
        name = team[position][@"name"];
    }
    return name;
}

- (BOOL) checkNameExist: (NSString *)name In: (NSMutableArray *)team {
    return [team containsObject:name];
}



@end
