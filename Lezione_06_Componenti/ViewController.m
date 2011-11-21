//
//  ViewController.m
//  Lezione_06_Componenti
//
//  Created by Alberto Pasca on 10/11/11.
//  Copyright (c) 2011 Cutaway SRL. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
  [super viewDidLoad];

  TextField.delegate = self;
  TextField.keyboardType = UIKeyboardTypeURL;
  TextField.returnKeyType = UIReturnKeySearch;
  
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(receiveTestNotification:) 
                                               name:@"TestNotification"
                                             object:nil];

}

- (void) receiveTestNotification:(NSNotification *) notification
{
  // [notification name] should always be @"TestNotification"
  // unless you use this method for observation of other notifications
  // as well.
  
  if ([[notification name] isEqualToString:@"TestNotification"])
    NSLog (@"Successfully received the test notification!");
}


- (void)viewDidUnload
{
  [[NSNotificationCenter defaultCenter] removeObserver:self];

  [ImgView release];
  ImgView = nil;
  [Www release];
  Www = nil;
  [TextField release];
  TextField = nil;
  [Label release];
  Label = nil;
  [ProgressBar release];
  ProgressBar = nil;
  [super viewDidUnload];
  // Release any retained subviews of the main view.
  // e.g. self.myOutlet = nil;
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {}
- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {}
- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {}
- (void) touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {}

- (void)viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
  [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {

  if (interfaceOrientation == UIInterfaceOrientationPortrait)
    return YES;

  if (interfaceOrientation == UIInterfaceOrientationLandscapeLeft)
    return NO;

  if (interfaceOrientation == UIInterfaceOrientationLandscapeRight)
    return YES;

  if (interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown)
    return YES;

  
}

- (IBAction) ButtonTouched:(id)sender {
  UIButton *btn = (UIButton*)sender;
  switch (btn.tag) { // quale button?
    case 0: break;
    case 1: break;
    case 2: break;
    case 3: break;
    default: break;
  }
  
  [[NSNotificationCenter defaultCenter] postNotificationName:@"TestNotification" object:self];

//  ImgView.image = [UIImage imageNamed:@"logo.png"];
//  ImgView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://tinyurl.com/cr2tmu6"]]];
  
  [ImgView setImage:
   [UIImage imageWithData:
    [NSData dataWithContentsOfURL:
     [NSURL URLWithString:
      @"http://tinyurl.com/cr2tmu6"
      ]
     ]
    ]
   ];
  
}

- (IBAction) SwitchTouched:(id)sender {
  
  CGRect rect;
  rect.origin.x    = 0;
  rect.origin.y    = 0;
  rect.size.width  = 50;
  rect.size.height = 100;
  
  UISwitch *sw = [[UISwitch alloc] initWithFrame:CGRectMake(0, 0, 50, 100)];
  sw.on = NO;
  
  [UIView beginAnimations:@"prima" context:nil];
  [UIView beginAnimations:nil context:NULL];
  [UIView setAnimationDelegate:self];
  [UIView setAnimationWillStartSelector:@selector(AnimStarted)];
  [UIView setAnimationDidStopSelector:@selector(AnimStopped)];
  [UIView setAnimationBeginsFromCurrentState:YES];
  [UIView setAnimationDuration:2.0];
  [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
  ImgView.frame = CGRectMake(ImgView.frame.origin.x, -100, ImgView.frame.size.width, ImgView.frame.size.height);
  ImgView.alpha = .0;
  [UIView commitAnimations];
}

- (IBAction)SliderChange:(id)sender {
  UISlider *slider = (UISlider*)sender;
  NSLog(@"VALUE: %f", slider.value);
  
  ProgressBar.progress = slider.value;
}

- (IBAction)SegmentedChange:(id)sender {
  UISegmentedControl *ctrl = (UISegmentedControl*)sender;
  switch ( ctrl.selectedSegmentIndex ) {
    case 0: ProgressBar.progress = 0; break;
    case 1: ProgressBar.progress = 0.5; break;
    case 2: ProgressBar.progress = 1; break;
  }
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
  [textField resignFirstResponder];
  
  [Www loadRequest:
   [NSURLRequest requestWithURL:
    [NSURL URLWithString:textField.text]]];
  
  Label.text = TextField.text;
  
  return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
  
  UIView *v = [[UIView alloc] initWithFrame:
               CGRectMake(0, 0, 100, 100)];
  [self.view addSubview:v];
  [v release];
  
}
- (void)webViewDidFinishLoad:(UIWebView *)webView {
  
}
- (void) webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
  
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
  return YES;
}

- (void)dealloc {
  [ImgView release];
  [Www release];
  [TextField release];
  [Label release];
  [ProgressBar release];
  [super dealloc];
}
@end




































