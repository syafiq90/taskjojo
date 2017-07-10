//
//  dbHelper.m
//  Task Jojo
//
//  Created by arfian bagus on 7/8/17.
//  Copyright © 2017 Jojo. All rights reserved.
//

#import "dbHelper.h"
#import "User+CoreDataClass.h"
#import "Task+CoreDataClass.h"
#import "AppDelegate.h"


@interface dbHelper ()
@property (nonatomic) NSManagedObjectContext *mContext;
@property (nonatomic) NSArray <User*>*Users;
@property (nonatomic) NSArray <Task*>*Task;
@property (nonatomic,weak) AppDelegate * appDelegate;

@end

@implementation dbHelper
- (id)init
{
    self = [super init];
    if (self) {
        self.appDelegate=(AppDelegate*)[[UIApplication sharedApplication]delegate];
        self.mContext=[self.appDelegate getContext];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
-(void)SaveUser:(NSString*)Username withPassword:(NSString*)Password{
    User* user=[[User alloc]initWithContext:self.mContext];
    user.username=Username;
    user.password=Password;
    [self.appDelegate saveContext];
}
-(Boolean*)checkUsername:(NSString*)Username{
    Boolean* isbol=false;
    NSFetchRequest* request= [NSFetchRequest fetchRequestWithEntityName:@"User"];
    NSString* pre=[NSString stringWithFormat: @"username like '%@'",Username];
    NSPredicate* predicate= [NSPredicate predicateWithFormat:pre];
    request.predicate=predicate;
   
    NSError *error=nil;
    NSArray <User *>*users=[self.mContext executeFetchRequest:request error:&error];
    if(([users count]>0)){
        isbol=true;
    }
    return isbol;
}
-(NSArray*)getUser{
    NSArray* user;
    return user;
}
-(Boolean*)isLogin:(NSString*)Username andPassword:(NSString*)Password{
     Boolean* isbol=false;

    NSFetchRequest* request= [NSFetchRequest fetchRequestWithEntityName:@"User"];
    NSString* pre=[NSString stringWithFormat: @"username like '%@' AND password like '%@'",Username,Password];
    NSPredicate* predicate= [NSPredicate predicateWithFormat:pre];
    request.predicate=predicate;
    NSError *error=nil;
    NSArray <User *>*users=[self.mContext executeFetchRequest:request error:&error];
    if(([users count]>0)){
        isbol=true;
    }
    
    return isbol;
}
-(void)SaveTask:(NSString*)TaskName withAddress:(NSString*)Address withDate:(NSString*)Date withUsername:(NSString*)UserName withTime:(NSString*)time{
    Task* task=[[Task alloc]initWithContext:self.mContext];
    task.taskname=TaskName;
    task.adress=Address;
    task.date=Date;
    task.username=UserName;
    task.time=time;
    [self.appDelegate saveContext];}
-(NSArray*)getTask{
    NSArray* task;
    return task;
}
-(NSManagedObjectContext*)Context{
    return self.mContext;
}
@end
