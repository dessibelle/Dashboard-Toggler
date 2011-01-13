//
//  TransparentView.m
//  Toggler
//
//  Created by Simon Fransson on 2010-08-07.
//  Copyright 2010 Hobo Code. All rights reserved.
//

#import "TransparentView.h"


@implementation TransparentView


- (void)awakeFromNib {
	
	NSImageView *imageView = [[NSImageView alloc] initWithFrame:[self frame]];
	[imageView setImage:[[[NSImage alloc] initWithContentsOfFile:@"/Applications/Dashboard.app/Contents/Resources/Dashboard.icns"] autorelease]];
	[self addSubview:imageView];
	[imageView release];
}

- (void)drawRect:(NSRect)dirtyRect {
	[[NSColor clearColor] set];
	NSRectFill([self frame]);
}

@end
