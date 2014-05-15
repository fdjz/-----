//
//  ICSColorsViewController.m
//
//  Created by Vito Modena
//
//  Copyright (c) 2014 ice cream studios s.r.l. - http://icecreamstudios.com
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of
//  this software and associated documentation files (the "Software"), to deal in
//  the Software without restriction, including without limitation the rights to
//  use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
//  the Software, and to permit persons to whom the Software is furnished to do so,
//  subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
//  FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
//  COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
//  IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
//  CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#import "ICSColorsViewController.h"
#import "ICSPlainColorViewController.h"
#import "fdjzCell.h"
static NSString * const kICSColorsViewControllerCellReuseId = @"kICSColorsViewControllerCellReuseId";



@interface ICSColorsViewController ()
{
    NSInteger _count;
}
@property(nonatomic, strong) NSArray *colors;
@property(nonatomic, assign) NSInteger previousRow;
@property(nonatomic,strong)NSArray *array;
@property(nonatomic,strong)NSDictionary *dictionary;
@property(nonatomic,strong)NSDictionary *imageDictionary;
@end



@implementation ICSColorsViewController

- (id)initWithColors:(NSArray *)colors
{
    NSParameterAssert(colors);
    
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        _colors = colors;
        _count = 0;
//        self.array = [NSArray arrayWithObjects:@"北京",@"上海",@"广州",@"深圳",@"长沙",@"沈阳",@"西安", nil];
//        self.dictionary = @{@[@"省流量模式",@"0"]:@"常用",@[@"淘宝",@"游戏"]:@"1"};
        self.dictionary = @{@"0":@[@"省流量模式",@"换肤"],@"1":@[@"淘宝",@"游戏"]};
        NSLog(@"%@",self.dictionary);
        self.array = @[@"常用",@"推荐"];
        self.imageDictionary = @{@"0":@[[UIImage imageNamed:@"1.png"],[UIImage imageNamed:@"2.png"]],@"1":@[[UIImage imageNamed:@"3.png"],[UIImage imageNamed:@"4.png"]]};
        
        NSLog(@"--我的天------");
        NSLog(@"---我的天---我的天------------");
        NSLog(@"-------我的天-----------");
        
    }
    return self;
}

#pragma mark - Managing the view

- (void)viewDidLoad
{
    [super viewDidLoad];
   // self.view.backgroundColor = [UIColor greenColor];
//    UIImageView *imageView =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"image.png"]];
//    imageView.frame = self.view.frame;
   // self.tableView.backgroundView = imageView;
    self.tableView.rowHeight = 38;
    //系统刚开始是不存在这个tableHeaderView的,你必须先让他等于一个东西,然后你才能用addsubView方法给它添加东西,否则你不先等于,直接addSubview添加是没用的.
    UIImageView *imageView =[ [UIImageView alloc]initWithImage:[UIImage imageNamed:@"cellBackgroundImage"]];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"登陆/注册" forState:UIControlStateNormal];
    [button setFrame:CGRectMake(58, 2, 80, 36)];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setFont:[UIFont boldSystemFontOfSize:16]];
    [imageView addSubview:button];
    
    UIImageView *imageButton = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"5.png"]];
    imageButton.frame =CGRectMake(10, 0, 38, 38);
    [imageView addSubview:imageButton];
    
    imageView.frame = CGRectMake(0, 0, 320, 38);
    self.tableView.tableHeaderView = imageView;
    [self.tableView registerClass:[fdjzCell class] forCellReuseIdentifier:kICSColorsViewControllerCellReuseId];
   
    //self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

#pragma mark - Configuring the view’s layout behavior

- (UIStatusBarStyle)preferredStatusBarStyle
{
    // Even if this view controller hides the status bar, implementing this method is still needed to match the center view controller's
    // status bar style to avoid a flicker when the drawer is dragged and then left to open.
    return UIStatusBarStyleLightContent;
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    
    NSArray *array = [self.dictionary objectForKey:[NSString stringWithFormat:@"%d",section]];
  
    return array.count;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    tableView.backgroundColor = [UIColor orangeColor];
    
    return (NSString*)[self.array objectAtIndex:section];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSParameterAssert(self.colors);

  
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kICSColorsViewControllerCellReuseId
//                                                            forIndexPath:indexPath];
//    cell.textLabel.text = [NSString stringWithFormat:@"Color %ld", (long)indexPath.row];
//    cell.textLabel.textColor = [UIColor whiteColor];
//
//    cell.backgroundColor = self.colors[indexPath.row];
    NSLog(@"++++++++++++++");
  UIColor *color=  [UIColor colorWithRed:(arc4random()%256/255.0f) green:(arc4random()%256/255.0f) blue:(arc4random()%256/255.0f) alpha:1.0];
    
 fdjzCell *cell = [tableView dequeueReusableCellWithIdentifier:kICSColorsViewControllerCellReuseId
                                                                forIndexPath:indexPath];
    cell.tag = _count;
//    NSString *string = [self.array objectAtIndex:indexPath.section];
//    NSArray *array = [self.dictionary objectForKey:string];
    //取出标题
    NSArray *array = [self.dictionary objectForKey:[NSString stringWithFormat:@"%d",indexPath.section]];
    NSString *string1 = [array objectAtIndex:indexPath.row];
   cell->_label.text = string1;
    cell->_label.tag = _count;
    //取出图片
    cell->_imageView.image = (UIImage*)[[self.imageDictionary objectForKey:[NSString stringWithFormat:@"%d",indexPath.section ]]objectAtIndex:indexPath.row];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleAction:)];
    [cell->_label addGestureRecognizer:tap];
    
    NSLog(@"----------%d",cell.tag);
    _count++;
    
    return cell;
}
-(void)handleAction:(UITapGestureRecognizer*)sender
{
    //最后在来一个self.controller  push 到相关页面.....
    
    UILabel *label = (UILabel*)[self.tableView viewWithTag:sender.view.tag];
    switch (label.tag) {
        case 0:
            NSLog(@"省流量模式;");
            break;
        case 1:
            NSLog(@"换肤;");
            break;
        case 2:
            NSLog(@"淘宝");
            break;
        case 3:
            NSLog(@"游戏");
            break;
        default:
            break;
    }
}
#pragma mark - Table view delegate
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (indexPath.row == self.previousRow) {
//        // Close the drawer without no further actions on the center view controller
//        [self.drawer close];
//    }
//    else {
//        // Reload the current center view controller and update its background color
//        typeof(self) __weak weakSelf = self;
//        [self.drawer reloadCenterViewControllerUsingBlock:^(){
//            NSParameterAssert(weakSelf.colors);
//            weakSelf.drawer.centerViewController.view.backgroundColor = weakSelf.colors[indexPath.row];
//        }];
//        
////        // Replace the current center view controller with a new one
////        ICSPlainColorViewController *center = [[ICSPlainColorViewController alloc] init];
////        center.view.backgroundColor = [UIColor redColor];
////        [self.drawer replaceCenterViewControllerWithViewController:center];
//    }
//    self.previousRow = indexPath.row;
//}

#pragma mark - ICSDrawerControllerPresenting

- (void)drawerControllerWillOpen:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = NO;
}

- (void)drawerControllerDidOpen:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = YES;
}

- (void)drawerControllerWillClose:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = NO;
}

- (void)drawerControllerDidClose:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = YES;
}

@end
