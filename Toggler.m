//
//  Toggler.m
//  Toogle Dashboard
//
//  Created by Simon Fransson on 2010-08-07.
//  Copyright 2010 Hobo Code. All rights reserved.
//

#import "Toggler.h"


@implementation Toggler

+ (Toggler *)toggler
{
	return [[[Toggler alloc] init] autorelease];
}


- (BOOL)toggleDashboard
{
	return (BOOL)[self runScript:@"toggle_dashboard"];
}

- (NSInteger)runScript:(NSString *)scriptName
{
    NSTask *task;
    task = [[NSTask alloc] init];
    [task setLaunchPath: @"/bin/sh"];
	
    NSArray *arguments;
    NSString* newpath = [[NSBundle mainBundle] pathForResource:scriptName ofType:@"sh"];
    NSLog(@"shell script path: %@", newpath);
    
	arguments = [NSArray arrayWithObjects:newpath, nil];
    [task setArguments: arguments];
	
    NSPipe *pipe;
    pipe = [NSPipe pipe];
    [task setStandardOutput: pipe];
	
    NSFileHandle *file;
    file = [pipe fileHandleForReading];
	
    [task launch];
	
    NSData *data;
    data = [file readDataToEndOfFile];
	
    NSString *string;
    string = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
    NSLog (@"script returned:\n%@", string);
	
	return [string intValue];
}

@end
