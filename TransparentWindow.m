//
//  TransparentWindow.m
//  Toggler
//
//  Created by Simon Fransson on 2010-08-07.
//  Copyright 2010 Hobo Code. All rights reserved.
//

#import "TransparentWindow.h"
#import "IconView.h"

static float duration = 1.0; 
static NSAnimationCurve curve = NSAnimationEaseIn;

@implementation TransparentWindow

@synthesize targetView = _targetView, shouldQuit = _shouldQuit;

- (id)initWithContentRect:(NSRect)contentRect styleMask:(NSUInteger)aStyle backing:(NSBackingStoreType)bufferingType defer:(BOOL)flag {
	
	NSSize screenSize = [[NSScreen mainScreen] frame].size;
	NSSize windowSize = contentRect.size;
	
	NSRect windowRect = NSMakeRect((screenSize.width / 2.0) - (windowSize.width / 2.0),
								   (screenSize.height / 2.0) - (windowSize.height / 2.0),
								   windowSize.width,
								   windowSize.height);
	
	
	// Using NSBorderlessWindowMask results in a window without a title bar.
	self = [super initWithContentRect:windowRect styleMask:NSBorderlessWindowMask backing:NSBackingStoreBuffered defer:NO];

	if (self != nil) {
		// Start with no transparency for all drawing into the window
		[self setAlphaValue:1.0];
		// Turn off opacity so that the parts of the window that are not drawn into are transparent.
		[self setOpaque:NO];
	}
	
	self.shouldQuit = NO;

	return self;
}

- (void)awakeFromNib {
	[self setAlphaValue:0.0];
}

/*
 Custom windows that use the NSBorderlessWindowMask can't become key by default. Override this method so that controls in this window will be enabled.
 */
- (BOOL)canBecomeKeyWindow {
    return YES;
}

- (void)fadeIn {
	[self fadeIn:duration];
}

- (void)fadeIn:(float)theDuration {
	
	((IconView *)self.targetView).desaturation = 0.0;
	
	/*
	CIFilter *color;
	color = [CIFilter filterWithName:@"CIColorControls"];
	color.name = @"colorFilter";
	[color setDefaults];
	[color setValue:[NSNumber numberWithFloat:1.0] forKey:@"inputSaturation"];
	*/
	
	// firstView, secondView are outlets
    NSViewAnimation *theAnim;
	
	NSMutableDictionary *viewDict = [NSMutableDictionary dictionary];
	
	// Specify which view to modify.
	[viewDict setObject:self forKey:NSViewAnimationTargetKey];
	
	/*
	NSRect wRect = self.frame;
	NSRect viewZeroSize = NSMakeRect(NSMidX(wRect), NSMidY(wRect), 0, 0);
	NSRect endFrame = self.frame;
	
	[viewDict setObject:[NSValue valueWithRect:viewZeroSize]
				 forKey:NSViewAnimationStartFrameKey];
	
	[viewDict setObject:[NSValue valueWithRect:endFrame]
				 forKey:NSViewAnimationEndFrameKey];
	*/
	
	[viewDict setObject:NSViewAnimationFadeInEffect
				 forKey:NSViewAnimationEffectKey];
	
    // Create the view animation object.
    theAnim = [[NSViewAnimation alloc] initWithViewAnimations:[NSArray arrayWithObjects:viewDict, nil]];
	
    // Set some additional attributes for the animation.
    [theAnim setDuration:theDuration];    // One and a half seconds.
    [theAnim setAnimationCurve:curve];
	[theAnim setDelegate:self];
	
    // Run the animation.
    [theAnim startAnimation];
	
    // The animation has finished, so go ahead and release it.
    [theAnim release];
}

- (void)fadeOut {
	[self fadeOut:duration];
}

- (void)fadeOut:(float)theDuration {
	
	((IconView *)self.targetView).desaturation = 0.5;
	
	[self setAlphaValue:1.0];
	
	// firstView, secondView are outlets
    NSViewAnimation *theAnim;
	
	NSMutableDictionary *viewDict = [NSMutableDictionary dictionary];
	
	// Specify which view to modify.
	[viewDict setObject:self forKey:NSViewAnimationTargetKey];
	
	/*
	NSRect wRect = self.frame;
	NSRect viewZeroSize = NSMakeRect(NSMidX(wRect), NSMidY(wRect), 0, 0);
	
	[viewDict setObject:[NSValue valueWithRect:viewZeroSize]
				 forKey:NSViewAnimationEndFrameKey];
	*/
	
	[viewDict setObject:NSViewAnimationFadeOutEffect
				 forKey:NSViewAnimationEffectKey];
	
    // Create the view animation object.
    theAnim = [[NSViewAnimation alloc] initWithViewAnimations:[NSArray arrayWithObjects:viewDict, nil]];
	
    // Set some additional attributes for the animation.
    [theAnim setDuration:theDuration];    // One and a half seconds.
    [theAnim setAnimationCurve:curve];
	[theAnim setDelegate:self];
	
    // Run the animation.
    [theAnim startAnimation];
	
    // The animation has finished, so go ahead and release it.
    [theAnim release];
	
	self.shouldQuit = YES;
}

#pragma mark NSAnimationDelegate

- (void)animationDidEnd:(NSAnimation *)animation {
	if (self.shouldQuit)
		[NSApp terminate:nil];
	else
		[NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(quit:) userInfo:nil repeats:NO];
		
}

- (void)quit:(NSTimer *)timer {
	[self fadeOut:0.25];
}

/*
- (void)animation:(NSAnimation *)animation didReachProgressMark:(NSAnimationProgress)progress

	if ([animation isEqual:self.fadeInAnimation]) {
		
	} else if ([animation isEqual:self.fadeOutAnimation]) {
		
	}
}
*/

@end
