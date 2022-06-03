clear
clc
whos addpath()
load emgfs1KT3CH1.mat

dt = .001;
timeSpan = 3;
N=timeSpan/dt;
t = 0:dt:timeSpan-dt;

emg = emg(t<3);



frameTimeSpan = .160;
frameLength = frameTimeSpan/dt;
numFrames = floor(N/frameLength);

emgFrames = reshape(emg(1:numFrames * frameLength), numFrames, frameLength);

figure(1)
subplot(2,1,1), plot(t, emg)
xlabel('Time (sec)')
ylabel('Amplitude (Volts)')
%%
subplot(2,1,2), plot(t(t<frameTimeSpan), emgFrames(1,:), t(t<frameTimeSpan), emg(t<frameTimeSpan))
xlabel('Time (sec)')
ylabel('Amplitude (Volts)')
%%
%part2
load emgData.mat
clf
data_x = emg.reps; % this pulls the number of reps
channel = data_x(2); % this pulling the second rep
channel_data = channel.data;
channel1 = channel_data(:,1);
channel2 = channel_data(:,2);
channel3 = channel_data(:,3);
channel4 = channel_data(:,4);
channel5 = channel_data(:,5);
channel6 = channel_data(:,6);
channel7 = channel_data(:,7);
channel8 = channel_data(:,8);

channel1 = channel1(t<3);
channel2 = channel2(t<3);
channel3 = channel3(t<3);
channel4 = channel4(t<3);
channel5 = channel5(t<3);
channel6 = channel6(t<3);
channel7 = channel7(t<3);
channel8 = channel8(t<3);

plot(t, channel1)
xlabel('Time (sec)')
ylabel('Amplitude (Volts)')

WL = getWL(channel1);
SSC = getSSC(channel1);
ZC = getZC(channel1);
MAV = getMAV(channel1);

%%
%part4
cellArrayReps={};

for i = 1:length(data_x)
    repsData = data_x(i).data;
    featureVectorsMain = getFeatures(repsData, frameLength, numFrames);
    cellArrayFeatureVector{i}=featureVectorsMain;
end

concatDataFeatures = vertcat(cellArrayFeatureVector{1}, cellArrayFeatureVector{2},cellArrayFeatureVector{3},cellArrayFeatureVector{4});

%%
%part 7
%Ran into some problems here in the code, kept getting no matches for the
%countNum which compares the testing exmples to the training examples
[trainingExamples, testingExamples] = setUpExamples(concatDataFeatures, 25);

knnModel = fitcknn(trainingExamples.vectors, trainingExamples.labels,'NumNeighbors',15);
[LABEL,POSTERIOR, COST] = predict(knnModel, trainingExamples.vectors);
countNum = 0;
for i =1:length(LABEL)
    if testingExamples.labels == LABEL(i)
        countNum = countNum + 1;
    end
end

disp(countNum)

%%
%part 8



%%
%part5
function [featureVectors] = getFeatures(reps, frameLength, numFrames)
    repsFrames = reshape(reps(1:numFrames * frameLength),frameLength , numFrames);
    featureVectors = zeros(numFrames,4);
    for i = 1:numFrames
        colVec = repsFrames(:,i);
        f1 = getWL(colVec);
        f2 = getSSC(colVec);
        f3 = getZC(colVec);
        f4 = getMAV(colVec);
        featureVectors(i,:) = [f1, f2, f3, f4];
    end
end


%%
%part 6
%input r as 20 for 20%
function [trainingExamples, testingExamples] = setUpExamples(emg, R)   
    [numrows, numcols] = size(emg);
    dataLables = [1:1:numrows];
    trainingLables = sort(randsample(dataLables,round(numrows*(R/100))));
    trainingVector = zeros(length(trainingLables),4);
    for k = 1:length(trainingLables)
        trainingVector(k,:) = emg(k,:);
    end
    testingVector = zeros(numrows-length(trainingLables),4);
    testingLablesZeros = zeros(numrows,1);
    for a = 1:numrows
       if trainingLables~=a
           testingVector(a,:) = emg(a,:);
           testingLablesZeros(a) = a;
       end
    end
    testingLales = nonzeros(testingLablesZeros);
    trainingExamples.vectors = trainingVector;
    trainingExamples.labels = trainingLables;
    
    testingExamples.vectors = testingVector;
    testingExamples.labels = testingLales;
    testingExamples.dataLables = dataLables;
end






