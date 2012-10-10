//
//  RecentlyUsedEquationsViewController.m
//  Graphique
//
//  Created by Sergey Rogozha on 07.10.12.
//  Copyright (c) 2012 Sergey Rogozha. All rights reserved.
//

#import "RecentlyUsedEquationsViewController.h"
#import "GroupItem.h"
#import "EquationItem.h"

#define EQUATION_ENTRY_MIN_WIDTH 175.0
#define PREFERRED_RECENT_EQUATIONS_MIN_WIDTH 100.0


@interface RecentlyUsedEquationsViewController ()

@end

@implementation RecentlyUsedEquationsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        rootItem = [[GroupItem alloc] init];
        
        for (int i=0; i<4; i++)
        {
            GroupItem *temp = [[GroupItem alloc] init];
            temp.name = [NSString stringWithFormat:@"Group %d", i + 1];
            for (int j = 0; j <5; j++)
            {
                EquationItem *item = [[EquationItem alloc] init];
                [temp addChild:item];
            }
        [rootItem addChild:temp];
        }
    }
    return self;
}

- (NSInteger)outlineView:(NSOutlineView *)outlineView numberOfChildrenOfItem:(id)item
{
    return (item == nil) ? [rootItem numberOfChildren] : [item numberOfChildren];
}

- (BOOL)outlineView:(NSOutlineView *)outlineView isItemExpandable:(id)item
{
    return (item == nil) ? ([rootItem numberOfChildren] > 0) : ([item numberOfChildren] > 0);
}

- (id)outlineView:(NSOutlineView *)outlineView child:(NSInteger)index ofItem:(id)item
{
    if (item == nil)
    {
        return [rootItem ChildAtIndex:index];
    }
    else
    {
        return [(GroupItem *)item ChildAtIndex:index];
    }
}

- (id)outlineView:(NSOutlineView *)outlineView objectValueForTableColumn:(NSTableColumn *)tableColumn byItem:(id)item
{
    return (item == nil) ? @"" : [item text];
}

#pragma mark - NSSplitViewDelegate methods

- (CGFloat)splitView:(NSSplitView *)splitView constrainMinCoordinate:(CGFloat)proposedMinimumPosition ofSubviewAt:(NSInteger)dividerIndex
{
    return splitView.frame.size.width - EQUATION_ENTRY_MIN_WIDTH;
}

- (void)splitView:(NSSplitView *)splitView resizeSubviewsWithOldSize:(NSSize)oldSize
{
    // получить новую рамку для разделенного представления
    NSSize size = splitView.bounds.size;
    
    // получить ширину разделителя
    CGFloat dividerWidth = splitView.dividerThickness;
    
    // получить рамки для представления недавних формул и
    // представления для ввода формул
    NSArray *views = splitView.subviews;
    NSRect recentlyUsed = [[views objectAtIndex:0] frame];
    NSRect equationEntry = [[views objectAtIndex:1] frame];

    // задать ширину, изменяя размеры в следующем порядке:
    // 1) ширина предсталвения для ввода формул должна быть не меньше
    // 175 пикселей за вычетом ширины разделителя
    // 2) ширина представления недавних формул должна сохранять свой текущий
    // размер, при условии, что она не становится меньше 100 пикселей
    // 3) если ширина представления недавних формул оказывается меньше
    // 100 пикселей, увеличить ее до тех пор, пока она не станет
    // равной 100 пикселям
    float totalFrameWidth = size.width - dividerWidth;
    
    // задать желаемый размер представления недавних формул (не менее
    // 100 пикселей по ширине) или сохранить его нулевым, если это
    // представление свернуто
    recentlyUsed.size.width = recentlyUsed.size.width == 0 ? 0 : MAX(PREFERRED_RECENT_EQUATIONS_MIN_WIDTH, recentlyUsed.size.width);
    
    // рассчитать ширину предсталения для формул, исходя из
    // ширины представления недавних формул
    equationEntry.size.width = MAX(EQUATION_ENTRY_MIN_WIDTH - dividerWidth, (totalFrameWidth - recentlyUsed.size.width));
    
    // А теперь, когда ширина представления для ввода формул задана,
    // выполнить перерасчет ширины представленяи недавних формул
    recentlyUsed.size.width = totalFrameWidth - equationEntry.size.width;
    
    // задать координату X представления для ввода формул
    equationEntry.origin.x = recentlyUsed.size.width + dividerWidth;
    
    // задать ширины
    [[views objectAtIndex:0]setFrame:recentlyUsed];
    [[views objectAtIndex:1]setFrame:equationEntry];
}

- (BOOL)splitView:(NSSplitView *)splitView shouldCollapseSubview:(NSView *)subview forDoubleClickOnDividerAtIndex:(NSInteger)dividerIndex
{
    return subview == self.view;
}

- (BOOL)splitView:(NSSplitView *)splitView canCollapseSubview:(NSView *)subview
{
    return subview == self.view;
}

@end
