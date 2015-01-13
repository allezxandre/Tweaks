#import "CustomHeader.h"

%hook UITextField
	- (void)copy:(id)arg1 {
		%orig;
		// NSLog(@"HOOK copy:%@",arg1);
		[[UIKeyboard activeKeyboard] minimize];
	}
	- (void)cut:(id)arg1 {
		%orig;
		// NSLog(@"HOOK cut:%@",arg1);
		[[UIKeyboard activeKeyboard] minimize];
	}
%end

%hook UITextView
	- (void)copy:(id)arg1 {
		%orig;
		// NSLog(@"HOOK copy:%@",arg1);
		[[UIKeyboard activeKeyboard] minimize];
	}
	- (void)cut:(id)arg1 {
		%orig;
		// NSLog(@"HOOK cut:%@",arg1);
		[[UIKeyboard activeKeyboard] minimize];
	}
%end

%hook UIWebDocumentView
	- (void)copy:(id)arg1 {
		%orig;
		// NSLog(@"HOOK copy:%@",arg1);
		[[UIKeyboard activeKeyboard] minimize];
	}
	- (void)cut:(id)arg1 {
		%orig;
		// NSLog(@"HOOK cut:%@",arg1);
		[[UIKeyboard activeKeyboard] minimize];
	}
%end