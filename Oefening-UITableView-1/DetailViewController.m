//
//  DetailViewController.m
//  Oefening-UITableView-1
//
//  Created by Jean Smits on 20/08/15.
//  Copyright (c) 2015 EASI. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *homeTeamImage;
@property (weak, nonatomic) IBOutlet UIImageView *awayTeamimage;
@property (weak, nonatomic) IBOutlet UILabel *homeTeamName;
@property (weak, nonatomic) IBOutlet UILabel *awayTeamName;
@property (weak, nonatomic) IBOutlet UILabel *awayTeamScore;
@property (weak, nonatomic) IBOutlet UILabel *homeTeamScore;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createContent:self.match];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void) createContent:(Match *)match{
    self.homeTeamName.text = match.homeTeamName;
    self.awayTeamName.text = match.visitingTeamName;
    if (match.status == MatchStatusPlayed) {
        self.homeTeamScore.text = [NSString stringWithFormat:@"%lu", match.homeTeamScore];
        self.awayTeamScore.text = [NSString stringWithFormat:@"%lu", match.visitingTeamScore];
    }else{
        self.awayTeamScore.text = @"";
        self.homeTeamScore.text = @"";
    }
    self.homeTeamImage.image = [UIImage imageNamed:match.homeTeamImageName];
    self.awayTeamimage.image = [UIImage imageNamed:match.visitingTeamImageName];
    
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
