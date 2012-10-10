//
//  AppDelegate.h
//  Graphique
//
//  Created by Sergey Rogozha on 06.10.12.
//  Copyright (c) 2012 Sergey Rogozha. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class EquationEntryViewController;
@class GraphTableViewController;
@class RecentlyUsedEquationsViewController ;


@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSSplitView *verticalSplitView;
@property (weak) IBOutlet NSSplitView *horizontalSPlitView;
@property (strong) EquationEntryViewController  *equationEntryViewController;
@property   (strong)    GraphTableViewController    *graphTableViewController;
@property   (strong)    RecentlyUsedEquationsViewController *recentlyUsedEquationsViewController;

@end
