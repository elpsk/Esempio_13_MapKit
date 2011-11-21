//
//  CutawayAnnotation.m
//  Lezione_12_Librerie
//
//  Created by Alberto Pasca on 17/11/11.
//  Copyright (c) 2011 Cutaway SRL. All rights reserved.
//

#import "CutawayAnnotation.h"

@implementation CutawayAnnotation

- (id)init {
	coordinate.longitude = 9.16447;
	coordinate.latitude  = 45.50316;
	return [super init];
}

#pragma mark MKAnnotation required methods

@synthesize coordinate;

- (NSString *)title {
	return @"Cutaway SRL";
}

- (NSString *)subtitle {
	return @"02 123456";
}

@end