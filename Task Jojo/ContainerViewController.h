//
//  ContainerViewController.h
//  Task Jojo
//
//  Created by arfian bagus on 7/7/17.
//  Copyright © 2017 Jojo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginViewController.h"
#import "MainViewController.h"
#import "InputViewController.h"

@interface ContainerViewController : UIViewController<MainDelegate,InputDelegate,LoginDelegate>{
NSString* LoginUser;
}


@property (strong, nonatomic) LoginViewController* login;
@property (strong, nonatomic) MainViewController* main;
@property (strong, nonatomic) InputViewController* input;
@end
