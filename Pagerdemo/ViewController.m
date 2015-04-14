//
//  ViewController.m
//  Pagerdemo
//
//  Created by webwerks on 3/28/15.
//  Copyright (c) 2015 Pradeep. All rights reserved.
//

#import "ViewController.h"
#import "Tab-1ViewController.h"
#import "ScrollingTabView.h"

#define numberOfTab 3
#define tabWidth self.view.frame.size.width/numberOfTab

@interface ViewController (){

    NSMutableArray *aryPageViewController;
    ScrollingTabView *scrV;
    
    NSInteger lastIndex;
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PagerViewController"];
    self.pageViewController.dataSource = self;
    
    if(!aryPageViewController){
    
        aryPageViewController = [[NSMutableArray alloc] init];
    }
    
    for (int i=0; i<10; i++) {
        
        Tab_1ViewController *tab_1ViewController = (Tab_1ViewController*)[self viewControllerAtIndex:i];
        UILabel *lblNumber = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.frame.size.width, 100.0)];
        lblNumber.text = [NSString stringWithFormat:@"%d",i+1];
        lblNumber.center = tab_1ViewController.view.center;
        lblNumber.textAlignment = NSTextAlignmentCenter;
        lblNumber.font = [UIFont systemFontOfSize:30.0f];
        [tab_1ViewController.view addSubview:lblNumber];
        
        lblNumber = nil;

        switch (i) {
            case 10:
            {
                tab_1ViewController.view.backgroundColor = [UIColor orangeColor];
            }
                break;
                
            case 0:
            {
                tab_1ViewController.view.backgroundColor = [UIColor orangeColor];
            }
                break;

            case 1:
            {
                tab_1ViewController.view.backgroundColor = [UIColor redColor];
            }
                break;
            case 2:
            {
                tab_1ViewController.view.backgroundColor = [UIColor greenColor];
            }
                break;

            case 3:
            {
                tab_1ViewController.view.backgroundColor = [UIColor blueColor];
            }
                break;
                
            case 4:
            {
                tab_1ViewController.view.backgroundColor = [UIColor cyanColor];
            }
                break;
            case 5:
            {
                tab_1ViewController.view.backgroundColor = [UIColor yellowColor];
            }
                break;

            case 6:
            {
                tab_1ViewController.view.backgroundColor = [UIColor magentaColor];
            }
                break;

            case 7:
            {
                tab_1ViewController.view.backgroundColor = [UIColor grayColor];
            }
                break;

            case 8:
            {
                tab_1ViewController.view.backgroundColor = [UIColor purpleColor];
            }
                break;
                
            case 9:
            {
                tab_1ViewController.view.backgroundColor = [UIColor grayColor];
            }
                break;


            default:
                break;
        }
        [aryPageViewController addObject:tab_1ViewController];
        

    }

    [self.pageViewController setViewControllers:@[[aryPageViewController objectAtIndex:0]] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    // Change the size of page view controller
    self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 30);
    
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];

    scrV = [[ScrollingTabView alloc] initWithFrame:CGRectMake(0.0, self.view.frame.size.height - 67, self.view.frame.size.width, 67.0) withTabArray:aryPageViewController];
    [self.view addSubview:scrV];


    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeTabBarView:) name:@"changeTabBarView" object:nil];
    
    lastIndex = 0;
    // Do any additional setup after loading the view, typically from a nib.
}

