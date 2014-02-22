//
//  ViewController.m
//  ultimateEventPlanner
//
//  Created by Howard Livingston on 2/18/14.
//  Copyright (c) 2014 Howard Livingston. All rights reserved.
//

#import "ViewController.h"
#import "secondView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad

{
    
    [super viewDidLoad];
}




//Return from secondView back to ViewController
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
	{
        secondView *secondVC = segue.destinationViewController;
        secondVC.customDelegate = self;
	}
    
}



//Transfer info from secondView
-(void)transferEvent:(NSString *)saveEventString;
{

    
    
    if ([savedEvent.text isEqualToString:@""])
    
        //Text string  and dateString captured from secondView and displayed
            {
                savedEvent.text = [NSString stringWithFormat:@" %@ ", saveEventString];
            }
    
    else
        
        //Append any new event into a continuing list
            {
                savedEvent.text = [savedEvent.text stringByAppendingString: saveEventString];
            }
    

}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
