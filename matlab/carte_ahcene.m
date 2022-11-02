clc
close all
clear all


figure(1);
hold on;
Lm=[2 4 6 8 2 4 6 8;2 2 2 2 6 6 6 6] %la matrice des amers 
u0=[2;7];   % la position initial du robot à k=0
u=[1;0];    % evolution de l'instant k=0 jusqu'a k=7
u2=[1;-1]; % passage de k=7 à k=8 pour la diagonale
u3=[-2;-1]; % passage de k=8 à k=9 pour lantidiagonale
u4=[-1;1]
for k=1:length(Lm)% affichage des amers
    grid on;
    axis([0 15 0 10])% definir les dimensions de la fenetre daffichage
    plot(Lm(1,k),Lm(2,k),'ob')
    u1=u0;% la position initiale du robot
end
    for i=1:16
        if i<=7
            plot(u1(1,1),u1(2,1),'+r')% tracé de la trajectoire du robot de k=0 à k=7
            u1=u1+u;% evolution de la trajectoire 0-->7
        elseif i==8
            u1=u1+u2; % la trajectoire à k=8
            plot(u1(1,1),u1(2,1),'+r') % son tracé
        elseif i==9
            u1=u1+u3; % la trajectoire à k=9
            plot(u1(1,1),u1(2,1),'+r') % son tracé
        elseif (i>=9)&&(i<=15)
            u1=u1-u; % evolution de la trajectoire de 9-->15
            plot(u1(1,1),u1(2,1),'+r') % son tracé            
        else
            u1=u1+u4; % pour fermer la boucle 
            plot(u1(1,1),u1(2,1),'+r') % son tracé 
        end
    pause(1); 
    i=i+1;
    end