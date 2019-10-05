net = hardlimFilterClf; % Trained NN
load('trained_nn/tr_hardlimFilterClf','tr') % Training Record as tr

% Predict with test set
outputs = net(P_testing_set);

% Considered ordered output {0 1 2 3 4 5 6 7 9 0} create outputs for the
% test set
col = size(P_testing_set,2);
T = zeros(10, col);
for i = 0 : col - 1
    T(mod(i, 10) + 1, i + 1) = 1;
end

% Compute performance
performance = perform(net,T,outputs);
fprintf('Performance: %d\n', performance);

% View the network diagram.
view(net);

% Plot the training, validation, and test performance.
figure, plotperform(tr);

% Plot the confusion matrix
figure, plotconfusion(T,outputs);


