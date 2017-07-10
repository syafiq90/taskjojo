//
//  AppDelegate.h
//  Task Jojo
//
//  Created by arfian bagus on 7/7/17.
//  Copyright © 2017 Jojo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "LoginViewController.h"
#import "MainViewController.h"
#import "InputViewController.h"
#import "ContainerViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
-(NSManagedObjectContext*)getContext;
@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;
@property (strong, nonatomic)ContainerViewController * rootView;
@property UIViewController* viewController;
- (void)saveContext;


@end

