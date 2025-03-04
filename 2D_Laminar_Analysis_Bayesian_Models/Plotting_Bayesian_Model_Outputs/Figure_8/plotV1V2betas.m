
% import data from sorted csv file
betasReadArea

layers = unique(layer); % this no longer works by iteslf because R lost alpha/beta
% subdiv of 4c
areas = unique(area);
num_layers = length(layers);


%find V1 data
idxV1 = find(area==areas(1));
posteriorV1 = reshape(value(idxV1),[],num_layers);

%find V2 data
idxV2 = find(area==areas(2));
posteriorV2 = reshape(value(idxV2),[],num_layers); 

colors1 = [0.7 0.7 0.7]; % v2
colors2 = [0.35 0.35 0.35];%  v1

set(0, 'DefaultAxesFontName', 'Arial');
figure
% NOTE edited violin so that quartiles(1) and (5) give 95% CI, can turn of
% with 'ShowNotches', false

vs = violinplot(posteriorV1, num_layers,'ViolinColor', colors2,'MarkerSize', 6, 'EdgeColor', [0 0 0], 'BoxColor', [0.75 0.75 0.75], 'MedianColor', [0.75 0.75 0.75], 'QuartileStyle', 'shadow',"HalfViolin", "left");
yticks([0 1 2])
xticks([1:6])
xticklabels({'1', '2', '3', '4/4C', '5', '6'});
hold on
vt = violinplot(posteriorV2, num_layers, 'ViolinColor', colors1, 'MarkerSize', 6, 'EdgeColor', [0.25 0.25 0.25], 'BoxColor', [0.25 0.25 0.25], 'MedianColor', [0.25 0.25 0.25],'QuartileStyle', 'shadow', "HalfViolin", "right");
hold off


