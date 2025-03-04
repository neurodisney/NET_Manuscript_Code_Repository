% import data from V1alphas.csv file, columns C & D, row 2 to end
alphasRead

sections = unique(section);
num_animals = 3;

posteriorSection = reshape(alphas,[],length(sections));

% hard code separating NET and DBH data
posteriorNET = NaN(7000,9);
posteriorDBH = NaN(7000,5);

posteriorNET(:,1:3) = posteriorSection(:,2:4);
posteriorNET(:,4:6) = posteriorSection(:,6:8);
posteriorNET(:,7:9) = posteriorSection(:,12:14);

posteriorDBH(:,1) = posteriorSection(:,1);
posteriorDBH(:,2) = posteriorSection(:,5);
posteriorDBH(:,3:5) = posteriorSection(:,9:11);

%get overall animal
%posteriorAnimal = reshape(alphas,[],3);

%get animal x NET

posteriorNETxAnimal = reshape(posteriorNET,[],num_animals);

animals = ["A7", "A8", "A9"];

colors1 = [0.7 0.7 0.7]; %DBH
colors2 = [0.35 0.35 0.35]; %NET

NETsections = ["A7.1", "A7.2", "A7.3","A8.1", "A8.2", "A8.3", "A9.1", "A9.2", "A9.3"];
DBHsections = ["A7.1", "A8.1", "A9.1", "A9.2", "A9.3"];
   
figure
vs = violinplot(posteriorNETxAnimal, animals, 'ViolinColor', [0 0 0],'MarkerSize', 6, 'EdgeColor', [0.25 0.25 0.25], 'BoxColor', [0.25 0.25 0.25], 'QuartileStyle', 'shadow');
yticks([0 1.5 3])

