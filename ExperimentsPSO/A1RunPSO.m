clc
clear all
close all

%%%%% Set of experiments for PSO algorithm %%%%%

% Number of dimensions 
dims = 10;

% Main loop: Type of test function
for CasoF =1:8

    % Test functions
    TestFunctions;

    % Search space bounds
    bounds = [-RangeO/2*ones(dims,1),RangeO/2*ones(dims,1)];

    % Loop for PSO algorithm configuration
    for Confi = 1:2
        % Case for PSO configuration:
        switch Confi
            case 1
            % Case 1: Trelea model 1
            chi = 1;
            w = 0.600;
            c1 = 1.700;
            c2 = 1.700;
            case 2
            % Case 2: Trelea model 2
            chi = 1;
            w = 0.729;
            c1 = 1.494;
            c2 = 1.494;
            otherwise
            % Case 3: Clerc Type 1 - with constriction
            chi = 0.72984;
            w = 1;
            c1 = 2.05;
            c2 = 2.05;
        end

        % Algorithm configuration and parameters
        parametros = OptionsPSO('num',30,'chi',chi,'w',w,'c1',c1,'c2',c2,'MaxIter',2000,'ShowIter',0);
        
        % Tag for file
        fname = ['M1PSO',num2str(Confi),'Fobj',num2str(CasoF)];

        % Data collection
        for ni = 1:50
        %disp(['Run: ',num2str(ni)]);

        % Run PSO
        tic
        [x,fmin,gen]=PSOalg(FunObj,bounds,parametros);
        tn = toc;

        % Data storage
        DatK(ni) = gen;
        DatF(ni) = fmin;
        DatP(ni,:) = x;
        DatT(ni) = tn;
        
        % Store variables in a file
        save(fname,'DatK','DatF','DatP','DatT');
        end
    end
end
