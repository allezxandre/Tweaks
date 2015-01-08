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
#import <UIKit/UIKit.h>
#import <substrate.h>
#import <notify.h>

/*
@interface SASettingSetDoNotDisturb //: SASettingSetBool
//{
//}
  + (id)setDoNotDisturb;
@end
*/
#import "DNDSwitch.h"

%hook SpringBoard

-(void)applicationDidFinishLaunching:(id)application {
    %orig;
    
    int _ringerStateToken;

    notify_register_dispatch("com.apple.springboard.ringerstate", &_ringerStateToken, dispatch_get_main_queue(), ^(int token) {
        //[self updateState];
      NSLog(@"Changement de ringer détecté");
      /*
      UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Coucou PD" message:@"RingerSwitch hooké" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
      [alert show];
      */
      [SASettingSetDoNotDisturb setDoNotDisturb];
    });

// Silent switch toggle
// uint64_t state;

    //if (notify_get_state(_ringerStateToken, &state)==NOTIFY_STATUS_OK && state==1){
     // ... Do stuff ....
}

%end

%hook SASettingSetDoNotDisturb
+ (id)setDoNotDisturb
{
  %orig;
  %log;
  NSLog(@"Hook SASettingSetDoNotDisturb");
  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Do Not Disturb" message:@"Hooké avec succès :D" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
  [alert show];
  return %orig;
}
%end

%hook UIKeyboardPredictiveSettings

- (void)pressRingerButton {
  NSLog(@"Hook ringer");
  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Deuxieme" message:@"Deuxieme HOOK" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
  [alert show];
}

%end


%hook SpringBoard

-(void)ringerChanged:(int)arg1
{
  %log;
  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Coucou PD" message:@"RingerSwitch hooké pour de bon" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
  [alert show];
  return;
}

%end


/*
%hook SBApplication

- (id)iconDisplayName:(id)arg1
{
  %log;
  return @":)";
}
%end
*/
