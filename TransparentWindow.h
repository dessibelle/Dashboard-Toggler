//
//  TransparentWindow.h
//  Toggler
//
//  Created by Simon Fransson on 2010-08-07.
//  Copyright 2010 Hobo Code. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface TransparentWindow : NSWindow <NSAnimationDelegate> {	
	NSView *_targetView;
	
	BOOL _shouldQuit;
}

@property (retain) IBOutlet NSView *targetView;
@property (readwrite) BOOL shouldQuit;

- (void)fadeIn;
- (void)fadeIn:(float)theDuration;
- (void)fadeOut;
- (void)fadeOut:(float)theDuration;

@end
