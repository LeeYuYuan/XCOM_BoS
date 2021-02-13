%% create the XCOM point in the graph
subject = ('Gait_0001_3');
subjfile = [(subject),'.mat'];
load(subjfile);

R_data = load(subject);
name = Gait_0001_3;


Position = XCOM;
% store COP datat
FP1_data = name.Force(1).COP;
FP2_data = name.Force(2).COP;
FP3_data = name.Force(3).COP;
FP4_data = name.Force(4).COP;
FP5_data = name.Force(5).COP;
FP6_data = name.Force(6).COP;

% store force data
FP1_data_Force = name.Force(1).Force;
FP2_data_Force = name.Force(2).Force;
FP3_data_Force = name.Force(3).Force;
FP4_data_Force = name.Force(4).Force;
FP5_data_Force = name.Force(5).Force;
FP6_data_Force = name.Force(6).Force;


data_len = length(FP1_data);
FP = zeros(6, data_len);

% corresponding time
frq = length(FP1_data) / length(name.Trajectories.Labeled.Data(26,1,:));
time = data_len / frq;

[ICr1, TOr1, ICr2 , TOr2, ICr3, ICl1 , TOl1, ICl2, TOl2, FRONT, BACK] = Split_gait(name, frq);
%figure(1), clf

%plot position of XCOM
loc = [ Position(1,186), Position(2,186)];
ploth = plot(loc(1), loc(2), 'ko', 'markersize',5, 'markerfacecolor', 'b');

%hold on
%plot(XCOM(1,:), XCOM(2,:))
%hold on
%% plot boundary 

path = name.Trajectories.Labeled.Labels;

RDM1 = find(strcmp( path, 'RDM1'));
RDM5 = find(strcmp( path, 'RDM5'));
RDH = find(strcmp( path, 'RDH'));
RMCAL = find(strcmp( path, 'RMCAL'));
RCAL1 = find(strcmp( path, 'RCAL1'));
RLCAL = find(strcmp( path, 'RLCAL'));

LDM1 = find(strcmp( path, 'LDM1'));
LDM5 = find(strcmp( path, 'LDM5'));
LDH = find(strcmp( path, 'LDH'));
LMCAL = find(strcmp( path, 'LMCAL'));
LCAL1 = find(strcmp( path, 'LCAL1'));
LLCAL = find(strcmp( path, 'LLCAL'));

RDM1_data = name.Trajectories.Labeled.Data(RDM1,1:3,:);
RDM5_data = name.Trajectories.Labeled.Data(RDM5,1:3,:);
RDH_data = name.Trajectories.Labeled.Data(RDH,1:3,:);
RMCAL_data = name.Trajectories.Labeled.Data(RMCAL,1:3,:);
RCAL1_data = name.Trajectories.Labeled.Data(RCAL1,1:3,:);
RLCAL_data = name.Trajectories.Labeled.Data(RLCAL,1:3,:);

LDM1_data = name.Trajectories.Labeled.Data(LDM1,1:3,:);
LDM5_data = name.Trajectories.Labeled.Data(LDM5,1:3,:);
LDH_data = name.Trajectories.Labeled.Data(LDH,1:3,:);
LMCAL_data = name.Trajectories.Labeled.Data(LMCAL,1:3,:);
LCAL1_data = name.Trajectories.Labeled.Data(LCAL1,1:3,:);
LLCAL_data = name.Trajectories.Labeled.Data(LLCAL,1:3,:);

RDM1_data = reshape(RDM1_data, [3, time]) / 1000;
RDM5_data = reshape(RDM5_data, [3, time]) / 1000;
RDH_data = reshape(RDH_data, [3, time])/ 1000;
RMCAL_data = reshape(RMCAL_data, [3, time])/ 1000;
RCAL1_data = reshape(RCAL1_data, [3, time])/ 1000;
RLCAL_data = reshape(RLCAL_data, [3, time])/ 1000;

