//
//  ViewController.h
//  Lezione_12_Librerie
//
//  Created by Alberto Pasca on 17/11/11.
//  Copyright (c) 2011 Cutaway SRL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

#import "CutawayAnnotation.h"
#import "AlbertoAnnotation.h"

@interface ViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate> {
  
  IBOutlet MKMapView *Mappa;
  
}

@property (nonatomic, retain) MKMapView *Mappa;

- (IBAction)SetPoint:(id)sender;
- (IBAction)SetMapType:(id)sender;

@end
