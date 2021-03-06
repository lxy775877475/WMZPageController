


//
//  HomeVC.m
//  WMZPageController
//
//  Created by wmz on 2019/10/10.
//  Copyright © 2019 wmz. All rights reserved.
//

#import "HomeVC.h"
#import "WMZPageController.h"
#import "Base.h"
@interface HomeVC ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *ta;
@property(nonatomic,strong)NSArray *taData;
@property(nonatomic,strong)NSArray *titleData;
@property(nonatomic,strong)NSArray *VCData;
@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UITableView *ta = [[UITableView alloc]initWithFrame:CGRectMake(0, PageVCNavBarHeight, self.view.frame.size.width,self.view.frame.size.height-PageVCNavBarHeight) style:UITableViewStyleGrouped];
    [self.view addSubview:ta];
    ta.estimatedRowHeight = 0.01;
    ta.estimatedSectionFooterHeight = 0.01;
    ta.estimatedSectionHeaderHeight = 0.01;
    ta.dataSource = self;
    ta.delegate = self;
    self.ta = ta;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.taData.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return self.titleData[section];
}

- (UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.taData[section] count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = self.taData[indexPath.section][indexPath.row];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Base *obj = (Base*)[NSClassFromString(self.VCData[indexPath.section]) new];
    [obj pushWithVC:self withIndex:indexPath.row];
}

- (NSArray *)taData{
    if (!_taData) {
        _taData = @[
        @[@"链式语法展示所有属性"],
        @[@"普通标题",@"换行标题",@"带红点普通标题",@"富文本标题",@"图文标题(图上文下)",@"图文标题(图左文右),标题在底部",
          @"导航栏标题",@"居中标题",@"固定最右边标题",@"固定最右边图片+标题",@"固定宽度标题"],
        @[@"无样式",@"下划线不跟随移动",@"下划线跟随移动",@"字体变大",@"圆点+跟随滑动+颜色渐变",@"背景框"],
        @[@"爱奇艺",@"优酷",@"拼多多",@"今日头条",@"微博",@"京东",@"简书",@"悬浮效果",@"适配暗黑模式"],
        ];
    }
    return _taData;
}

- (NSArray *)titleData{
    if (!_titleData) {
        _titleData = @[@"完整手动管理控制器生命周期",@"标题样式",@"指示器样式",@"实际使用"];
    }
    return _titleData;
}

- (NSArray *)VCData{
    if (!_VCData) {
        _VCData = @[@"AllPropertiesVC",@"TitleVC",@"IndicatorVC",@"UseVC"];
    }
    return _VCData;
}
@end
