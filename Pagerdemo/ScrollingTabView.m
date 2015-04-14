//
//  ScrollingTabView.m
//  Pagerdemo
//
//  Created by webwerks on 3/28/15.
//  Copyright (c) 2015 Pradeep. All rights reserved.
//

#define numberOfTab 3
#define tabWidth self.frame.size.width/numberOfTab
#define tabHeight self.frame.size.height

#import "ScrollingTabView.h"

@implementation ScrollingTabView


- (id)initWithFrame:(CGRect)frame withTabArray:(NSArray *)aryTabs
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setupScrollView:aryTabs];
    }
    return self;
}

-(void)setupScrollView:(NSArray *)aryTabs{

    for (int i=0; i<[aryTabs count]; i++) {
        UIButton *btnTap = [[UIButton alloc] initWithFrame:CGRectMake((i+1) * tabWidth, 0.0, tabWidth, tabHeight)];
        [btnTap setTitle:[NSString stringWithFormat:@"Tab-%d",i+1] forState:UIControlStateNormal];
        btnTap.titleLabel.textAlignment = NSTextAlignmentCenter;
        btnTap.tag = i;
        [btnTap addTarget:self action:@selector(tapOnTab:) forControlEvents:UIControlEventTouchUpInside];
        
        switch (i) {
            case 10:
            {
                btnTap.backgroundColor = [UIColor orangeColor];
            }
                break;
                
            case 0:
            {
                btnTap.backgroundColor = [UIColor orangeColor];
            }
                break;
                

            case 1:
            {
                btnTap.backgroundColor = [UIColor redColor];
            }
                break;
            case 2:
            {
                btnTap.backgroundColor = [UIColor greenColor];
            }
                break;
                
            case 3:
            {
                btnTap.backgroundColor = [UIColor blueColor];
            }
                break;
                
            case 4:
            {
                btnTap.backgroundColor = [UIColor cyanColor];
            }
                break;
            case 5:
            {
                btnTap.backgroundColor = [UIColor yellowColor];
            }
                break;
                
            case 6:
            {
                btnTap.backgroundColor = [UIColor magentaColor];
            }
                break;
                
            case 7:
            {
                btnTap.backgroundColor = [UIColor grayColor];
            }
                break;
                
            case 8:
            {
                btnTap.backgroundColor = [UIColor purpleColor];
            }
                break;
                
            case 9:
            {
                btnTap.backgroundColor = [UIColor grayColor];
            }
                break;
                
                
            default:
                break;
        }

        [self addSubview:btnTap];
    }
    
    self.lblUnderLine = [[UILabel alloc] initWithFrame:CGRectMake(tabWidth, tabHeight-5, tabWidth, 5.0)];
    self.lblUnderLine.backgroundColor = [UIColor orangeColor];
    [self addSubview:self.lblUnderLine];
    
    
    [self setContentSize:CGSizeMake(tabWidth*([aryTabs count]+2), tabHeight)];
    [self setShowsHorizontalScrollIndicator:NO];
    [self setShowsVerticalScrollIndicator:NO];
//    [self setPagingEnabled:YES];

}

-(void)tapOnTab:(id)sender{

    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:[NSNumber numberWithLong:[sender tag]],@"tag" , @"yes",@"OnButtonTap", nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"changeTabBarView" object:nil userInfo:dict];

    
}

@end
