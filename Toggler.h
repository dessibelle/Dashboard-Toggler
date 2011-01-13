//
//  Toggler.h
//  Toogle Dashboard
//
//  Created by Simon Fransson on 2010-08-07.
//  Copyright 2010 Hobo Code. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface Toggler : NSObject {

}

+ (Toggler *)toggler;
- (BOOL)toggleDashboard;
- (NSInteger)runScript:(NSString *)scriptName;

@end
