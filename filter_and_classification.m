% Characters (vector 256, 1) are directly provided to the classification 
% system

% Input: Character 16x16 (in 256x1 vector)  -  P(256,1)
% Output: 10 output classes representing the numbers from 1 to 9 and 0  -   A(10,1)

% Associaive Memory 1st layer: 
% - One single layer with 256 inputs
% - Linear activation
% - Without bias

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

function filter_and_classification()
    
     % Load required data
    load('PerfectArial.mat');
    load('data/P_600.mat'); % train + validation
    P = P_600;
    
    % Supervised Learning, so the corresponding outputs are required to
    % train the network
    % Generate target outputs (the numbers are numerated in the input P)
    col = size(P,2); 
    T = zeros(10, col);
    for i = 0 : col - 1
        T(mod(i, 10) + 1, i + 1) = 1;
    end

    act_functions = {'Hardlim' 'Linear' 'Sigmoidal' };
    
    % Network architecture properties
    net = perceptron;
    
    net.numInputs = 1; % Number of vectors that receives as input
    net.numLayers = 2;
    net.inputs{1}.size = 256; % Size of the input of the NN
    net.layers{1}.size = 256; % Number of neurons in the layer
    net.layers{2}.size = 10;
    
    % First layer properties - Associative Memory
    %   - Perfect is a matrix 256x10 -> to 256x256
    %   - P (input matrix) is 256x500 
    T_Perfect = repmat(Perfect, 1, col/10);
    W = T_Perfect * pinv(P); % W - 256x256
    net.IW{1,1} = W;
    
    net.biasConnect(i) = 0; % No bias
    
    
    % Second layer properties - Classifier
    W = rand(10,256); 
    b = rand(10,1);
    net.IW{2,1} = W; % Set random weights
    net.b{2,1} = b; % Set random bias
    
    net.layers{2}.transferFcn = 'purelin' % Activation Function
    
    
    % Sub-object properties
    
    
    % Training properties
    net.performParam.lr = 0.5 % learning rate
    net.trainParam.epochs = 1000 % Maximum epochs
    net.trainParam.show = 35
    net.trainParam.Fcn = 'sse'
    
    net.divideParam.trainRatio = 85/100
    net.divideParam.valRatio = 15/100
    
    % net.trainFcn = 'trainml'
    net.trainFcn = 'traingd'

    % Visualize Network
    view(net)
    
    % Train the Neural Network
    %net = train(net,P,T)
    
    % Access Weights and Bias
    % W = bet.IW{1,1}
    % b = net.b{1,1}

    % Test the Neural Network 
    a = sim(net, PT)
    
    
    
end