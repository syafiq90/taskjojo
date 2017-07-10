//
//  InputViewController.h
//  Task Jojo
//
//  Created by arfian bagus on 7/8/17.
//  Copyright © 2017 Jojo. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol InputDelegate;
////////////////////////////////////////////////
@protocol InputDelegate <NSObject>
-(void)switchToMaincompletion;
-(NSString*)getUserName;
-(void)setUserName:(NSString*)userName;
@end

@interface InputViewController : UIViewController<UITextViewDelegate,UITextFieldDelegate>{
    IBOutlet UITextField* nameTask;
    IBOutlet UITextView* address;
    IBOutlet UIDatePicker* date;
}
-(void)setUsername:(NSString*)user;
@property (nonatomic,assign) id <InputDelegate> delegate;
@end
