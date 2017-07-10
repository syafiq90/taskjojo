//
//  MainViewController.h
//  Task Jojo
//
//  Created by arfian bagus on 7/7/17.
//  Copyright © 2017 Jojo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
@protocol MainDelegate;
@protocol MainDelegate <NSObject>
-(NSString*)getUserName;
-(void)setUserName:(NSString*)userName;
- (void)switchToLogincompletion;
- (void)switchToInputcompletion;

@end
@interface MainViewController : UIViewController{
    IBOutlet UITableView* tblTask;
}
@property (nonatomic,retain)NSFetchedResultsController *fetchedResultsController;
@property (nonatomic,assign) id <MainDelegate> delegate;
- (void)initializeFetchedResultsController;
@end
