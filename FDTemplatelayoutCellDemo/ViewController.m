//
//  ViewController.m
//  FDTemplatelayoutCellDemo
//
//  Created by iwind on 15/5/4.
//  Copyright (c) 2015年 HanYang. All rights reserved.
//

#import "ViewController.h"
#import "Cell_test.h"
#import "UITableView+FDTemplateLayoutCell.h"
static NSString * cellIdentifier = @"testCell";
@interface ViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) NSMutableArray * dataArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
    NSArray * arr1 = [NSArray arrayWithObjects:@"天津市天津市天津市天津市天津市天津市天津市天津市天津市天津市天津市天津市天津市天津市天津市天津市",@"2",@"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",@"4",@"5", nil];
    self.dataArr = [NSMutableArray arrayWithArray:arr1];
    
}

- (void)createUI
{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0,320 , 568)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"Cell_test" bundle:nil] forCellReuseIdentifier:cellIdentifier];
    [self.view addSubview:self.tableView];
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    NSLog(@"%d",self.dataArr.count);
    return self.dataArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Cell_test * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
//    cell.textLabel.text = [self.dataArr objectAtIndex:indexPath.row
//                           ];
    cell.titleLabel.text = [self.dataArr objectAtIndex:indexPath.row
                            ];
//    NSString * str = [self.dataArr objectAtIndex:indexPath.row
//                      ];
//    NSLog(@"%@",str);
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat i = [tableView fd_heightForCellWithIdentifier:cellIdentifier configuration:^(Cell_test * cell) {
        cell.titleLabel.text = [self.dataArr objectAtIndex:indexPath.row];
    }];
    NSLog(@"%f",i);

    return i;
}
@end
