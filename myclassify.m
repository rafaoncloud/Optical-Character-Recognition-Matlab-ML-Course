function output = myclassify(data, filled_inx)

    trained_nn = input('\n---Neural Networks---\n\nFilter + Classifier:\n1- Hardlim\n2- Purelin\n3- Logsig\n\nOnly Classifier:\n4- Hardlim\n5- Purelin\n6- Logsig\n\n>'); 

    if trained_nn == 1
        load('hardlimFilterClf.mat');
    elseif trained_nn == 2
        load('purelinFilterClf.mat');
    elseif trained_nn == 3
        load('logsigFilterClf.mat');
    elseif trained_nn == 4
        load('logsigClf.mat');
    elseif trained_nn == 5
        load('logsigClf.mat');
    elseif trained_nn == 6
        load('logsigClf.mat');
   
outputs = net(data);
[row, col] = max(outputs)


output = int64(col(filled_inx))

end

