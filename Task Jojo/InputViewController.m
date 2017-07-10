//
//  InputViewController.m
//  Task Jojo
//
//  Created by arfian bagus on 7/8/17.
//  Copyright © 2017 Jojo. All rights reserved.
//

#import "InputViewController.h"
#import "dbHelper.h"

@interface InputViewController (){
    dbHelper* db;
    NSString* User;
}

@end

@implementation InputViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    db=[[dbHelper alloc]init];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setUsername:(NSString*)user{
    User=user;
}

-(IBAction)Cancel:(UIButton*)sender{
    [self.delegate switchToMaincompletion];
    nameTask.text=@"";
    address.text=@"";
    }
-(IBAction)Save:(UIButton*)sender{
    [nameTask resignFirstResponder];
    [address resignFirstResponder];
    if ([nameTask.text isEqualToString:@""]) {
        UIAlertController * alert =
        [UIAlertController alertControllerWithTitle:@"Alert"
                                            message:@"Task Name must be input"
                                     preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* OkButton =
        [UIAlertAction actionWithTitle:@"Ok"
                                 style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action) {
                               }];
        [alert addAction:OkButton];
        [self presentViewController:alert animated:YES completion:nil];
    }else if ([address.text isEqualToString:@""]){
        UIAlertController * alert =
        [UIAlertController alertControllerWithTitle:@"Alert"
                                            message:@"Address Name must be input"
                                     preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* OkButton =
        [UIAlertAction actionWithTitle:@"Ok"
                                 style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action) {
                               }];
        [alert addAction:OkButton];
        [self presentViewController:alert animated:YES completion:nil];
    }else{
        [self SaveTask];
        [self.delegate switchToMaincompletion];
    }
    
}

-(void)SaveTask{
    NSDate* nsDate=[date date];
    
    NSDateFormatter *formatter       =   [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"d/MMM/YYYY HH:mm:ss"];
    NSString *stringDate=[formatter stringFromDate:nsDate];
     NSString *firstWord = [[stringDate componentsSeparatedByString:@" "] objectAtIndex:0];
     NSString *secondWord = [[stringDate componentsSeparatedByString:@" "] objectAtIndex:1];

    [formatter setLocale:[NSLocale currentLocale]];
        [db SaveTask:nameTask.text withAddress:address.text withDate:firstWord withUsername:User withTime:secondWord];
    nameTask.text=@"";
    address.text=@"";
}
@end
