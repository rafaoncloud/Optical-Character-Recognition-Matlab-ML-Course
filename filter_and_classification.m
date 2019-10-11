% Characters (vector 256, 1) are directly provided to the classification 
% system

% Input: Character 16x16 (in 256x1 vector)  -  P(256,1)
% Output: 10 output classes representing the numbers from 1 to 9 and 0  -   A(10,1)

% Associaive Memory 1st layer: 
% - One single layer with 256 inputs
% - Linear activation
% - Without bias
% or
% Binary perceptron with 256 hardlim neurons, for this give the associative
% memory a target T of perfect characters. For train use trainc and learnp

% Classifier 2nd layer:
% - One single layer with 256 inputs 
% - Activation Function (linear or non-linear): 
%   - Hardlim
%   - Linear
%   - Sigmoidal
% With bias in each neuron
% Network parameters (weights and bias) should be evaluated using
%   - Perceptron rule: Hardlim
%   - Gradient method: Purelim and Logsig

% Purelim and logsig do not output 0 or 1 but a real number, requires
% post-processing or orther to obtain a binary classification 

% Matrixes for training, validation and test were written in order
% (1,2,3,4,5,6,7,8,9,0)

function filter_and_classification(act_func, epochs, filter)

    if ~exist('epochs','var')
     % third parameter does not exist, so default it to something
      epochs = 1000;
    end
    if ~exist('filter','var')
     % third parameter does not exist, so default it to something
      filter = true;
    end

    % Activation functions for the second layer
    act_funcs = {'Hardlim' 'Linear' 'Sigmoidal'};
    
    % Load required data
    load('PerfectArial.mat');
    load('data/P_650.mat'); % train + validation
    P = P_650;
    load('data/P_testing_set.mat');
    
    % Supervised Learning, so the corresponding outputs are required to
    % train the network
    % Generate target outputs (the numbers are numerated in the input P)
    col = size(P,2); 
    T = zeros(10, col);
    for i = 0 : col - 1
        T(mod(i, 10) + 1, i + 1) = 1;
    end
    
    % Perceptrons are simple single-layer binary classifiers, which divide
    % the input space with a linear decision boundary.
    net = perceptron('hardlim','learnp');
    %view(net)
    
    % First layer properties - Associative Memory
    %   - Perfect is a matrix 256x10 -> to 256x256
    %   - P (input matrix) is 256x500 
    if filter == true
        T_Perfect = repmat(Perfect, 1, col/10);
        W = T_Perfect * pinv(P); % W - 256x256
        P = W * P;
    end
    
    
    % Configure network inputs and outputs to best match input and target data
    net = configure(net,P,T);
    
    % Initialize weights and bias with random values
    W = rand(10,256);
    b = rand(10,1);
    net.IW{1,1}= W;
    net.b{1,1} = b;
    
    % Data spliting (train and validation)
    % Validation set prevents overfitting
    %net.divideFcn = 'dividerand';
    net.divideFcn = 'divideblock';
    net.divideParam.trainRatio = 85/100; 
    net.divideParam.valRatio = 15/100; 
    net.divideParam.testRatio = 0; 
    
    % Training parameters
    net.trainParam.epochs = epochs;
    
    
    
    
    if strcmpi(act_func,'hardlim')
    
        net.performParam.lr = 0.0001; 
        %net.trainFcn = 'trainc';
        net.performFcn = 'sse'; % Sum squared error
            
        % Train
        [hardlimFilterClf, tr] = train(net,P ,T);
        save('trained_nn/hardlimFilterClf','hardlimFilterClf');
        save('trained_nn/tr_hardlimFilterClf','tr');

        % Test
        %T_pred = sim(hardlimFilterClf, P_testing_set);
        
    elseif strcmpi(act_func,'linear')
    
        net.layers{1}.transferFcn = 'purelin';
        net.inputWeights{1}.learnFcn = 'learngd';       
        net.biases{1}.learnFcn = 'learngd'; 
        net.trainFcn = 'traingd';
        net.performFcn = 'mse';
        
        % Train
        [purelinFilterClf, tr] = train(net,P ,T);
        save('trained_nn/purelinFilterClf','purelinFilterClf');
        save('trained_nn/tr_purelinFilterClf','tr');
        
        % Test
        %T_pred = sim(purelinFilterClf, P_testing_set);
        
    elseif strcmpi(act_func,'sigmoidal')
        
        net.performParam.lr = 0.000001; 
        net.layers{1}.transferFcn = 'logsig';
        %net.inputWeights{1}.learnFcn = 'learngd';       
        %net.biases{1}.learnFcn = 'learngd'; 
        %net.trainFcn = 'traingd';
        net.performFcn = 'mse';
        
        % Train
        [logsigFilterClf, tr] = train(net,P ,T);
        save('trained_nn/logsigFilterClf','logsigFilterClf');
        save('trained_nn/tr_logsigFilterClf','tr');
        
        % Test
        %T_pred = sim(logsigFilterClff, P_testing_set);
        
    end
    
end