//
//  ViewController.m
//  tableviewpre
//
//  Created by James Rochabrun on 24-03-16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

#import "ViewController.h"
#import "Dogs.h"
#import "DestinationViewController.h"

@interface ViewController ()< UITableViewDelegate, UITableViewDataSource,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property NSMutableArray *colors;
@property NSMutableArray *dogsData;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextField *textFieldRaza;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.colors = [@[[UIColor redColor],[UIColor greenColor],[UIColor blueColor],[UIColor orangeColor]]mutableCopy];
    Dogs *dog0 = [[Dogs alloc]initWithName:@"peluso" raza:@"labrador"];
    Dogs *dog1 = [[Dogs alloc]initWithName:@"rafo" raza:@"cocker"];
    Dogs *dog2 = [[Dogs alloc]initWithName:@"claudio" raza:@"pitbull"];
    Dogs *dog3 = [[Dogs alloc]initWithName:@"lucho" raza:@"pug"];
    
    
    self.dogsData = [[NSMutableArray alloc]init];

    self.dogsData = [NSMutableArray arrayWithObjects:dog0,dog1,dog2,dog3, nil];
    
    for (Dogs *d in self.dogsData) {
        NSLog(@"%@,%@", d.name,d.raza);
    }
    
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dogsData.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //this is for dsiplay the data in the cell
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
    
//    cell.backgroundColor = self.colors[indexPath.row];
    
    
    Dogs *dogData = [self.dogsData objectAtIndex:indexPath.row];
    
    cell.textLabel.text = dogData.name;
    
    cell.detailTextLabel.text = dogData.raza;


    return  cell;
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //this is for display the data in trhe destinationVoewcontroller
    
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    
    Dogs *dogData = [self.dogsData objectAtIndex:indexPath.row];
    
    DestinationViewController *desVC = segue.destinationViewController;
    
    //this is the title not the label if we want to pass values one by one
//    desVC.title = dogData.name;
//    
//    desVC.oldRazaLabel = dogData.raza;
    
    
    //its better to pass the full object
    desVC.dogData = dogData;

}

//REMEMBER!!!
-(void)viewWillAppear:(BOOL)animated
{
    [self.tableView  reloadData];
}

- (IBAction)addItemTap:(UIBarButtonItem *)sender {
    
    
    [self.textField becomeFirstResponder];
    
    Dogs *dogData = [[Dogs alloc]initWithName:self.textField.text raza:self.textFieldRaza.text];
    
    [self.dogsData addObject:dogData];

    [self.textField endEditing:YES];
    
    self.textField.text = nil;
    self.textFieldRaza.text = nil;

    
    [self.tableView reloadData];
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    
    Dogs *dogData = [[Dogs alloc]initWithName:self.textField.text raza:self.textFieldRaza.text];

    [self.dogsData addObject:dogData];
    [self.tableView reloadData];
    
    [self.textField becomeFirstResponder];
    [self.textField endEditing:YES];
    self.textField.text = nil;
    self.textFieldRaza.text = nil;

    
    return YES;

}

- (IBAction)editItem:(UIBarButtonItem *)sender {
    if (self.editing) {
        self.editing = false;
        [self.tableView setEditing:false animated:true];
        sender.style = UIBarButtonItemStylePlain;
        sender.title = @"Edit";
    } else {
        self.editing = true;
        [self.tableView setEditing:true animated:true];
        sender.style = UIBarButtonItemStyleDone;
        sender.title = @"Done";
    }
}

-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
    return true;
}

-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    
    Dogs *dogData = [[Dogs alloc]initWithName:self.textField.text raza:self.textFieldRaza.text];

 
    [self.dogsData removeObject:dogData];
    [self.dogsData insertObject:dogData atIndex:destinationIndexPath.row];
    
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UIAlertController *deleteConfirmation = [UIAlertController alertControllerWithTitle:@"Are you sure?" message:@"You can't undo this" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *confirm = [UIAlertAction actionWithTitle:@"Confirm" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [self.dogsData removeObjectAtIndex:indexPath.row];
        
        [self.tableView reloadData];
    }];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
        self.tableView.editing=false;
    }];
    
    [deleteConfirmation addAction:confirm];
    [deleteConfirmation addAction:cancel];
    
    [self presentViewController:deleteConfirmation animated:true completion:nil];

}

//select cells
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = (UITableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    
    
    cell.contentView.backgroundColor = [UIColor greenColor];

}














@end









