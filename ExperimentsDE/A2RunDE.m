clc
clear all
close all

%%%%% Set of experiments for DE algorithm %%%%%

% Number of dimensions 
dims = 10;

% Main loop: Type of test function
for CasoF =1:8

    % Test functions
    TestFunctions;

    % Search space bounds
    bounds = [-RangeO/2*ones(dims,1),RangeO/2*ones(dims,1)];

    % Loop for DE algorithm configuration
    for Confi = 1:2

        % Case for DE configuration:
        switch Confi
            case 1
            % Case 1:
            PopSize = 48;
            CrossProb = 0.9784;
            Fweight = 0.6876;
            case 2
            % Case 2:
            PopSize = 20;
            CrossProb = 1;
            Fweight = 0.85;
            otherwise
            % Case 3:
            PopSize = 20;
            CrossProb = 0.95;
            Fweight = 0.8;
        end

        % Algorithm configuration and parameters       
        parametros = OptionsDE('I_NP',PopSize,'F_CR',CrossProb,'F_weight',Fweight,'I_itermax',2000','I_strategy',1,'I_refresh',10,'ShowIter',0);
        
        % Tag for file
        fname = ['M2DE',num2str(Confi),'Fobj',num2str(CasoF)];

        % Data collection
        for ni = 1:50
        %disp(['Run: ',num2str(ni)]);

        % Run DE
        tic
        [x,fmin,Iter] = DEalg(FunObj,bounds,parametros) ;       
        tn = toc;

        % Data storage
        DatK(ni) = Iter;
        DatF(ni) = fmin;
        DatP(ni,:) = x;
        DatT(ni) = tn;
        
        % Store variables in a file
        save(fname,'DatK','DatF','DatP','DatT');
        end
    end
end
