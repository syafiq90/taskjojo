//
//  dbHelper.h
//  Task Jojo
//
//  Created by arfian bagus on 7/8/17.
//  Copyright © 2017 Jojo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface dbHelper : UIViewController
-(void)SaveUser:(NSString*)Username withPassword:(NSString*)Password;
-(NSArray*)getUser;
-(Boolean*)isLogin:(NSString*)Username andPassword:(NSString*)Password;
-(void)SaveTask:(NSString*)TaskName withAddress:(NSString*)Address withDate:(NSString*)Date withUsername:(NSString*)UserName withTime:(NSString*)time;
-(NSArray*)getTask;
-(Boolean*)checkUsername:(NSString*)Username;
-(NSManagedObjectContext*)Context;
@end
