
load '_Lecture_1_Homework_Data.mat'
splitval = 4;

%disp(data(1,2:3));
ManipCondition = [];
ControlCondition = [];

%Check/Organize Condition Groups into seperate Matrices
for i = 1:size(data)
    if strcmp(data{i, 1}, 'Manipulation')
        ManipCondition = [ManipCondition; data{i, 2:3}]; 
    else 
        ControlCondition = [ControlCondition; data{i , 2:3}]; % concat rows vertically
    end
end

% Organize Manipulation Condition Values
SortedManip_Ate = sort(ManipCondition(:, 1));
SortedManip_Drank = sort(ManipCondition(:,2));
% Organize Control Condition Values
SortedContr_Ate = sort(ControlCondition(:,1));
SortedContr_Drank = sort(ControlCondition(:, 2));

%Cellary Salad
AteDrank_Manip = {SortedManip_Ate, SortedManip_Drank};
AteDrank_Control = {SortedContr_Ate, SortedContr_Drank};

%Find Median
Manip_MedianVal = median(AteDrank_Manip{1});
Control_MedianVal = median(AteDrank_Control{1});



% %Initialize meanDrinking Matrix
meanDrinking = cell(2,2);
meanDrinking{1,1} = []; % For the first condition
meanDrinking{1,2} = []; % For the second condition
meanDrinking{2,1} = []; % For the third condition
meanDrinking{2,2} = []; % For the fourth condition


for i = 1:size(AteDrank_Control{1})
    if AteDrank_Control{1}(i) < Control_MedianVal
        meanDrinking{1,1} = [meanDrinking{1,1}; AteDrank_Control{2}(i)];
    else
        meanDrinking{1,2} = [meanDrinking{1,2}; AteDrank_Control{2}(i)];
    end 
end


for i = 1:size(AteDrank_Manip{1})
    if AteDrank_Manip{1}(i) < Manip_MedianVal
        meanDrinking{2,1} = [meanDrinking{2,1}; AteDrank_Manip{2}(i)];
    else 
        meanDrinking{2,2} = [meanDrinking{2,2}; AteDrank_Control{2}(i)];
    end
end

%bloop


