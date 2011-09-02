#import "IowaCodeCampAppDelegate.h"
#import "IowaCodeCampViewController.h"
#import "SessionDetails.h"

@implementation IowaCodeCampAppDelegate
@synthesize window;
@synthesize viewController;
@synthesize detailsController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    navController.viewControllers = [NSArray arrayWithObject:viewController];
    
    [window addSubview:navController.view];
    [window makeKeyAndVisible];
    return YES;
}

- (void)newReleasesJsonFinished
{
    [viewController refreshDisplay];
}

- (void)showSessionDetailsView:(Session *)session {
    if (detailsController) 
    { [detailsController release]; } // assuming you've got a retain on it.
    detailsController = [[SessionDetails alloc] init];
    
    [detailsController setSelectedSession:session];
//    [detailsController setAppDelegate:self];
//    [detailsController setTitle:@"Movie Details"];
    
    [navController pushViewController:detailsController animated:YES];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

- (void)dealloc
{
    [window release];
    [viewController release];
    [super dealloc];
}

@end