//
//  BWUtilities.h
//  Bill Weinman, 2010-10-12
//
//  Copyright 2010 The BearHeart Group, LLC. All rights reserved.
//

static NSString * const kBWUtilitiesVersion = @"1.0.5";
static NSString * const kAlertTitle = @"BW Sandbox";
static BOOL const kMessageActive = YES;

// populated from loadDidView
UITextView * messageTextView;

void message ( NSString *format, ... );
void alertMessage ( NSString *format, ... );
NSString * flattenHTML ( NSString * html );
NSString * trimString ( NSString * string );
