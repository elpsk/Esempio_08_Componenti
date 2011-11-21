//
//  ViewController.h
//  Lezione_06_Componenti
//
//  Created by Alberto Pasca on 10/11/11.
//  Copyright (c) 2011 Cutaway SRL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController <UITextFieldDelegate, UIWebViewDelegate> {
  
  IBOutlet UIImageView *ImgView;
  IBOutlet UIWebView *Www;
  IBOutlet UITextField *TextField;
  IBOutlet UILabel *Label;
  IBOutlet UIProgressView *ProgressBar;
  
}

- (IBAction)ButtonTouched:(id)sender;
- (IBAction)SwitchTouched:(id)sender;
- (IBAction)SliderChange:(id)sender;
- (IBAction)SegmentedChange:(id)sender;

@end
