//
//  LoginViewController.m
//  Task Jojo
//
//  Created by arfian bagus on 7/7/17.
//  Copyright © 2017 Jojo. All rights reserved.
//

#import "LoginViewController.h"

#import "dbHelper.h"




@interface LoginViewController (){
    dbHelper* db;
 

}

@end

@implementation LoginViewController




- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];

    return self;
}
    
- (void)viewDidLoad {
    [super viewDidLoad];
    db=[[dbHelper alloc]init];
    userName.delegate=self;
    password.delegate=self;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)checkData{
    if([db isLogin:userName.text andPassword:password.text]){
        
        [self.delegate setUserName:userName.text];
        [self.delegate switchToMaincompletion];
        password.text=@"";
    }else{
        if([db checkUsername:userName.text]){
            
            UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"Alert"
                                        message:@"Wrong Password"
                                            preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction* OkButton = [UIAlertAction
                                       actionWithTitle:@"Ok"
                                       style:UIAlertActionStyleDefault
                                       handler:^(UIAlertAction * action) {
                                           
                                       }];
            
            
            [alert addAction:OkButton];
            
            [self presentViewController:alert animated:YES completion:nil];
            
        }else{
          
            [db SaveUser:userName.text withPassword:password.text];
            [self.delegate setUserName:userName.text];
            [self.delegate switchToMaincompletion];
            password.text=@"";
        }
        
        
    }

}

- (IBAction)loginPressed:(UIButton *)sender {
    
    [userName resignFirstResponder];
    [password resignFirstResponder];
    if ([userName.text isEqualToString:@""]) {
        UIAlertController * alert =
        [UIAlertController alertControllerWithTitle:@"Alert"
                            message:@"Username is empty"
                            preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* OkButton =
        [UIAlertAction actionWithTitle:@"Ok"
                       style:UIAlertActionStyleDefault
                       handler:^(UIAlertAction * action) {
                        }];
        [alert addAction:OkButton];
        [self presentViewController:alert animated:YES completion:nil];
    }else if([password.text isEqualToString:@""]){
        UIAlertController * alert =
        [UIAlertController alertControllerWithTitle:@"Alert"
                            message:@"Password is empty"
                            preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* OkButton =
        [UIAlertAction actionWithTitle:@"Ok"
                                 style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action) {
                               }];
        [alert addAction:OkButton];
        [self presentViewController:alert animated:YES completion:nil];
    }else{
        [self checkData];
    }
}


#define kOFFSET_FOR_KEYBOARD 80.0

-(void)keyboardWillShow {
  
    if (self.view.frame.origin.y >= 0)
    {
        [self setViewMovedUp:YES];
    }
    
}

-(void)keyboardWillHide {
    if (self.view.frame.origin.y < 0)
    {
        [self setViewMovedUp:NO];
    }
}



-(void)setViewMovedUp:(BOOL)movedUp
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    
    CGRect rect = self.view.frame;
    if (movedUp)
    {
        rect.origin.y -= kOFFSET_FOR_KEYBOARD;
        rect.size.height += kOFFSET_FOR_KEYBOARD;
    }
    else
    {
       
        rect.origin.y += kOFFSET_FOR_KEYBOARD;
        rect.size.height -= kOFFSET_FOR_KEYBOARD;
    }
    self.view.frame = rect;
    
    [UIView commitAnimations];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
