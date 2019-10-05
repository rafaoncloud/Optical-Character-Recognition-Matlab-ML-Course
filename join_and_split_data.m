function join_and_split_data()
  training_set()
  validation_set()
  testing_set() 
end

% 500 instances for training
function training_set()
    
    % Load first 50 characters
    load('data/P.mat')
    P_training_set = P
    clear P 
    
    % Load and concatenate the remaining characters 
    for i = 1:9
        VAR = ['P' int2str(i)]
        path = ['data/' VAR '.mat'];
        
        P = load(path,VAR)
        P = P.(VAR)
        
        P_training_set = [P_training_set P]
    end
    
    % Save then 500 characters in a single file
    save_path = 'data/P_training_set'
    save(save_path, 'P_training_set')
    
end 

% 150 instances for validation
function validation_set()

    % Load first 50 characters
    load('data/P10.mat')
    P_validation_set = P10
    clear P10
    
    % Load and concatenate the remaining characters 
    for i = 11:12
        VAR = ['P' int2str(i)]
        path = ['data/' VAR '.mat'];
        
        P = load(path,VAR)
        P = P.(VAR)
        
        P_validation_set = [P_validation_set P]
    end
    
    % Save then 500 characters in a single file
    save_path = 'data/P_validation_set'
    save(save_path, 'P_validation_set')
    
end

% 150 instances for testing
function testing_set()

    % Load first 50 characters
    load('data/P13.mat')
    P_testing_set = P13
    clear P13
    
    % Load and concatenate the remaining characters 
    for i = 14:15
        VAR = ['P' int2str(i)]
        path = ['data/' VAR '.mat'];
        
        P = load(path,VAR)
        P = P.(VAR)
        
        P_testing_set = [P_testing_set P]
    end
    
    % Save then 500 characters in a single file
    save_path = 'data/P_testing_set'
    save(save_path, 'P_testing_set')

end