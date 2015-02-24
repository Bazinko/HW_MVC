//
//  ViewController.m
//  HW_MVC
//
//  Created by Евгений Сергеев on 29.01.15.
//  Copyright (c) 2015 Евгений Сергеев. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISwitch *swtch;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segment;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UIButton *butt;
@property (weak, nonatomic) IBOutlet UITextField *txtField;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSNumber *swt = [[NSUserDefaults standardUserDefaults] objectForKey:@"switch"];
    swt = swt? swt: @0;
    [self.swtch setOn:swt.boolValue];
    
    NSNumber *seg = [[NSUserDefaults standardUserDefaults] objectForKey:@"segment"];
    seg = seg? seg: @0;
    self.segment.selectedSegmentIndex = seg.integerValue;
    
    NSNumber *sld = [[NSUserDefaults standardUserDefaults] objectForKey:@"slider"];
    sld = sld? sld: @5;
    self.slider.value = sld.floatValue;
    
    NSString *str = [[NSUserDefaults standardUserDefaults] objectForKey:@"text"];
    if (str)
        self.txtField.text = str;
    
    NSData *clr = [[NSUserDefaults standardUserDefaults] objectForKey:@"button"];
    if (clr)
        self.butt.backgroundColor = [NSKeyedUnarchiver unarchiveObjectWithData:clr];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIColor *)randColor
{
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    return color;
}

- (IBAction)switchEd:(id)sender
{
    bool b = self.swtch.isOn;
    [[NSUserDefaults standardUserDefaults] setObject:@(b) forKey:@"switch"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (IBAction)segmentEd:(id)sender
{
    int sgm = self.segment.selectedSegmentIndex;
    [[NSUserDefaults standardUserDefaults] setObject:@(sgm) forKey:@"segment"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (IBAction)sliderEd:(id)sender
{
    float sl = self.slider.value;
    [[NSUserDefaults standardUserDefaults] setObject:@(sl) forKey:@"slider"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (IBAction)txtEd:(id)sender
{
    NSString *st = self.txtField.text;
    [[NSUserDefaults standardUserDefaults] setObject:st forKey:@"text"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (IBAction)butPress:(id)sender
{
    UIColor *buttColor = [self randColor];
    self.butt.backgroundColor = buttColor;
    [[NSUserDefaults standardUserDefaults] setObject:[NSKeyedArchiver archivedDataWithRootObject:buttColor] forKey:@"button"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
