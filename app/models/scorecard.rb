# TODO: Added routes and migrations. probably scrap them. figure out a good way to track user score.

each @scorecard.holes.all do |hole|
  @scorecard.total_score += hole.score
end
