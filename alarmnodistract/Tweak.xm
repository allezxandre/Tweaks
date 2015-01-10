/* How to Hook with Logos
Hooks are written with syntax similar to that of an Objective-C @implementation.
You don't need to #include <substrate.h>, it will be done automatically, as will
the generation of a class list and an automatic constructor.

%hook ClassName

// Hooking a class method
+ (id)sharedInstance {
	return %orig;
}

// Hooking an instance method with an argument.
- (void)messageName:(int)argument {
	%log; // Write a message about this call, including its class, name and arguments, to the system log.

	%orig; // Call through to the original function with its original arguments.
	%orig(nil); // Call through to the original function with a custom argument.

	// If you use %orig(), you MUST supply all arguments (except for self and _cmd, the automatically generated ones.)
}

// Hooking an instance method with no arguments.
- (id)noArguments {
	%log;
	id awesome = %orig;
	[awesome doSomethingElse];

	return awesome;
}

// Always make sure you clean up after yourself; Not doing so could have grave consequences!
%end
*/

#import "Tweak.h"

%hook SpingBoard
	- (void)applicationDidFinishLaunching:(id)arg1 {
		%orig;
		NSLog(@"HOOK Alarm: Ready to hook");
	}
%end

%hook AlarmManager
	- (void)handleAlarm:(id)arg1 stoppedUsingSong:(id)arg2 {
		%orig;
		NSLog(@"HOOK Alarm: handleAlarm arg1=%@, arg2=%@",arg1, arg2);
	}
	- (void)removeAlarm:(id)arg1 {
		%orig;
		NSLog(@"HOOK Alarm: handleAlarm arg1=%@",arg1);
	}
	- (void)handleNotificationFired:(id)arg1 {
		%orig;
		NSLog(@"HOOK Alarm: handleNotificationFired arg1=%@",arg1);
	}
	- (void)handleNotificationSnoozed:(id)arg1 {
		%orig;
		NSLog(@"HOOK Alarm: handleNotificationSnoozed arg1=%@",arg1);
	}
	- (void)handleExpiredOrSnoozedNotificationsOnly:(id)arg1 {
		%orig;
		NSLog(@"HOOK Alarm: handleExpiredOrSnoozedNotificationsOnly arg1=%@",arg1);
	}
%end