//
//  ViewController.m
//  PassingAnObject
//
//  Created by James Rochabrun on 10-05-16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

#import "ViewController.h"
#import "Monsters.h"
#import "DestinationViewcontroller.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property NSMutableArray *monsters;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Monsters *monster = [[Monsters alloc]initWithName:@"Bob" location:@"Lima" age:@"32" color:@"black"];
    Monsters *monster1 = [[Monsters alloc]initWithName:@"Dallas" location:@"Lima" age:@"30" color:@"red"];
    Monsters *monster2 = [[Monsters alloc]initWithName:@"Craig" location:@"Lima" age:@"3" color:@"blue"];
    Monsters *monster3 = [[Monsters alloc]initWithName:@"Richard" location:@"chile" age:@"82" color:@"green"];
    Monsters *monster4 = [[Monsters alloc]initWithName:@"Donald" location:@"arizona" age:@"92" color:@"black"];
    Monsters *monster5 = [[Monsters alloc]initWithName:@"Bernie" location:@"Lima" age:@"32" color:@"black"];

    self.monsters = [NSMutableArray new];;
    self.monsters = [NSMutableArray arrayWithObjects:monster, monster1, monster2,monster3,monster4,monster5, nil];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    Monsters *monster = [self.monsters objectAtIndex:indexPath.row];
    cell.textLabel.text = monster.name;
    cell.detailTextLabel.text = monster.location;
    return cell;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.monsters.count;
}

 
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
     
     NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
     Monsters *monster = [self.monsters objectAtIndex:indexPath.row];
     DestinationViewcontroller *desVC = segue.destinationViewController;
     desVC.monster = monster;
 }

-(void)viewWillAppear:(BOOL)animated
{
    [self.tableView  reloadData];
}

    

@end