LDM1_data = reshape(LDM1_data, [3, time]) / 1000;
LDM5_data = reshape(LDM5_data, [3, time]) / 1000;
LDH_data = reshape(LDH_data, [3, time])/ 1000;
LMCAL_data = reshape(LMCAL_data, [3, time])/ 1000;
LCAL1_data = reshape(LCAL1_data, [3, time])/ 1000;
LLCAL_data = reshape(LLCAL_data, [3, time])/ 1000;

% plot area of base of support
%plot( [RDM5_data(1,186) RDH_data(1,186)], [RDM5_data(2,186) RDH_data(2,186)], 'k')
%hold on
%plot( [RDH_data(1,186) RMCAL_data(1,186)], [RDH_data(2,186) RMCAL_data(2,186)], 'k')
%plot( [RMCAL_data(1,186), RCAL1_data(1,186)], [RMCAL_data(2,186), RCAL1_data(2,186)], 'k')
%plot( [RCAL1_data(1,186),RLCAL_data(1,186) ], [RCAL1_data(2,186), RLCAL_data(2,186)], 'k')
%plot( [RLCAL_data(1,186),RDM5_data(1,186) ], [RLCAL_data(2,186), RDM5_data(2,186)], 'k')


%% animation
count = 0;
%distance = zeros(time);

