//
//  AppDelegate.m
//  Task Jojo
//
//  Created by arfian bagus on 7/7/17.
//  Copyright © 2017 Jojo. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginViewController.h"
#import "MainViewController.h"
#import "InputViewController.h"
#import "User+CoreDataClass.h"
#import "ContainerViewController.h"




@interface AppDelegate ()
@property (nonatomic) NSManagedObjectContext *managedObjectContext;

@end

@implementation AppDelegate
@synthesize window = _window;
@synthesize rootView;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    

    
    self.managedObjectContext=self.persistentContainer.viewContext;
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.rootView = [[ContainerViewController alloc] initWithNibName:@"ContainerViewController" bundle:[NSBundle mainBundle]];
    
    self.window.rootViewController = self.rootView;
 
    [self.window makeKeyAndVisible];
    return YES;
}
-(NSManagedObjectContext*)getContext{
    return self.managedObjectContext;
}



- (void)applicationWillResignActive:(UIApplication *)application{

}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    
}


- (void)applicationWillEnterForeground:(UIApplication *)application {

}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    
}


- (void)applicationWillTerminate:(UIApplication *)application {
    [self saveContext];
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;


- (NSPersistentContainer *)persistentContainer {

    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"CoreData"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    
    NSError *error = nil;
    if ([self.managedObjectContext hasChanges] && ![self.managedObjectContext save:&error]) {
        
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end
