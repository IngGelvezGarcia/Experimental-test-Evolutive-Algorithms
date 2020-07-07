% Script to show the experiment results

close all
clear all
clc

% Load Octave statistics package
pkg load statistics

% Tag for the tests
CasoIdParm = {'GA-C1-M1','GA-C2-M1','GA-C1-M2','GA-C2-M2'};

% Loop for objective function
for CasoFobj = 1:8;
    
    % Loop for machine
    Indice = 1;
    for CasoMaqui = 1 : 2;  
        
        % Loop for algorithm configuration
        for CasoParm = 1 : 2;
            Dato = ['Data','M',num2str(CasoMaqui),'GA',num2str(CasoParm),'Fobj',num2str(CasoFobj)];
            load(Dato);
            DatFv(:,Indice) = DatF';
            DatTv(:,Indice) = DatT';
            Indice = Indice + 1;
        end
    end
    
    % Measurements for objective function
    disp([' '])
    disp(['Measurements for objective function'])
    disp(['f',num2str(CasoFobj),'  DE-C1-M1  DE-C2-M1  DE-C1-M2  DE-C2-M2'])
    disp(['Max  ',num2str(max(DatFv(:,1)),5),'  ',num2str(max(DatFv(:,2)),5),'  ',num2str(max(DatFv(:,3)),5),'  ',num2str(max(DatFv(:,4)),5)]);
    disp(['Min  ',num2str(min(DatFv(:,1)),5),'  ',num2str(min(DatFv(:,2)),5),'  ',num2str(min(DatFv(:,3)),5),'  ',num2str(min(DatFv(:,4)),5)]);
    disp(['Mean ',num2str(mean(DatFv(:,1)),5),'  ',num2str(mean(DatFv(:,2)),5),'  ',num2str(mean(DatFv(:,3)),5),'  ',num2str(mean(DatFv(:,4)),5)]);
    disp(['STD  ',num2str(std(DatFv(:,1)),5),'  ',num2str(std(DatFv(:,2)),5),'  ',num2str(std(DatFv(:,3)),5),'  ',num2str(std(DatFv(:,4)),5)]);

    % Measurements for iterations
    disp(' ')
    disp(['Measurements for processing time'])
    disp(['f',num2str(CasoFobj),'  DE-C1-M1  DE-C2-M1  DE-C1-M2  DE-C2-M2'])
    disp(['Max  ',num2str(max(DatTv(:,1)),5),'  ',num2str(max(DatTv(:,2)),5),'  ',num2str(max(DatTv(:,3)),5),'  ',num2str(max(DatTv(:,4)),5)]);
    disp(['Mín  ',num2str(min(DatTv(:,1)),5),'  ',num2str(min(DatTv(:,2)),5),'  ',num2str(min(DatTv(:,3)),5),'  ',num2str(min(DatTv(:,4)),5)]);
    disp(['Mean ',num2str(mean(DatTv(:,1)),5),'  ',num2str(mean(DatTv(:,2)),5),'  ',num2str(mean(DatTv(:,3)),5),'  ',num2str(mean(DatTv(:,4)),5)]);
    disp(['STD  ',num2str(std(DatTv(:,1)),5),'  ',num2str(std(DatTv(:,2)),5),'  ',num2str(std(DatTv(:,3)),5),'  ',num2str(std(DatTv(:,4)),5)]);

    % Box plot
    figure
    boxplot(DatFv);
    set(gca (), "xtick", [1 2 3 4], "xticklabel", {'DE-C1-M1','DE-C2-M1','DE-C1-M2','DE-C2-M2'});
    ylabel('Values','FontSize',14,'LineWidth',1.0,'FontName','Times New Roman');
    title(['f',num2str(CasoFobj)],'FontSize',14,'LineWidth',1.0,'FontName','Times New Roman')
    set(gca,'FontSize',14,'LineWidth',1.0,'FontName','Times New Roman');

    figure
    boxplot(DatTv);
    set(gca (), "xtick", [1 2 3 4], "xticklabel", {'DE-C1-M1','DE-C2-M1','DE-C1-M2','DE-C2-M2'});
    ylabel('Time','FontSize',14,'LineWidth',1.0,'FontName','Times New Roman');
    title(['f',num2str(CasoFobj)],'FontSize',14,'LineWidth',1.0,'FontName','Times New Roman')
    set(gca,'FontSize',14,'LineWidth',1.0,'FontName','Times New Roman');

end