while count <= ICl2  
    
    
    count = count +1;

    loc(1) = Position(1,count);
    loc(2) = Position(2,count);
    
    
    
    set(ploth, 'XData', loc(1), 'YData', loc(2))
    hold on
    pause(0.05)
    
    
    if ICr1+2 <= count && count <= ICl1-1
        plot( [RDM5_data(1,count) RDH_data(1,count)], [RDM5_data(2,count) RDH_data(2,count)], 'k')
        hold on
        plot( [RDH_data(1,count) RMCAL_data(1,count)], [RDH_data(2,count) RMCAL_data(2,count)], 'k')
        plot( [RMCAL_data(1,count), RCAL1_data(1,count)], [RMCAL_data(2,count), RCAL1_data(2,count)], 'k')
        plot( [RCAL1_data(1,count),RLCAL_data(1,count) ], [RCAL1_data(2,count), RLCAL_data(2,count)], 'k')
        plot( [RLCAL_data(1,count),RDM5_data(1,count) ], [RLCAL_data(2,count), RDM5_data(2,count)], 'k')
        centro = [((RDM5_data(1,count) + RDH_data(1,count) + RMCAL_data(1,count) + RCAL1_data(1,count) + RLCAL_data(1,count))/5), ((RDM5_data(1,count) + RDH_data(2,count) + RMCAL_data(2,count) + RCAL1_data(2,count) + RLCAL_data(2,count))/5)];
        position = [Position(count), Position(count)];
        distance(count) = sqrt((centro(1,1) - position(1,1))^2 + (centro(1,2) - position(1,2))^2);
    end
    
    if ICl1 <= count && count <= TOr1
        plot( [LMCAL_data(1,count) LLCAL_data(1,count)], [LMCAL_data(2,count) LLCAL_data(2,count)], 'k')
        hold on
        plot( [LLCAL_data(1,count) RDM1_data(1,count)], [LLCAL_data(2,count) RDM1_data(2,count)], 'k')
        plot( [RDM1_data(1,count), RDM5_data(1,count)], [RDM1_data(2,count), RDM5_data(2,count)], 'k')
        plot( [RDM5_data(1,count),LMCAL_data(1,count) ], [RDM5_data(2,count), LMCAL_data(2,count)], 'k')
        
        centro = [((LMCAL_data(1,count) + LLCAL_data(1,count) + RDM1_data(1,count) + RDM5_data(1,count))/4), ((LMCAL_data(2,count) + LLCAL_data(2,count) + RDM1_data(2,count) + RDM5_data(2,count))/4)];
        position = [Position(count), Position(count)];
        distance(count) = sqrt((centro(1,1) - position(1,1))^2 + (centro(1,2) - position(1,2))^2);
    end
    
    if TOr1+1 <= count && count <= ICr2-1
        plot( [LDM5_data(1,count) LDH_data(1,count)], [LDM5_data(2,count) LDH_data(2,count)], 'k')
        hold on
        plot( [LDH_data(1,count) LMCAL_data(1,count)], [LDH_data(2,count) LMCAL_data(2,count)], 'k')
        plot( [LMCAL_data(1,count), LCAL1_data(1,count)], [LMCAL_data(2,count), LCAL1_data(2,count)], 'k')
        plot( [LCAL1_data(1,count),LLCAL_data(1,count) ], [LCAL1_data(2,count), LLCAL_data(2,count)], 'k')
        plot( [LLCAL_data(1,count),LDM5_data(1,count) ], [LLCAL_data(2,count), LDM5_data(2,count)], 'k')
        
        centro = [((LDM5_data(1,count) + LDH_data(1,count) + LMCAL_data(1,count) + LCAL1_data(1,count) + LLCAL_data(1,count))/5), ((LDM5_data(1,count) + LDH_data(2,count) + LMCAL_data(2,count) + LCAL1_data(2,count) + LLCAL_data(2,count))/5)];
        position = [Position(count), Position(count)];
        distance(count) = sqrt((centro(1,1) - position(1,1))^2 + (centro(1,2) - position(1,2))^2);
    end
    
    if ICr2 <= count && count <= TOl1
                plot( [LMCAL_data(1,count) LLCAL_data(1,count)], [LMCAL_data(2,count) LLCAL_data(2,count)], 'k')
        hold on
        plot( [LLCAL_data(1,count) RDM1_data(1,count)], [LLCAL_data(2,count) RDM1_data(2,count)], 'k')
        plot( [RDM1_data(1,count), RDM5_data(1,count)], [RDM1_data(2,count), RDM5_data(2,count)], 'k')
        plot( [RDM5_data(1,count),LMCAL_data(1,count) ], [RDM5_data(2,count), LMCAL_data(2,count)], 'k')
        
        centro = [((LMCAL_data(1,count) + LLCAL_data(1,count) + RDM1_data(1,count) + RDM5_data(1,count))/4), ((LMCAL_data(2,count) + LLCAL_data(2,count) + RDM1_data(2,count) + RDM5_data(2,count))/4)];
        position = [Position(count), Position(count)];
        distance(count) = sqrt((centro(1,1) - position(1,1))^2 + (centro(1,2) - position(1,2))^2);

    end
    
    if TOl1+1 <= count && count <= ICl2
        plot( [RDM5_data(1,count) RDH_data(1,count)], [RDM5_data(2,count) RDH_data(2,count)], 'k')
        hold on
        plot( [RDH_data(1,count) RMCAL_data(1,count)], [RDH_data(2,count) RMCAL_data(2,count)], 'k')
        plot( [RMCAL_data(1,count), RCAL1_data(1,count)], [RMCAL_data(2,count), RCAL1_data(2,count)], 'k')
        plot( [RCAL1_data(1,count),RLCAL_data(1,count) ], [RCAL1_data(2,count), RLCAL_data(2,count)], 'k')
        plot( [RLCAL_data(1,count),RDM5_data(1,count) ], [RLCAL_data(2,count), RDM5_data(2,count)], 'k')
        
        centro = [((RDM5_data(1,count) + RDH_data(1,count) + RMCAL_data(1,count) + RCAL1_data(1,count) + RLCAL_data(1,count))/5), ((RDM5_data(1,count) + RDH_data(2,count) + RMCAL_data(2,count) + RCAL1_data(2,count) + RLCAL_data(2,count))/5)];
        position = [Position(count), Position(count)];
        distance(count) = sqrt((centro(1,1) - position(1,1))^2 + (centro(1,2) - position(1,2))^2);
    end
    
    pbaspect([6 3.5 1])
    

    
    %for i = count
    %    F(i) = getframe(figure(1));
    %end
    
end

distance = distance(ICr1+2:end) * 10; %unit is centermeter
%video = VideoWriter('test.avi', 'Uncompressed AVI');
%open(video)
%writeVideo(video, F);
%close(video)