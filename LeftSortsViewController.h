#import <UIKit/UIKit.h>
#import "LeftItemBaseVC.h"
@protocol PushLeftItemDelegete <NSObject>

//当前界面传送选择的视图项A，然后在视图管理器(LeftSlideViewController)中的closeLeftView方法中，让主界面弹出左边界面的选项视图A
-(void)pushLeftItemVC:(LeftItemBaseVC *)leftItemVC;
@end

@interface LeftSortsViewController : UIViewController
@property (nonatomic,strong) UITableView *tableview;

@property (nonatomic,weak)id <PushLeftItemDelegete> delegate;

@end
