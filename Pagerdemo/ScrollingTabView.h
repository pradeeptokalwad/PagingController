//
//  ScrollingTabView.h
//  Pagerdemo
//
//  Created by webwerks on 3/28/15.
//  Copyright (c) 2015 Pradeep. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScrollingTabView : UIScrollView
- (id)initWithFrame:(CGRect)frame withTabArray:(NSArray *)aryTabs;
@property(nonatomic,strong) UILabel *lblUnderLine;

@end
