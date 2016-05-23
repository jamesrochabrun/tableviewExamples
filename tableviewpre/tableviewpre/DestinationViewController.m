//
//  DestinationViewController.m
//  tableviewpre
//
//  Created by James Rochabrun on 24-03-16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

#import "DestinationViewController.h"

@interface DestinationViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *editRazaTextField;
@property (weak, nonatomic) IBOutlet UILabel *razaLabel;

@end

@implementation DestinationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //title
    self.title = self.dogData.name;
    //raza
    self.razaLabel.text = self.dogData.raza;
    
    self.editRazaTextField.hidden = YES;
    
}

- (IBAction)editDogData:(UIBarButtonItem *)sender {
    
    if (self.editing) {
        self.editing = false;
        sender.style = UIBarButtonItemStylePlain;
        sender.title = @"Edit";
        self.editRazaTextField.hidden = YES;
        
        
        //rememberhere is how it works we have to update the value in both places
        //and also set the vool reload in the viewcontroller
        self.dogData.raza = self.editRazaTextField.text;
        self.razaLabel.text = self.editRazaTextField.text;
        
        
    } else {
        self.editing = true;
        sender.style = UIBarButtonItemStyleDone;
        sender.title = @"Done";
        self.editRazaTextField.hidden = NO ;
        
        
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.editRazaTextField becomeFirstResponder];
    [self.editRazaTextField resignFirstResponder];
    self.editRazaTextField.hidden = YES;
    self.dogData.raza = self.editRazaTextField.text;
    self.razaLabel.text = self.editRazaTextField.text;

    NSLog(@"yes");
    return YES;
}







@end
