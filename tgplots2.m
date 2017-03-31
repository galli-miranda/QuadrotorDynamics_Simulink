%Código para gerar os Plots do TG XYZ
%Primeiramente, deve-se rodar os 3 arquivos de simulink para carregar as
%variáveis.
%% Settling time 
M{1} = XYZ_Strategy1_S;
M{2} = XYZ_Strategy1_C;
M{3} = XYZ_Strategy2;
M{4} = XYZ_Strategy2_C;
for k = 1:4
    
T = M{k}(:,4)<5.02 & M{k}(:,4)>4.98; %Within 2% error
T = T(500:end);

St=find(T,1,'first');
St_max(k) = St; %worst Settling time of the 3 vars
end

%% Plots
figure
subplot(411)

hold all   
title('Mathematical Approach - Simplified Model')
axis([0 25 -2 6])
for i = 2:4
    plot(XYZ_Strategy1_S(:,1),XYZ_Strategy1_S(:,i))
end
plot(XYZ_Strategy1_S(St_max(1),1),XYZ_Strategy1_S(St_max(1),4),'r*')

legend('X','Y','Z','Settling Time')
subplot(412)
hold all   
title('Mathematical Approach - Complete Model')
axis([0 25 -2 6])
for i =2:4
plot(XYZ_Strategy1_C(:,1),XYZ_Strategy1_C(:,i))
end
plot(XYZ_Strategy1_C(St_max(2),1),XYZ_Strategy1_C(St_max(2),4),'r*')
legend('X','Y','Z','Settling Time')

%-----------------------------------------------------  
subplot(413)
hold all
title('Add/Subtract Logic Simplified Model')
axis([0 25 -2 6])
for i = 2:4
    plot(XYZ_Strategy2(:,1),XYZ_Strategy2(:,i))
end
plot(XYZ_Strategy2(St_max(3),1),XYZ_Strategy2(St_max(3),4),'r*')
legend('X','Y','Z','Settling Time')

subplot(414)
hold all
title('Add/Subtract Logic Complete Model')
axis([0 25 -2 6])
for i = 2:4
    plot(XYZ_Strategy2_C(:,1),XYZ_Strategy2_C(:,i))
end
plot(XYZ_Strategy2_C(St_max(4),1),XYZ_Strategy2_C(St_max(4),4),'r*')
legend('X','Y','Z','Settling Time')
