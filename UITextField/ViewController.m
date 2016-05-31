//
//  ViewController.m
//  UITextField
//
//  Created by Karma on 16/5/31.
//  Copyright © 2016年 陈昆涛. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>
@property (nonatomic,strong)UILabel *label;
@property (nonatomic,strong)UITextField *textField;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // UITextField创建以及常用属性
    _textField = [[UITextField alloc] initWithFrame:CGRectMake(50, 100, 100, 30)];
    _textField.placeholder=@"请输入文字";
    
    //    textField.layer.cornerRadius = 5;
    //    textField.layer.borderWidth = 1;
    _textField.borderStyle = UITextBorderStyleRoundedRect;

    _textField.textAlignment = NSTextAlignmentCenter;
    _textField.clearsOnBeginEditing = YES;
    _textField.delegate = self;
    [self.view addSubview:_textField];
    /*
     typedef NS_ENUM(NSInteger, UIReturnKeyType) {
     UIReturnKeyDefault,  // 默认 灰色按钮，标有Return
     UIReturnKeyGo,   //  标有Go的蓝色按钮
     UIReturnKeyGoogle, // 标有Google的蓝色按钮，用于搜索
     UIReturnKeyJoin,  // 标有Join的蓝色按钮
     UIReturnKeyNext,  // 标有Next的蓝色按钮
     UIReturnKeyRoute, // 标有Route的蓝色按钮
     UIReturnKeySearch, // 标有Search的蓝色按钮
     UIReturnKeySend, // 标有Send的蓝色按钮
     UIReturnKeyYahoo, // 标有Yahoo的蓝色按钮
     UIReturnKeyDone, // 标有Done的蓝色按钮
     UIReturnKeyEmergencyCall,  // 紧急呼叫按钮
     UIReturnKeyContinue // 标有Continue的蓝色按钮;
     */
      _textField.returnKeyType = UIReturnKeyDone;
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(50, 200, 200, 30)];
    
    [self.view addSubview:self.label];

}
//将要开始编辑，如果你return NO，那么就不允许编辑
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
        [_textField resignFirstResponder];
    [textField endEditing:YES];
    
    //    self.label.text = textField.text;
    
    return YES;
}
//编辑的时候替换对应范围的字符，return NO 则不替换
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
    NSLog(@"%@ %@ %lu", NSStringFromRange(range), string, range.location - range.length);
    if(range.location - range.length >=10)
    {
        self.label.text = @"字数超出限制";
        self.label.textColor = [UIColor redColor];
    }else
    {
        self.label.text = @"未超出限制";
        self.label.textColor = [UIColor greenColor];
    }
    
    
    return YES;
}
//当点击清除按钮的时候调用，返回NO则不响应清除按钮事件
- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    NSLog(@"dd");
    return YES;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_textField resignFirstResponder];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
