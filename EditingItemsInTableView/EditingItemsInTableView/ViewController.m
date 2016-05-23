//
//  ViewController.m
//  EditingItemsInTableView
//
//  Created by James Rochabrun on 10-05-16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

#import "ViewController.h"
#import "Todo.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>
@property NSMutableArray *toDos;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.toDos = [NSMutableArray new];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.toDos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    Todo *todo = [self.toDos objectAtIndex:indexPath.row];
    cell.textLabel.text = todo.name;
    return cell;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    Todo *todo = [[Todo alloc]initWithName:self.textField.text];
    
    [self.toDos addObject:todo];
    [self.tableView reloadData];
    [self.textField becomeFirstResponder];
    [self.textField endEditing:YES];
    self.textField.text = nil;
    return YES;
}

- (IBAction)addToDos:(UIBarButtonItem *)sender {
    
    [self.textField becomeFirstResponder];
    Todo *todo = [[Todo alloc]initWithName:self.textField.text];
    [self.toDos addObject:todo];
    [self.textField endEditing:YES];
    self.textField.text = nil;
    [self.tableView reloadData];
}

- (IBAction)editToDo:(UIBarButtonItem *)sender {
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

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UIAlertController *deleteConfirmation = [UIAlertController alertControllerWithTitle:@"Are you sure?" message:@"You can't undo this" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *confirm = [UIAlertAction actionWithTitle:@"Confirm" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [self.toDos removeObjectAtIndex:indexPath.row];
        
        [self.tableView reloadData];
    }];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
        self.tableView.editing=false;
    }];
    
    [deleteConfirmation addAction:confirm];
    [deleteConfirmation addAction:cancel];
    
    [self presentViewController:deleteConfirmation animated:true completion:nil];
}

-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
    return true;
}

-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    
    Todo *todo = [[Todo alloc]initWithName:self.textField.text];
    [self.toDos removeObject:todo];
    [self.toDos insertObject:todo atIndex:destinationIndexPath.row];
    
}



@end
