subNum = 32;
trialNum = 40;
channelNum = 40;
fs = 128;
trialTime = 63; 
trialL = fs*trialTime;

for subNo=1:subNum
    %norm_data = zeros(trialNum,signalL);
    if subNo<10
        filePath = strcat('D:\Arjun\BCI PROJECT\Emotion\deap-pre-mat\s0',num2str(subNo),'.mat');
    else
        filePath = strcat('D:\Arjun\BCI PROJECT\Emotion\deap-pre-mat\s',num2str(subNo),'.mat');
    end
    datFile = load(filePath);
    subData = datFile.data;
    reshape_subData = zeros(channelNum, trialNum*trialL);
    for channelNo = 1:channelNum
        for trialNo = 1:trialNum
            ch_tr_signal = subData(trialNo,channelNo,:);
            reshape_subData(channelNo,(trialNo-1)*trialL+1:trialNo*trialL)=ch_tr_signal;
        end
    end
    
    zscore_data = zscore(reshape_subData');
    
    %?????data????
    fileName = strcat('D:\Arjun\BCI PROJECT\z_score_norm\sub',num2str(subNo));
    save(fileName,'zscore_data','-v7.3');
    disp(strcat('ends!subject ',num2str(subNo)));
end