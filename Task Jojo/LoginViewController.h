//
//  LoginViewController.h
//  Task Jojo
//
//  Created by arfian bagus on 7/7/17.
//  Copyright © 2017 Jojo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@protocol LoginDelegate;
////////////////////////////////////////////////
@protocol LoginDelegate <NSObject>
- (void)switchToMaincompletion;
-(NSString*)getUserName;
-(void)setUserName:(NSString*)userName;
@end
@interface LoginViewController : UIViewController{
    IBOutlet UITextField *userName;
    IBOutlet UITextField *password;
    
}

@property (nonatomic,assign) id <LoginDelegate> delegate;
@property (nonatomic, strong) NSMutableArray *ArrayUser;
@end
