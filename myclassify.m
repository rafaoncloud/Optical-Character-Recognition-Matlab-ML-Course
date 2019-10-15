function network = myclassify(data, filled)
    
    architecture = menu('Neural Network Architecture:','Associative Memory + Classifier', 'Classifier Only');
    act_fun_option = menu('Type of Activation Function: ', 'Binary', 'Linear', 'Sigmoidal');
    dataSet = menu('Training Data size : ', '500','750')
    validate = menu ('Validation of the data : ', 'Valid', 'Not-Valid');
    if(architecture == 1)
        if(act_fun_option == 1)
            
            if(dataSet == 1) 
                if(validate == 1)load('hardLimA1D1V1.mat');
                elseif(validate == 2)load('hardLimA1D1V2.mat');
                end
            else 
                if(validate == 1)load('hardLimA1D2V1.mat');
                elseif(validate == 2)load('hardLimA1D2V2.mat');
                end     
            end
            
        elseif(act_fun_option == 2)
            
            if(dataSet == 1) 
                if(validate == 1)load('pureLinA1D1V1.mat');
                elseif(validate == 2)load('pureLinA1D1V2.mat');
                end 
            else 
                if(validate == 1)load('pureLinA1D2V1.mat');
                elseif(validate == 2)load('pureLinA1D2V2.mat');
                end 
            end
            
        else
            if(dataSet == 1)
                if(validate == 1)load('logSigA1D1V1.mat');
                elseif(validate == 2)load('logSigA1D1V2.mat');
                end 
            else 
                if(validate == 1)load('logSigA1D2V1.mat');
                elseif(validate == 2)load('logSigA1D2V2.mat');
                end        
            end
            
        end
    else
        if(act_fun_option == 1)
                        
            if(dataSet == 1)
                if(validate == 1)load('hardLimA2D1V1.mat');
                elseif(validate == 2)load('hardLimA2D1V2.mat');
                end   
            else 
                if(validate == 1)load('hardLimA2D2V1.mat');
                elseif(validate == 2)load('hardLimA2D2V2.mat');
                end   
            end
            
        elseif(act_fun_option == 2)
                        
            if(dataSet == 1)
                if(validate == 1)load('pureLinA2D1V1.mat');
                elseif(validate == 2)load('pureLinA2D1V2.mat');
                end 
            else 
                if(validate == 1)load('pureLinA2D2V1.mat');
                elseif(validate == 2)load('pureLinA2D2V2.mat');
                end 
            end
            
        else
                        
            if(dataSet == 1) 
                if(validate == 1)load('logSigA2D1V1.mat');
                elseif(validate == 2)load('logSigA2D1V2.mat');
                end 
            else 
                if(validate == 1)load('logSigA2D2V2.mat');
                elseif(validate == 2)load('logSigA2D2V2.mat');
                end 
            end
            
        end
    end
    
results=net(data);

[x,y]=max(results);
network=int64(y(filled));


        
end
        

        
    
    
    
        
    
    
    
    
    
    
    
    