//
//  MainViewController.m
//  Task Jojo
//
//  Created by arfian bagus on 7/7/17.
//  Copyright © 2017 Jojo. All rights reserved.
//

#import "MainViewController.h"
#import "dbHelper.h"
#import "Task+CoreDataClass.h"


@interface MainViewController (){
    dbHelper* helper;
}


@end
@implementation MainViewController
@synthesize fetchedResultsController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    helper=[[dbHelper alloc]init];
   
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initializeFetchedResultsController
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Task"];
    NSString* username=[NSString stringWithFormat:@"username like '%@'",[self.delegate getUserName]];
   
    NSPredicate* predicate= [NSPredicate predicateWithFormat:username];
    request.predicate=predicate;
    NSSortDescriptor *lastNameSort = [NSSortDescriptor sortDescriptorWithKey:@"date" ascending:YES];
    
    [request setSortDescriptors:@[lastNameSort]];
    
    NSManagedObjectContext *moc = [helper Context]; //Retrieve the main queue NSManagedObjectContext
    
    [self setFetchedResultsController:[[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:moc sectionNameKeyPath:@"date" cacheName:nil]];
   
    
    NSError *error = nil;
    if (![[self fetchedResultsController] performFetch:&error]) {
        NSLog(@"Failed to initialize FetchedResultsController: %@\n%@", [error localizedDescription], [error userInfo]);
        abort();
    }
    [tblTask reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) cell = [[UITableViewCell alloc] initWithFrame:CGRectZero];
    
    Task* task = [self.fetchedResultsController objectAtIndexPath:indexPath];

    UILabel *lblTaskName=[[UILabel alloc]initWithFrame:CGRectMake(15, 0, 200, 25)];
    UILabel *lblAlamat=[[UILabel alloc]initWithFrame:CGRectMake(18, 21, 200, 25)];
    UILabel *lbltime=[[UILabel alloc]initWithFrame:CGRectMake(225, 12, 200, 25)];
    
    
    [lblTaskName setFont:[UIFont fontWithName:@"helvetica" size:16.0]];
    [lblAlamat setFont:[UIFont fontWithName:@"helvetica" size:14.0]];
    [lbltime setFont:[UIFont fontWithName:@"helvetica" size:14.0]];
    
    lblTaskName.text=task.taskname;
    lblAlamat.text=task.adress;
    lbltime.text=task.time;
    
    [cell.contentView addSubview: lbltime];
    [cell.contentView addSubview: lblTaskName];
    [cell.contentView addSubview: lblAlamat];
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[[self fetchedResultsController] sections] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    id< NSFetchedResultsSectionInfo> sectionInfo = [[self fetchedResultsController] sections][section];
    return [sectionInfo numberOfObjects];
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
  
    id <NSFetchedResultsSectionInfo> sectionInfo = [[[self fetchedResultsController] sections] objectAtIndex:section];
    NSArray *objects = [sectionInfo objects];
    Task*task = [objects objectAtIndex:0];
    NSString *headerTitle = task.date;
    return headerTitle;
}


-(IBAction)Logout:(UIButton*)sender{
    [self.delegate switchToLogincompletion];
    
}
-(IBAction)Add:(UIButton*)sender{
    [self.delegate switchToInputcompletion];
   
}
@end
