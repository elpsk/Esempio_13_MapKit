//
//  AlbertoAnnotation.m
//  Lezione_12_Librerie
//
//  Created by Alberto Pasca on 17/11/11.
//  Copyright (c) 2011 Cutaway SRL. All rights reserved.
//

#import "AlbertoAnnotation.h"

@implementation AlbertoAnnotation

- (id)init {
	coordinate.longitude = 18.30055;
	coordinate.latitude  = 40.19908;
	return [super init];
}

#pragma mark MKAnnotation required methods

@synthesize coordinate;

- (NSString *)title {
	return @"Alberto Pasca";
}

- (NSString *)subtitle {
	return @"328 3558021";
}

@end
