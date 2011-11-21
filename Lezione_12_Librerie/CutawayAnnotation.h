//
//  CutawayAnnotation.h
//  Lezione_12_Librerie
//
//  Created by Alberto Pasca on 17/11/11.
//  Copyright (c) 2011 Cutaway SRL. All rights reserved.
//

#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface CutawayAnnotation : NSObject <MKAnnotation> {
	CLLocationCoordinate2D coordinate;
}

@end
