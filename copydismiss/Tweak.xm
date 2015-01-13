// #import "CustomHeader.h"

%hook UITextField
	- (void)copy:(id)arg1 {
		%orig;
		 NSLog(@"HOOK copy from UITextField:%@",arg1);
		//[[UIKeyboard activeKeyboard] minimize];
		[[[UIApplication sharedApplication] keyWindow] endEditing:YES];
		//[[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
	}
	- (void)cut:(id)arg1 {
		%orig;
		 NSLog(@"HOOK cut from UITextField:%@",arg1);
		//[[UIKeyboard activeKeyboard] minimize];
		[[[UIApplication sharedApplication] keyWindow] endEditing:YES];
		//[[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
	}
%end

%hook UIPasteboard
	- (void)_pasteboardChanged:(id)arg1 {
		%orig;
		 NSLog(@"HOOK _pasteboardChanged from UIPasteboard:%@",arg1);
		//[[UIKeyboard activeKeyboard] minimize];
		[[[UIApplication sharedApplication] keyWindow] endEditing:YES];
	}
%end

%hook UITextView
	- (void)copy:(id)arg1 {
		%orig;
		 NSLog(@"HOOK copy:%@",arg1);
		//[[UIKeyboard activeKeyboard] minimize];
		[[[UIApplication sharedApplication] keyWindow] endEditing:YES];
		//[[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
	}
	- (void)cut:(id)arg1 {
		%orig;
		 NSLog(@"HOOK cut:%@",arg1);
		//[[UIKeyboard activeKeyboard] minimize];
		[[[UIApplication sharedApplication] keyWindow] endEditing:YES];
		//[[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
	}
%end

%hook UIWebDocumentView
	- (void)copy:(id)arg1 {
		%orig;
		 NSLog(@"HOOK copy:%@",arg1);
		//[[UIKeyboard activeKeyboard] minimize];
		[[[UIApplication sharedApplication] keyWindow] endEditing:YES];
		//[[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
	}
	- (void)cut:(id)arg1 {
		%orig;
		 NSLog(@"HOOK cut:%@",arg1);
		//[[UIKeyboard activeKeyboard] minimize];
		[[[UIApplication sharedApplication] keyWindow] endEditing:YES];
		//[[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
	}
%end

%hook UITextInputController
	- (void)copy:(id)arg1 {
		%orig;
		 NSLog(@"HOOK copy from UITextInputController:%@",arg1);
		//[[UIKeyboard activeKeyboard] minimize];
		[[[UIApplication sharedApplication] keyWindow] endEditing:YES];
		//[[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
	}
	- (void)cut:(id)arg1 {
		%orig;
		 NSLog(@"HOOK cut from UITextInputController:%@",arg1);
		//[[UIKeyboard activeKeyboard] minimize];
		[[[UIApplication sharedApplication] keyWindow] endEditing:YES];
		//[[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
	}
%end

%hook UIWebBrowserView
	- (void)copy:(id)arg1 {
		%orig;
		 NSLog(@"HOOK copy from UIWebBrowserView:%@",arg1);
		//[[UIKeyboard activeKeyboard] minimize];
		[[[UIApplication sharedApplication] keyWindow] endEditing:YES];
		//[[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
	}
	- (void)cut:(id)arg1 {
		%orig;
		 NSLog(@"HOOK cut from UIWebBrowserView:%@",arg1);
		//[[UIKeyboard activeKeyboard] minimize];
		[[[UIApplication sharedApplication] keyWindow] endEditing:YES];
		//[[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
	}
%end

%hook MFMessageWebLayer
	- (void)copy:(id)arg1 {
		%orig;
		 NSLog(@"HOOK copy from MFMessageWebLayer:%@",arg1);
		//[[UIKeyboard activeKeyboard] minimize];
		[[[UIApplication sharedApplication] keyWindow] endEditing:YES];
		//[[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
	}
	- (void)cut:(id)arg1 {
		%orig;
		 NSLog(@"HOOK cut from MFMessageWebLayer:%@",arg1);
		//[[UIKeyboard activeKeyboard] minimize];
		[[[UIApplication sharedApplication] keyWindow] endEditing:YES];
		//[[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
	}
%end

%hook UITextContentView
	- (void)copy:(id)arg1 {
		%orig;
		 NSLog(@"HOOK copy from UITextContentView:%@",arg1);
		//[[UIKeyboard activeKeyboard] minimize];
		[[[UIApplication sharedApplication] keyWindow] endEditing:YES];
		//[[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
	}
	- (void)cut:(id)arg1 {
		%orig;
		 NSLog(@"HOOK cut from UITextContentView:%@",arg1);
		//[[UIKeyboard activeKeyboard] minimize];
		[[[UIApplication sharedApplication] keyWindow] endEditing:YES];
		//[[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
	}
%end

%hook _UICompatibilityTextView
	- (void)copy:(id)arg1 {
		%orig;
		 NSLog(@"HOOK copy from _UICompatibilityTextView:%@",arg1);
		//[[UIKeyboard activeKeyboard] minimize];
		[[[UIApplication sharedApplication] keyWindow] endEditing:YES];
		//[[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
	}
	- (void)cut:(id)arg1 {
		%orig;
		 NSLog(@"HOOK cut from _UICompatibilityTextView:%@",arg1);
		//[[UIKeyboard activeKeyboard] minimize];
		[[[UIApplication sharedApplication] keyWindow] endEditing:YES];
		//[[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
	}
%end