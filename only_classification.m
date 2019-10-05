% Characters (vector 256, 1) are directly provided to the classification 
% system

% Input: Character 16x16 (in 256x1 vector)  -  P(256,1)
% Output: 10 output classes representing the numbers from 1 to 9 and 0  -   A(10,1)

% No pre-filtering of the data, classifier have a considerable generalization
% capability

% Recommendations: Use train or adapt only with train and validation sets.
% The validation sets prevent overfitting. Must use mpaper for testing set
% to allow to better understand whats going on. 

% Matrixes for training, validation and test were written in order
% (1,2,3,4,5,6,7,8,9,0)



function only_classification()

    % Load required data
    load('data/P_training_set.mat')
    P = P_training_set
    
    % Supervised Learning, so the corresponding outputs are required to
    % train the network
    % Generate target outputs (the numbers are numerated in the input P)
    col = size(P,2); 
    T = zeros(10, col);
    for i = 0 : col - 1
        T(mod(i, 10) + 1, i + 1) = 1;
    end
    
    
    act_functions = {'Hardlim' 'Linear' 'Sigmoidal' }
    
  
    % Single layer neural network
    % Network architecture properties
    net = perceptron 
    net = configure(net,P,T)
    
    net.numInputs = 256
    net.numLayers = 1
    %net.
    
    % Sub-object properties
    
    
    % Training properties
    net.trainParam.epochs = 1000 % Maximum epochs
    net.trainParam.show = 35;
    net.trainParam.Fcn = 'sse';

    % Train the Neural Network
    net = train(net,P,T)
    
    % Access Weights and Bias
    % W = bet.IW{1,1}
    % b = net.b{1,1}

    % Test the Neural Network 
    a = sim(net, PT)
    
end
