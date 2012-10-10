//
//  AppDelegate.m
//  Graphique
//
//  Created by Sergey Rogozha on 06.10.12.
//  Copyright (c) 2012 Sergey Rogozha. All rights reserved.
//

#import "AppDelegate.h"
#import "EquationEntryViewController.h"
#import "GraphTableViewController.h"
#import "RecentlyUsedEquationsViewController.h"

@implementation AppDelegate

@synthesize horizontalSPlitView;
@synthesize verticalSplitView;
@synthesize equationEntryViewController;
@synthesize graphTableViewController;
@synthesize recentlyUsedEquationsViewController;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    NSLog(@"Hello World!");
    self.equationEntryViewController = [[EquationEntryViewController alloc] initWithNibName:@"EquationEntryViewController" bundle:nil];
    [self.verticalSplitView replaceSubview:[[self.verticalSplitView subviews] objectAtIndex:1] with:equationEntryViewController.view];
    
    self.graphTableViewController = [[GraphTableViewController alloc] initWithNibName:@"GraphTableViewController" bundle:nil];
    [self.horizontalSPlitView replaceSubview:[[self.horizontalSPlitView subviews] objectAtIndex:1] with:graphTableViewController.view];
    
    self.recentlyUsedEquationsViewController = [[RecentlyUsedEquationsViewController alloc] initWithNibName:@"RecentlyUsedEquationsViewController" bundle:nil];
    [self.verticalSplitView replaceSubview:[[self.verticalSplitView subviews] objectAtIndex:0] with:recentlyUsedEquationsViewController.view];
    self.verticalSplitView.delegate = recentlyUsedEquationsViewController;
    
    
}

- (void)applicationDidBecomeActive:(NSNotification *)aNotification
{
    NSLog(@"Application is active");
}

-(void)applicationDidResignActive:(NSNotification *)aNotification
{
    NSLog(@"Appliaction is no longer active");
}
@end

