#import "LeftSortsViewController.h"
#import "AppDelegate.h"
#import "LoginViewController.h"
#import "LeftItemBaseVC.h"
#define LFScreenWidth self.view.bounds.size.width
@interface LeftSortsViewController () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)NSArray *itemVCArr;

@end

@implementation LeftSortsViewController

-(NSArray *)itemVCArr{
    if (!_itemVCArr) {
        _itemVCArr = [[NSArray alloc]init];
    }
    return  _itemVCArr;
}

- (void)viewDidLoad{
    
    [super viewDidLoad];
    //创建侧滑中的选项对应的视图数据
    [self preparItemVCData];
    
//    //添加背景图
//    UIImageView *imageview = [[UIImageView alloc] initWithFrame:self.view.bounds];
//    imageview.image = [UIImage imageNamed:@"leftbackiamge"];
//    [self.view addSubview:imageview];
    
    UIView * topContaintView =  [[UIView alloc] initWithFrame:CGRectMake(0, 0, LFScreenWidth,120)];
    [self.view addSubview:topContaintView];
    topContaintView.backgroundColor = [UIColor colorWithRed:0 green:186/255.0 blue:215/255.0 alpha:1];
    
    UIImageView *imageViewIcon =  [[UIImageView alloc]initWithImage:[UIImage imageNamed:@""]];
    imageViewIcon.backgroundColor = [UIColor redColor];
    imageViewIcon.frame = CGRectMake(10, 20, 50, 50);
    [topContaintView addSubview:imageViewIcon];
    
    UILabel * labelApp = [[UILabel alloc]initWithFrame:CGRectMake(60 , 20, 80, 20)];
    labelApp.text = @"校源";
    labelApp.textColor = [UIColor greenColor];
    
    [topContaintView addSubview:labelApp];
    UILabel * labelSchool = [[UILabel alloc]initWithFrame:CGRectMake(20, 70, 70, 20)];
    labelSchool.text = @"成都工业学院";
    labelSchool.textColor = [UIColor greenColor];
    [topContaintView addSubview:labelSchool];
    
    
    CGFloat tableY = [DeviceHelper versionIphone4:100 Iphone5:120 Iphone6:130 Iphone6p:140];
    CGFloat tableH = [DeviceHelper versionIphone4:250 Iphone5:260 Iphone6:270 Iphone6p:280];
    UITableView *tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, tableY,LFScreenWidth ,tableH) style:UITableViewStyleGrouped];
    
    tableview.dataSource = self;
    tableview.delegate  = self;
    tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableview = tableview;
    
    [self.view addSubview:tableview];
}

-(void)preparItemVCData{
    NSString *itemVCPath = [[NSBundle mainBundle]pathForResource:@"LeftItemVCPlist" ofType:@"plist"];
    self.itemVCArr = [FactoryOfClass createClassByPlistPath:itemVCPath];   
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{    
    return self.itemVCArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *Identifier = @"Identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.font = [UIFont systemFontOfSize:20.0f];
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor blackColor];
    cell.textLabel.text = self.itemVCArr[indexPath.row][@"title"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate.leftSlideVC closeLeftView];//关闭左侧抽屉
    LeftItemBaseVC *baseVC = [self.itemVCArr objectAtIndex:indexPath.row][@"className"];
    if([_delegate respondsToSelector:@selector(pushLeftItemVC:)]){
        [_delegate pushLeftItemVC:baseVC];
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 180;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableview.bounds.size.width, 180)];
    view.backgroundColor = [UIColor clearColor];
    return view;
}
@end
