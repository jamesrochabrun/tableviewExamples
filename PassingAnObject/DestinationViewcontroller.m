//
//  DestinationViewcontroller.m
//  PassingAnObject
//
//  Created by James Rochabrun on 10-05-16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

#import "DestinationViewcontroller.h"

@interface DestinationViewcontroller ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;
@property (weak, nonatomic) IBOutlet UILabel *colorLabel;
@property (weak, nonatomic) IBOutlet UITextField *textField;


@end

@implementation DestinationViewcontroller

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.monster.name;
    self.locationLabel.text = self.monster.location;
    self.ageLabel.text = self.monster.age;
    self.colorLabel.text = self.monster.color;
    self.textField.hidden = YES;
}

- (IBAction)editMonster:(UIButton *)sender {
    self.textField.hidden = NO;
    
}

- (IBAction)saveMonster:(UIButton *)sender {
    self.textField.hidden = YES;
    self.monster.location = self.textField.text;
    self.locationLabel.text = self.textField.text;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.textField becomeFirstResponder];
    [self.textField resignFirstResponder];
    self.textField.hidden = YES;
    self.monster.location = self.textField.text;
    self.locationLabel.text = self.textField.text;
    
    return YES;
}



@end
