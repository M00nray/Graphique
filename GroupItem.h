//
//  GroupItem.h
//  Graphique
//
//  Created by Sergey Rogozha on 07.10.12.
//  Copyright (c) 2012 Sergey Rogozha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GroupItem : NSObject
{
@private
    NSString *name;
    NSMutableArray  *children;
}

@property (nonatomic, retain) NSString *name;

- (NSInteger)numberOfChildren;
- (id)ChildAtIndex:(NSUInteger)n;
- (NSString *)text;
- (void)addChild:(id)childNode;

@end
