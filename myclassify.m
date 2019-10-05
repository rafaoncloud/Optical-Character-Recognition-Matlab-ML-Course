function output = myclassify(data, filled_inx)

    alternatives = {'Filter+Clf: Hardlim (Binary)', ...
        'Filter+Clf: Linear', ...
        'Filter+Clf: Sigmoidal', ...
        'Clf: Hardlim', ...
        'Clf: Linear', ...
        'Clf: Sigmoidal', }
    
    %trained_nn = input('\n---Neural Networks---\n\nFilter + Classifier:\n1- Hardlim\n2- Purelin\n3- Logsig\n\nOnly Classifier:\n4- Hardlim\n5- Purelin\n6- Logsig\n\n>'); 
    [indx,tf] = listdlg('ListString',alternatives, ...
        'SelectionMode','single', ...
        'PromptString',{'Select the Neural Network','to predict the numbers:'});
    
    if indx == 1
        load('trained_nn/hardlimFilterClf.mat');
        net = hardlimFilterClf;
        
    elseif indx == 2
        load('trained_nn/purelinFilterClf.mat');
        net = purelinFilterClf;
        
    elseif indx == 3
        load('trained_nn/logsigFilterClf.mat');
        net = logsigFilterClf;
        
    elseif indx == 4
        load('trained_nn/hardlimClf.mat');
        net = hardlimClf;
        
    elseif indx == 5
        load('trained_nn/purelinClf.mat');
        net = purelinClf;
        
    elseif indx == 6
        load('trained_nn/logsigClf.mat');
        net = logsigClf;
    end 
    
outputs = net(data);
[row, col] = max(outputs)

output = int64(col(filled_inx))

end

