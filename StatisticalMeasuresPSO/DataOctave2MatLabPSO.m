% Script to convert the data obtained in Octave to Matlab format
% Case of PSO algorithm

close all
clear all

% Algorithm on machine M1
for CasoFobj = 1:8;
for CasoParm = 1 : 2;
fnameR = ['M1','PSO',num2str(CasoParm),'Fobj',num2str(CasoFobj)];
load(fnameR);
fnameW = ['DataM1PSO',num2str(CasoParm),'Fobj',num2str(CasoFobj),'.mat'];
save('-mat7-binary',fnameW,'DatK','DatF','DatP','DatT');
end
end


% Algorithm on machine M2
for CasoFobj = 1:8;
for CasoParm = 1 : 2;
fnameR = ['M2','PSO',num2str(CasoParm),'Fobj',num2str(CasoFobj)];
load(fnameR);
fnameW = ['DataM2PSO',num2str(CasoParm),'Fobj',num2str(CasoFobj),'.mat'];
save('-mat7-binary',fnameW,'DatK','DatF','DatP','DatT');
end
end
