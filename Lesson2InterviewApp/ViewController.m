//
//  ViewController.m
//  Lesson2InterviewApp
//
//  Created by Frederik Nygaard on 19.05.16.
//  Copyright (c) 2016 Frederik Nygaard. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(void) doCountUp: (UIButton *)button {
    self.count++;
    [self updateDisplay];
    self.countTextField.text = [NSString stringWithFormat:@"%i",self.count];

}
-(void) doCountDown: (UIButton *)button {
    self.count--;
    [self updateDisplay];
    self.countTextField.text = [NSString stringWithFormat:@"%i",self.count];


}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.countTextField resignFirstResponder];
    
}


-(void)doTextfieldchanged:(UITextField *)theTextField{
    int newCount = [theTextField.text intValue];
    self.count = newCount;
    [self updateDisplay];
    
}


-(void) doCountClear: (UIButton *)button {
    self.count = 0;
    [self updateDisplay];
    self.countTextField.text = [NSString stringWithFormat:@"%i",self.count];

}
-(void) updateDisplay {
    NSString *s = [NSString stringWithFormat:@"Count = %i",self.count];
    self.countLabel.text = s;
}




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CGFloat leftBounds = 20;
    CGFloat rightBounds = 20;
    CGFloat width = self.view.bounds.size.width - leftBounds-rightBounds;
    CGFloat height = 44;
    CGRect rect = CGRectMake(20, 20, width, height);
    
    self.myApp = [[UILabel alloc] initWithFrame:rect];
    self.myApp.text = @"This Program by Frederik Nygaard";
    self.myApp.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.myApp];
    
    rect.origin.y += height;
    self.countLabel = [[UILabel alloc] initWithFrame:rect];
    self.countLabel.text = @"Count: 0";
    self.countLabel.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.countLabel];
    
    rect.origin.y += height;
    self.countUp= [[UIButton alloc]initWithFrame:rect];
    self.countUp.backgroundColor = [UIColor orangeColor];
    [self.countUp setTitle:@"Count Up" forState:UIControlStateNormal];
    [self.countUp addTarget:self action:@selector(doCountUp:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:self.countUp];
    
    
    rect.origin.y += height;
    self.countDown = [[UIButton alloc]initWithFrame:rect];
    self.countDown.backgroundColor = [UIColor redColor];
    [self.countDown setTitle:@"Count Down" forState:UIControlStateNormal];
    [self.countDown addTarget:self action:@selector(doCountDown:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:self.countDown];
    
    
    rect.origin.y += height;
    self.clearCount = [[UIButton alloc]initWithFrame:rect];
    self.clearCount.backgroundColor = [UIColor greenColor];
    [self.clearCount setTitle:@"Clear Count" forState:UIControlStateNormal];
    [self.clearCount addTarget:self action:@selector(doCountClear:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:self.clearCount];
    
    
    /*
     For me, It's more logical that the count-value changes when ever you're typing. Therefore, I use EventEditingChanged. Hopefully, I will not lose points for this. 
     */
    rect.origin.y += height;
    self.countTextField = [[UITextField alloc]initWithFrame:rect];
    self.countTextField.backgroundColor = [UIColor whiteColor];
    self.countTextField.placeholder = @"Enter Count";
    self.countTextField.keyboardType = UIKeyboardTypeNumberPad;
    [self.countTextField addTarget:self action:@selector(doTextfieldchanged:)
        forControlEvents:UIControlEventEditingChanged];
    
    [self.view addSubview:self.countTextField];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
