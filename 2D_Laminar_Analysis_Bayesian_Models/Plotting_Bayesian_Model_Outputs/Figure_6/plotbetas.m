%%%
%%% USE THIS FOR 5 MODEL VERSION OF STAN CODE THAT LOSES TRACK OF 4C
%%% ALPHA/BETA
%%%

% import data from V1betasSort.csv file, columns B,C D, row 2 to end
betasRead


layers = unique(layer); % this no longer works by iteslf because R lost alpha/beta
% subdiv of 4c
proteins = unique(protein);
%num_layers = length(layers); % also doesn't work
num_layers = 9;

%find DBH data
idxDBH = find(protein==proteins(1));
posteriorDBH = value(idxDBH); 

% find 4c and split into alpha and beta
layerDBH = layer(idxDBH);
idx4c = find(layerDBH==layers(6));
idxalpha = idx4c(mod(idx4c,2)~=0);
idxbeta = idx4c(mod(idx4c,2)==0);
alpha = posteriorDBH(idxalpha);
beta = posteriorDBH(idxbeta);

%reshape posterior into layer columns
usePosteriorDBH = reshape(posteriorDBH,[],9); 

%fix layer 4c
usePosteriorDBH(:,6)=alpha;
usePosteriorDBH(:,7)=beta;

%find NET data
idxNET = find(protein==proteins(2));
posteriorNET = value(idxNET); 

% find 4c and split into alpha and beta
layerNET = layer(idxNET);
idx4c = find(layerNET==layers(6));
idxalpha = idx4c(mod(idx4c,2)~=0);
idxbeta = idx4c(mod(idx4c,2)==0);
alpha = posteriorNET(idxalpha);
beta = posteriorNET(idxbeta);

%reshape posterior into layer columns
usePosteriorNET = reshape(posteriorNET,[],9); 

%fix layer 4c
usePosteriorNET(:,6)=alpha;
usePosteriorNET(:,7)=beta;

colors1 = [0.7 0.7 0.7]; % DBH
colors2 = [0.35 0.35 0.35];%  NET

set(0, 'DefaultAxesFontName', 'Arial');
figure
% NOTE edited violin so that quartiles(1) and (5) give 95% CI, can turn of
% with 'ShowNotches', false

vs = violinplot(usePosteriorDBH, 9,'ViolinColor', colors1,'MarkerSize', 6, 'EdgeColor', [0 0 0], 'BoxColor', [0.75 0.75 0.75], 'MedianColor', [0.75 0.75 0.75], 'QuartileStyle', 'shadow',"HalfViolin", "left");
xticks([1:9])
yticks([0 5 10])
ax = gca;
ax.TickLabelInterpreter = 'latex';
xticklabels({'1', '2', '3', '4A', '4B','$4C\alpha$','$4C\beta$','5', '6'});
set(gca, 'TickLabelInterpreter', 'latex');
hold on
vt = violinplot(usePosteriorNET, 9, 'ViolinColor', colors2, 'MarkerSize', 6, 'EdgeColor', [0.25 0.25 0.25], 'BoxColor', [0.25 0.25 0.25], 'MedianColor', [0.25 0.25 0.25],'QuartileStyle', 'shadow', "HalfViolin", "right");
hold off


