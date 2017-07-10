//
//  ContainerViewController.m
//  Task Jojo
//
//  Created by arfian bagus on 7/7/17.
//  Copyright © 2017 Jojo. All rights reserved.
//

#import "ContainerViewController.h"
#import "LoginViewController.h"
#import "MainViewController.h"
#import "InputViewController.h"

@interface ContainerViewController (){
    UIView* from;

}

@end

@implementation ContainerViewController
@synthesize login;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self){
    self.login=[[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:[NSBundle mainBundle]];
    self.main=[[MainViewController alloc] initWithNibName:@"MainViewController" bundle:[NSBundle mainBundle]];
    self.input=[[InputViewController alloc] initWithNibName:@"InputViewController" bundle:[NSBundle mainBundle]];
        

    }
    return self;
}
- (void)viewWillAppear:(BOOL)animated{
    self.login.view.frame=[[UIScreen mainScreen] bounds];
    
    self.main.view.frame=[[UIScreen mainScreen] bounds];
    self.input.view.frame=[[UIScreen mainScreen] bounds];
    
    self.login.delegate=self;
    self.main.delegate=self;
    self.input.delegate=self;
    
    
    [self.view addSubview:self.login.view];
    [self.login.view superview];
    from=self.login.view;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)switchToMaincompletion
{   [self.main initializeFetchedResultsController];
    [self.view addSubview:self.main.view];
    [self.main.view superview];
    [from removeFromSuperview];
    from=self.main.view;
}
- (void)switchToInputcompletion
{   [self.input setUsername:LoginUser];
    
    [self.view addSubview:self.input.view];
    [self.input.view superview];
    [from removeFromSuperview];
    from=self.input.view;
}
- (void)switchToLogincompletion
{   LoginUser=@"";
    [self.view addSubview:self.login.view];
    [self.login.view superview];
    [from removeFromSuperview];
    from=self.login.view;
}
-(NSString*)getUserName{
    NSString* user=LoginUser;
    
    return user;
}
-(void)setUserName:(NSString*)userName{
    LoginUser=userName;
}



@end
