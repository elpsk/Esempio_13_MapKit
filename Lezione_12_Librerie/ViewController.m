//
//  ViewController.m
//  Lezione_12_Librerie
//
//  Created by Alberto Pasca on 17/11/11.
//  Copyright (c) 2011 Cutaway SRL. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
@synthesize Mappa;

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
  [super viewDidLoad];
  
  Mappa.delegate = self;
  Mappa.showsUserLocation = YES;

	[Mappa addAnnotation:[[[CutawayAnnotation alloc] init] autorelease]];
	[Mappa addAnnotation:[[[AlbertoAnnotation alloc] init] autorelease]];
  
}

#pragma mark MKMapViewDelegate methods

// Questo metodo viene chiamato ogniqualvolta viene aggiunta una annotation alla mappa
- (void)mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray *)views {
  
	// Se c'è l'annotation view relativa alla posizione dell'utente (il puntino blu), zoommiamo mettendo l'utente al centro della mappa
	for (MKAnnotationView *annotationView in views) {
		if (annotationView.annotation == mapView.userLocation) {
			MKCoordinateSpan span = MKCoordinateSpanMake(0.3, 0.3); // Parametri: 1 = ~111 km -> 0.3 = ~33 km
			MKCoordinateRegion region = MKCoordinateRegionMake(mapView.userLocation.coordinate, span);
			[mapView setRegion:region animated:YES];
		}
	}
}

// Metodo che viene chiamato quando dobbiamo creare la view di una annotation.
// Se vogliamo usare quella di default usiamo come valore di ritorno nil

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
  
	// Se dobbiamo creare l'annotation view relativa alla posizione dell'utente usiamo quella di default (il puntino blu)
	if (annotation == mapView.userLocation) {
		return nil;
	}
  
  // Altrimenti usiamo come annotation view un'immagine con un disclosure button sulla destra del callout
  MKAnnotationView *annotationView;
  
  if ( [annotation isKindOfClass:[AlbertoAnnotation class]] ) {
    NSLog(@"ALBERTO");
    
    annotationView = [[[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"Pin"] autorelease];
    annotationView.image = [UIImage imageNamed:@"lecce.png"];
    annotationView.canShowCallout = YES;
    annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
  } else {
    NSLog(@"CUTAWAY");
    
    annotationView = [[[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"Pin"] autorelease];
    annotationView.image = [UIImage imageNamed:@"pin.png"];
    annotationView.canShowCallout = YES;
    annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
  }
  
	return annotationView;
}

// Questo metodo viene invocato quando si preme un bottone presente nel callout

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
  NSLog(@"%s", __FUNCTION__);
}

#pragma mark VIEW

- (void)viewDidUnload {
  [self setMappa:nil];
  [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)dealloc {
  [Mappa release];
  [super dealloc];
}

- (IBAction) SetPoint:(id)sender {
  UIButton *btn = (UIButton*)sender;
  switch ( btn.tag ) {
    case 0: {
      MKCoordinateSpan span = MKCoordinateSpanMake(0.3, 0.3);
			MKCoordinateRegion region = MKCoordinateRegionMake(CLLocationCoordinate2DMake(45.50316, 9.16447), span);
			[Mappa setRegion:region animated:YES];
    } break;
    case 1: {
      MKCoordinateSpan span = MKCoordinateSpanMake(0.3, 0.3);
			MKCoordinateRegion region = MKCoordinateRegionMake(CLLocationCoordinate2DMake(40.19908, 18.30055), span);
			[Mappa setRegion:region animated:YES];
    } break;
  }
}

- (IBAction) SetMapType:(id)sender {
  
  UISegmentedControl *ctrl = (UISegmentedControl*)sender;
  switch ( ctrl.selectedSegmentIndex ) {
    case 0: Mappa.mapType = MKMapTypeStandard;  break;
    case 1: Mappa.mapType = MKMapTypeSatellite; break;
    case 2: Mappa.mapType = MKMapTypeHybrid;    break;
  }
  
}


@end


