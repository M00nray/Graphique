//
//  RecentlyUsedEquationsViewController.h
//  Graphique
//
//  Created by Sergey Rogozha on 07.10.12.
//  Copyright (c) 2012 Sergey Rogozha. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class GroupItem;

@interface RecentlyUsedEquationsViewController : NSViewController <NSOutlineViewDataSource, NSSplitViewDelegate>
{
@private
    GroupItem   *rootItem;
}
@end
