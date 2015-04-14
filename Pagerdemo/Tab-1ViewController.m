//
//  Tab-1ViewController.m
//  Pagerdemo
//
//  Created by webwerks on 3/28/15.
//  Copyright (c) 2015 Pradeep. All rights reserved.
//

#import "Tab-1ViewController.h"

@interface Tab_1ViewController ()

@end

@implementation Tab_1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"viewDidLoad Tab_1ViewController Call %ld",(long)self.view.tag+1);
    
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{

    

}

-(void)viewDidAppear:(BOOL)animated{
    NSLog(@"viewDidAppear Tab_1ViewController Call %ld",(long)self.view.tag+1);
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:[NSNumber numberWithLong:self.view.tag],@"tag", @"no",@"OnButtonTap", nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"changeTabBarView" object:nil userInfo:dict];


}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
