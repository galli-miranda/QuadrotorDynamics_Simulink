%Código para gerar os Plots do TG
%Primeiramente, deve-se rodar os 3 arquivos de simulink para carregar as
%variáveis.
%% Settling time 
M{1} = Euler_Strategy1_S;
M{2} = Euler_Strategy1_C;
M{3} = Euler_Strategy2;
M{4} = Euler_Strategy2_C;
for k = 1:4
    
T = M{k}<.2 & M{k}>-.2; %Within 2% error
for i =2:4
St(i)=find(T(:,i),1,'first');
end
St_max(k) = max(St); %worst Settling time of the 3 vars
end

%% Plots
figure
subplot(411)

hold all   
title('Mathematical Approach - Simplified Model')
axis([0 6 -25 25])
for i = 2:4
    plot(Euler_Strategy1_S(:,1),Euler_Strategy1_S(:,i))
end
plot(Euler_Strategy1_S(St_max(1),1),Euler_Strategy1_S(St_max,3),'r*')

legend('Roll','Pitch','Yaw','Settling Time')
subplot(412)
hold all   
title('Mathematical Approach - Complete Model')
axis([0 6 -25 25])
for i =2:4
plot(Euler_Strategy1_C(:,1),Euler_Strategy1_C(:,i))
end
plot(Euler_Strategy1_C(St_max(2),1),Euler_Strategy1_C(St_max,3),'r*')
legend('Roll','Pitch','Yaw','Settling Time')

%-----------------------------------------------------  
subplot(413)
hold all
title('Add/Subtract Logic Simplified Model')
axis([0 6 -25 25])
for i = 2:4
    plot(Euler_Strategy2(:,1),Euler_Strategy2(:,i))
end
plot(Euler_Strategy2(St_max(3),1),Euler_Strategy2(St_max,3),'r*')
legend('Roll','Pitch','Yaw','Settling Time')

subplot(414)
hold all
title('Add/Subtract Logic Complete Model')
axis([0 6 -25 25])
for i = 2:4
    plot(Euler_Strategy2_C(:,1),Euler_Strategy2_C(:,i))
end
plot(Euler_Strategy2_C(St_max(4),1),Euler_Strategy2_C(St_max,3),'r*')
legend('Roll','Pitch','Yaw','Settling Time')
