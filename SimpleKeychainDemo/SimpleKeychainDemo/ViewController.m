//
//  ViewController.m
//  SimpleKeychainDemo
//
//  Created by gener on 17/3/9.
//  Copyright © 2017年 Light. All rights reserved.
//

#import "ViewController.h"
#import "SimpleKeychain.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameTF;

@end

static NSString * usernameKey = @"username";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

}

- (IBAction)writeAction:(id)sender {
    
  BOOL _b =  [SimpleKeychain setObject:_usernameTF.text forKey:usernameKey];
    
    UIAlertController * vc = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleAlert];
    [vc addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
    
    if (_b) {
        vc.title = @"success";
        self.usernameTF.text = @"";
    }
    else
    {
    vc.title = @"error";
    }
    
    [self presentViewController:vc animated:YES completion:nil];
}

- (IBAction)readAction:(id)sender {
    
    NSString * str= [SimpleKeychain objectForKey:usernameKey];
    
    UIAlertController * vc = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleAlert];
    [vc addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
    
    vc.title = [NSString stringWithFormat:@"read result  :%@",str?str:@"NOT FOUND"];
    self.usernameTF.text = str;

    [self presentViewController:vc animated:YES completion:nil];
}


@end
