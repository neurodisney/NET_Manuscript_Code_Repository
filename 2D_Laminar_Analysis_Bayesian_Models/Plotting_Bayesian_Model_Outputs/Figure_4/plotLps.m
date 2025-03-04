% import data from sorted lps.csv file, columns B,C row 2 to end

models = unique(model); 
num_models = length(models);

useLps = reshape(lp, [], num_models);

set(0, 'DefaultAxesFontName', 'Arial');
colors = [0.7 0.7 0.7]; 
figure

vt = violinplot(useLps, models, 'ViolinColor', colors, 'MarkerSize', 6, 'EdgeColor', [0.25 0.25 0.25], 'BoxColor', [0.25 0.25 0.25], 'MedianColor', [0.25 0.25 0.25],'QuartileStyle', 'shadow', 'ShowNotches', false);
xticks([1:5])
yticks([-780:40:-560])
xticklabels({'Model 1', 'Model 2', 'Model 3', 'Model 4', 'Model 5'});
