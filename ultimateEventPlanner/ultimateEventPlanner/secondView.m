//
//  secondView.m
//  ultimateEventPlanner
//
//  Created by Howard Livingston on 2/18/14.
//  Copyright (c) 2014 Howard Livingston. All rights reserved.
//

#import "secondView.h"
#import "ViewController.h"

@interface secondView ()

@end

@implementation secondView


//Synthesize the custom delegate
@synthesize customDelegate;


- (void)viewDidLoad
{
    //When this view loads, datepicker established
    datePicker.minimumDate = [NSDate date];

    [super viewDidLoad];
	// Do any additional setup after loading the view.
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




//Gather the event text and the date picker values
-(IBAction)saveEvent:(UIButton *)sender
{

    if (sender != nil)
    {
        // Save button
        if (sender.tag == 1)
        {
            if (text.text.length == 0)
                {
                    UIAlertView *planAlert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Please add an event." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                    [planAlert show];
                }
            // Alert displays if user didnt select a date and time
            else if (dateString == NULL)
                {
                    UIAlertView *dateAlert = [[UIAlertView alloc]initWithTitle:@"Date Error" message:@"Pick a date and time." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                    [dateAlert show];
                }
            else
                {
            
                    if (customDelegate != nil)
                
                        {
                            
                            saveEventString = [NSString stringWithFormat:@"%@ \n %@ \n ", text.text, dateString];
                        }
                
                            [customDelegate transferEvent:saveEventString];
                            [self dismissViewControllerAnimated:YES completion:nil];
                
                        }
                }
        }
}






//Button to close keyboard
-(IBAction)closeKB:(id)sender
{

    UIButton *switchViews =(UIButton*)sender;
    if (switchViews !=nil)
        {
            
            [text resignFirstResponder];
            
        
        }



}

//Retrieve date value from date picker
-(IBAction)getDate:(UIDatePicker *)sender
{
    
    if (datePicker != nil)
    {
    
    
            NSDate *dateSelected = sender.date;
        
        if (dateSelected != nil)
        
            {
            
                NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
                    if (dateFormat != nil)
                        {
                            [dateFormat setDateFormat:@"EEE, MMM d, yyyy hh:mm a"];
                            dateString = [dateFormat stringFromDate:dateSelected];
            
                        }
            
            }
    }
}





-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
 {

     
     textField.text = @"";
     return true;
 
 
 }




//When the keyboard closes....return the saveEvent String that contains the event text and date to the ViewController
- (BOOL)textFieldShouldReturn:(UITextField *)text
{
   
    
    if (customDelegate != nil)
        {
    
            [customDelegate transferEvent:saveEventString];
    
    
        }
    
    return true;


}


@end
