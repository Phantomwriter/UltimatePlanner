//
//  secondView.h
//  ultimateEventPlanner
//
//  Created by Howard Livingston on 2/18/14.
//  Copyright (c) 2014 Howard Livingston. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol secondViewDelegate <NSObject>


//Required function that captures the secondView info and carries it to the ViewController
@required
-(void)transferEvent:(NSString *)saveEventString;


@end


//Establishing the text field delegate
@interface secondView : UIViewController <UITextFieldDelegate>

//Creating the outlets to be connected in storyboard
{

    IBOutlet UITextField *text;
    IBOutlet UIDatePicker *datePicker;

    
//Establish empty strings to capture the date and new event
    NSString *dateString;
    NSString *saveEventString;

//Implement the custom delegate
    id<secondViewDelegate> customDelegate;


}

//Assigning a property-the custom delegate
@property (strong) id <secondViewDelegate> customDelegate;

//Create Actions
-(IBAction)closeKB:(UIButton *)sender;


-(IBAction)getDate:(UIDatePicker *)sender;


-(IBAction)saveEvent:(UIButton *)sender;

@end
