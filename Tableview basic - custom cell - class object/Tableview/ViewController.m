//
//  ViewController.m
//  Tableview
//
//  Created by James Rochabrun on 10-05-16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

#import "ViewController.h"
#import "CustomTableViewCell.h"
#import "Cars.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>
@property NSMutableArray *cars;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextField *modelTextField;
@property (weak, nonatomic) IBOutlet UITextField *yearTextField;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.cars = [NSMutableArray new];
    NSLog(@"%@", self.cars);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CustomTableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    Cars *car = [self.cars objectAtIndex:indexPath.row];
    
    cell.nameLabel.text = car.name;
    cell.modelLabel.text = car.model;
    cell.yearLabel.text = [NSString stringWithFormat:@"%i", car.year];
    return cell;
    }

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cars.count;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    Cars *car = [[Cars alloc]initWithName:self.textField.text model:self.modelTextField.text year:[self.yearTextField.text intValue]];
    [self.cars addObject:car];
    [self.tableView reloadData];
    
    [self.textField becomeFirstResponder];
    [self.textField endEditing:YES];
    self.textField.text = nil;
    self.modelTextField.text = nil;
    self.yearTextField.text = nil;
    
    return YES;
    
}

- (IBAction)addItem:(UIBarButtonItem *)sender {
    
    [self.textField becomeFirstResponder];
    Cars *car = [[Cars alloc]initWithName:self.textField.text model:self.modelTextField.text year:[self.yearTextField.text intValue]];
    [self.cars addObject:car];
    [self.textField endEditing:YES];
    self.textField.text = nil;
    self.modelTextField.text = nil;
    self.yearTextField.text = nil;
    [self.tableView reloadData];
}








@end