- (UIViewController *)viewControllerAtIndex:(NSUInteger)index
{
    Tab_1ViewController *tab_1ViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Tab_1ViewController"];
    tab_1ViewController.view.tag = index;
    return tab_1ViewController;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    
    lastIndex = viewController.view.tag;

    if(viewController.view.tag == 1){
        
        [scrV setContentOffset:CGPointMake(tabWidth*viewController.view.tag, scrV.contentOffset.y) animated:YES];
        
        scrV.lblUnderLine.frame = CGRectMake(tabWidth*(viewController.view.tag+1), scrV.lblUnderLine.frame.origin.y, scrV.lblUnderLine.frame.size.width, scrV.lblUnderLine.frame.size.height);
        
        return [aryPageViewController objectAtIndex:0];
    }else if(viewController.view.tag>1){
        
        [scrV setContentOffset:CGPointMake(tabWidth*viewController.view.tag, scrV.contentOffset.y) animated:YES];
        
        scrV.lblUnderLine.frame = CGRectMake(tabWidth*(viewController.view.tag+1), scrV.lblUnderLine.frame.origin.y, scrV.lblUnderLine.frame.size.width, scrV.lblUnderLine.frame.size.height);

        return [aryPageViewController objectAtIndex:viewController.view.tag-1];
    }else{
        [scrV setContentOffset:CGPointMake(tabWidth*viewController.view.tag, scrV.contentOffset.y) animated:YES];
        scrV.lblUnderLine.frame = CGRectMake(tabWidth*(viewController.view.tag+1), scrV.lblUnderLine.frame.origin.y, scrV.lblUnderLine.frame.size.width, scrV.lblUnderLine.frame.size.height);
    }
    return nil;

    
return nil;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    
    lastIndex = viewController.view.tag;

    if(viewController.view.tag == 1){
        
        [scrV setContentOffset:CGPointMake(tabWidth*viewController.view.tag, scrV.contentOffset.y) animated:YES];
        scrV.lblUnderLine.frame = CGRectMake(tabWidth*(viewController.view.tag+1), scrV.lblUnderLine.frame.origin.y, scrV.lblUnderLine.frame.size.width, scrV.lblUnderLine.frame.size.height);


        return [aryPageViewController objectAtIndex:2];
    }else if(viewController.view.tag<[aryPageViewController count]-1){
        
        [scrV setContentOffset:CGPointMake(tabWidth*viewController.view.tag, scrV.contentOffset.y) animated:YES];
        scrV.lblUnderLine.frame = CGRectMake(tabWidth*(viewController.view.tag+1), scrV.lblUnderLine.frame.origin.y, scrV.lblUnderLine.frame.size.width, scrV.lblUnderLine.frame.size.height);


        return [aryPageViewController objectAtIndex:viewController.view.tag+1];
    }else{
        [scrV setContentOffset:CGPointMake(tabWidth*viewController.view.tag, scrV.contentOffset.y) animated:YES];
        scrV.lblUnderLine.frame = CGRectMake(tabWidth*(viewController.view.tag+1), scrV.lblUnderLine.frame.origin.y, scrV.lblUnderLine.frame.size.width, scrV.lblUnderLine.frame.size.height);

    }
    return nil;

}

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed{

    
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [aryPageViewController count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}

- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray *)pendingViewControllers{
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)changeTabBarView:(NSNotification *)info{

    [scrV setContentOffset:CGPointMake(tabWidth*([[[info userInfo] valueForKey:@"tag"] integerValue]), scrV.contentOffset.y) animated:YES];
    
    scrV.lblUnderLine.frame = CGRectMake(tabWidth*([[[info userInfo] valueForKey:@"tag"] integerValue]+1), scrV.lblUnderLine.frame.origin.y, scrV.lblUnderLine.frame.size.width, scrV.lblUnderLine.frame.size.height);

    if([[[info userInfo] valueForKey:@"OnButtonTap"] isEqualToString:@"yes"]){

        if(lastIndex >[[[info userInfo] valueForKey:@"tag"] integerValue] ){
            [self.pageViewController setViewControllers:@[[aryPageViewController objectAtIndex:[[[info userInfo] valueForKey:@"tag"] integerValue]]] direction:UIPageViewControllerNavigationDirectionReverse animated:YES completion:nil];
            
        }else{
            [self.pageViewController setViewControllers:@[[aryPageViewController objectAtIndex:[[[info userInfo] valueForKey:@"tag"] integerValue]]] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
        }
        
        lastIndex = [[[info userInfo] valueForKey:@"tag"] integerValue];
        
        
    }
}

@end
