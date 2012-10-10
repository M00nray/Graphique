//
//  GroupItem.m
//  Graphique
//
//  Created by Sergey Rogozha on 07.10.12.
//  Copyright (c) 2012 Sergey Rogozha. All rights reserved.
//

#import "GroupItem.h"

@implementation GroupItem

@synthesize name;

- (id)init
{
    self = [super init];
    if (self)
    {
        children = [[NSMutableArray alloc]  init];
    }
    return self;
}

- (void)addChild:(id)childNode
{
    [children addObject:childNode];
}

- (NSInteger)numberOfChildren
{
    return children.count;
}

- (id)ChildAtIndex:(NSUInteger)n
{
    return [children objectAtIndex:n];
}

- (NSString *)text
{
    return name;
}
@end
