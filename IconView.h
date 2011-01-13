//
//  IconView.h
//  Toggler
//
//  Created by Simon Fransson on 2010-08-07.
//  Copyright 2010 Hobo Code. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface IconView : NSView {
	NSImage *_icon;
	float _desaturation;
	NSSize _lastSize;
}

@property (retain) NSImage *icon;
@property (readwrite) NSSize lastSize;
@property (readwrite) float desaturation;

@end
