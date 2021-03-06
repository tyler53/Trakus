//
//  setup2ViewController.m
//  Trakus
//
//  Created by ADRIAN BEDARD on 10/8/13.
//  Copyright (c) 2013 Hi Dev Mobile. All rights reserved.
//

#import "setup2ViewController.h"

@interface setup2ViewController ()
@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UIDatePicker *alertTime;
@property (copy, nonatomic) NSMutableArray *primaryData;
@property (copy, nonatomic) NSMutableArray *secondaryData;
@property (copy, nonatomic) NSMutableArray *sleepData;

@end

@implementation setup2ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
	//self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"Default BackGround.png"]];
	/*
	 UIImageView *backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"TrakusTab1.1.png"]];
	
	[self.view addSubview:backgroundView];
	[self.view sendSubviewToBack:backgroundView];
	 */
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) updateUI
{
		//NSString *string = [NSData ];
}



- (IBAction)continue:(UIButton *)sender
{
	NSDate *alertTime = self.alertTime.date;
	NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
	[dateFormat setDateFormat:@"HH:mm"];
		NSString *timeString = [dateFormat stringFromDate:alertTime];
	NSTimeInterval alertGap = [self.alertTime.date timeIntervalSince1970];
	

		NSUserDefaults *data = [NSUserDefaults standardUserDefaults];
		[data setDouble:alertGap forKey:@"notificationTime"];
		[data setObject:timeString forKey:@"alertTime"];
	
	self.primaryData = [[NSMutableArray alloc] initWithArray: @[@"N/A"]];
	self.secondaryData = [[NSMutableArray alloc] initWithArray: @[@"N/A"]];
	self.sleepData = [[NSMutableArray alloc] initWithArray: @[@"N/A"]];
	[data setObject:self.primaryData forKey:@"primaryDataArray"];
	[data setObject:self.secondaryData forKey:@"secondaryDataArray"];
	[data setObject:self.sleepData forKey:@"sleepDataArray"];
	
	[self performSegueWithIdentifier:@"toConfirm" sender:self];
}

@end
