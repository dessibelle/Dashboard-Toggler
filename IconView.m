//
//  IconView.m
//  Toggler
//
//  Created by Simon Fransson on 2010-08-07.
//  Copyright 2010 Hobo Code. All rights reserved.
//

#import "IconView.h"


@implementation IconView

@synthesize icon = _icon, lastSize = _lastSize, desaturation = _desaturation;

- (id)initWithFrame:(NSRect)frameRect {

	if (self = [super initWithFrame:frameRect]) {
		// TODO: Add some saturations effects
		CALayer *layer = [CALayer layer];
		//layer.filters = [NSArray arrayWithObject:color];
		[self setWantsLayer:YES];
		[self setLayer:layer];
	}
	return self;
}

- (void)awakeFromNib {
	self.icon = [[[NSImage alloc] initWithContentsOfFile:@"/Applications/Dashboard.app/Contents/Resources/Dashboard.icns"] autorelease];
	self.lastSize = NSZeroSize;
	
	self.desaturation = 0.0;	
}

- (void)dealloc {
	self.icon = nil;
	[super dealloc];
}

- (void)drawRect:(NSRect)dirtyRect {
	/*
	 NSRect rect = [self frame];
	 
	 NSGraphicsContext *context = [NSGraphicsContext currentContext];
	 
	 
	 NSImageRep *rep = [self.icon.representations objectAtIndex:0]; 
	 CGImageRef image = [rep CGImageForProposedRect:&rect context:context hints:nil];
	 CGRect cgRect = NSRectToCGRect(rect);
	 CGContextRef cgContext = [context graphicsPort];
	 
	 CGContextDrawImage(cgContext, cgRect, image);
	 CGContextSetBlendMode(cgContext, kCGBlendModeSaturation);
	 CGContextClipToMask(cgContext, cgRect, image); // restricts drawing to within alpha channel
	 CGContextSetRGBFillColor(cgContext, 0.0, 0.0, 0.0, self.desaturation);
	 CGContextFillRect(cgContext, cgRect);
	 */
	
	[[NSColor clearColor] set];
	NSRectFill([self frame]);
	
	[self.icon compositeToPoint:NSZeroPoint operation:NSCompositeSourceOver];
}

@end
