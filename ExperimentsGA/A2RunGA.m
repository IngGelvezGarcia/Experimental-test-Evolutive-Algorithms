clc
clear all
close all

%%%%% Set of experiments for GA algorithm %%%%%

% Number of dimensions 
dims = 10;

% Main loop: Type of test function
for CasoF =1:8

    % Test functions
    TestFunctions;

    % Search space bounds
    bounds = [-RangeO/2*ones(dims,1),RangeO/2*ones(dims,1)];

    % Loop for GA algorithm configuration
    for Confi = 1:2

        % Case for GA configuration:
        switch Confi
            case 1
            % Case 1:
            PopSize = 50;
            CrossProb = 0.6;
            MutateProb = 0.001;
            case 2
            % Case 2:
            PopSize = 30;
            CrossProb = 0.9;
            MutateProb = 0.01;
            otherwise
            % Case 3:
            PopSize = 40;
            CrossProb = 0.9
            MutateProb = 0.1;
        end

        % Algorithm configuration and parameters
        parametros = OptionsGA('tolerance',1e-10,'popSize',PopSize,'generationsNum',2000,'crossProb',CrossProb,'mutateProb',MutateProb,'ShowIter',0);       
        
        % Tag for file
        fname = ['M2GA',num2str(Confi),'Fobj',num2str(CasoF)];

        % Data collection
        for ni = 1:50
        %disp(['Run: ',num2str(ni)]);

        %Run GA
        tic
        [x,fmin]=GAalg(FunObj,bounds,parametros);        
        tn = toc;

        % Data storage
        DatK(ni) = 2000;
        DatF(ni) = fmin;
        DatP(ni,:) = x;
        DatT(ni) = tn;
        
        % Store variables in a file
        save(fname,'DatK','DatF','DatP','DatT');
        end
    end
end

