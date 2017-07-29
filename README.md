# CMLToastView

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

CMLToastView is available through [cocoaoods](git@192.168.250.71:ios/cocoapods.git). To install
it, simply add the following line to your Podfile:

```ruby
source 'git@github.com:caomeili/CMLrepos.git'
// 引入framework  默认为framework 
pod "CMLToastView" 或 pod 'CMLToastView/CoreFramework'
// 引入源代码
pod 'CMLToastView/Core'
```

## Author

caomeili, caoml@ushareit.com

## Directions for use

#### 使用方法

1. 基本使用


```
E.g:
import <CMLToastView/ToastSupport.h>
第一种使用：
...
@property (nonatomic, strong) ToastSupport *toast;
...
self.toast = [[ToastSupportFactory sharedInstance] createLoading];
[self.toast show];
第二种使用：
[[[ToastSupportFactory sharedInstance] createLoading] showInTime:2.0];
第三种使用：
[[[ToastSupportFactory sharedInstance] createLoading] showWithDuration:   TOAST_DURATION_SHORT];
```

2. 自定义CMLToastView

```   
E.g:
import <CMLToastView/ToastSupport.h>
...
UIView *aView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) - 100)];
aView.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.5];
[[[ToastSupportFactory sharedInstance] createLoadingWithCustomView:aView] showInTime:3.0];
```
3. 统一替换CMLToastView

```
E.g:
import <CMLToastView/ToastSupport.h>
import "FLLoadingView.h"
...
[ToastSupportFactory setCustomViewWithClassName:[FLLoadingView class]];
```



[详细使用方法说明](https://caomeili.github.io/2017/06/21/Toast-使用说明/)

