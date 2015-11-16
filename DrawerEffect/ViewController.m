//
//  ViewController.m
//  DrawerEffect
//
//  Created by 郭晨风 on 15/11/12.
//  Copyright © 2015年 郭晨风. All rights reserved.
//

#import "ViewController.h"
#import "BQHerderView.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,BQHerderViewDelegate>
@property(nonatomic,strong) NSMutableArray *headerViews;
@property(nonatomic,strong) UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initUI];
}

-(void)changeRowHeight:(UIButton *)sender
{
    BQHerderView *temp = self.headerViews[sender.tag];
    if (temp.on)
    {
        temp.on = NO;
    }
    else
    {
        temp.on = YES;
    }
    [self.tableView reloadData];
}

-(void)initUI
{
    self.navigationItem.title = @"好友列表";
    
    self.headerViews = [NSMutableArray array];
    [self createData];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height-64) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

-(void)createData
{
    
    BQHerderView *hv1 = [BQHerderView herderViewWithName:@"大学同学" andFrame:CGRectMake(0, 0, self.view.bounds.size.width, 45)];
    [hv1.names addObject:@"沈晨豪"];
    [hv1.names addObject:@"尚正霖"];
    [hv1.names addObject:@"邵鹏"];
    [hv1.names addObject:@"徐贤仲"];
    hv1.btn.tag = 0;
    hv1.delegate = self;
    
    BQHerderView *hv2 = [BQHerderView herderViewWithName:@"高中同学" andFrame:CGRectMake(0, 0, self.view.bounds.size.width, 45)];
    [hv2.names addObject:@"王杰"];
    [hv2.names addObject:@"孟获"];
    hv2.btn.tag = 1;
    hv2.delegate = self;
    
    [self.headerViews addObject:hv1];
    [self.headerViews addObject:hv2];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    BQHerderView *tempHeader = [self.headerViews objectAtIndex:section];
    return tempHeader.names.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.headerViews.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BQHerderView *temp = self.headerViews[indexPath.section];
    return temp.on?45.0f:0.0f;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellName = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
    }
    BQHerderView *temp = self.headerViews[indexPath.section];
    cell.textLabel.text = temp.names[indexPath.row];
    cell.clipsToBounds = YES;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 45.0f;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return self.headerViews[section];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end































