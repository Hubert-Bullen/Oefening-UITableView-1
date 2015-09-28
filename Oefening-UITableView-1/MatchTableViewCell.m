//
//  MatchTableViewCell.m
//  Oefening-UITableView-1
//
//  Created by Jean Smits on 19/08/15.
//  Copyright (c) 2015 EASI. All rights reserved.
//

#import "MatchTableViewCell.h"

@interface MatchTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *homeTeam;
@property (weak, nonatomic) IBOutlet UILabel *awayTeam;
@property (weak, nonatomic) IBOutlet UILabel *score;


@end

@implementation MatchTableViewCell



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) createCells:(Match *)match{
    self.homeTeam.text = match.homeTeamName;
    self.awayTeam.text = match.visitingTeamName;
    if (match.status == MatchStatusPlayed) {
        self.score.text = [NSString stringWithFormat:@"%lu - %lu", match.homeTeamScore, match.visitingTeamScore];
    }else{
        self.score.text = @"";
    }
    
   
}


@end
