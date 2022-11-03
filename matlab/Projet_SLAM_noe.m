% Matrice contenant les position (X,Y) de chaque amer
Lm=[3, 5, 7, 9, 3, 5, 7, 9 ; 4, 4, 4, 4, 2, 2, 2, 2]

% Affichage de la carte
for k = 1 : length(Lm)
    figure(1)
    %scatter(Lm(1,k),Lm(2,k))
    rectangle('Position',[Lm(1,k) Lm(2,k) 0.25 0.25],'Curvature',0.2,'FaceColor', [0.01 0.01 0.01])
    title("Affichage de l environement a explorer")
    axis equal
    xlim([0 12])
    ylim([0 6])   
    hold on
    grid on
end

w=-pi/4; % Angle de rotation
deltaT=0.05; % Echelle de temps
X=1; % Deplacement d une unite
Source1Vue=zeros(1,25);%25 c'est N
Source2Vue=zeros(1,25);


% Matrice de passage homegene pour les rotations autour de l axe Z 
Fr =[cos(w*deltaT) ,-sin(w*deltaT) , 0 1; sin(w*deltaT) cos(w*deltaT), 0 -1; 0 , 0, 1, 0; 0,0,0,1 ]
Fr2 =[cos(w*deltaT) ,-sin(w*deltaT) , 0, -1; sin(w*deltaT) cos(w*deltaT), 0, -1; 0, 0, 1, 0; 0,0,0,1 ] 

Ft=[eye(3); zeros(1,3)]; 
Ft=[Ft,[X;zeros(2,1);1]] % Matrice de passage homegene pour une translation sur x
Ft2=[eye(3); zeros(1,3)];
Ft2=[Ft2,[-X;zeros(2,1);1]]% Matrice de passage homegene pour le retour en translation sur x

Xreel(:,1)=[3;5;0;1] % Initialisation

% Deplacement en ligne droite
for k=2:7
    Xreel(:,k)=Ft*Xreel(:,k-1);    
end;


% Rotations
k=8;
Xreel(:,k)=Fr*Xreel(:,k-1);    
k=9;
Xreel(:,k)=Fr2*Xreel(:,k-1);    

% Retour en ligne droite
for k=10:16
    Xreel(:,k)=Ft2*Xreel(:,k-1); 
end


% Affichage de la trajectoire
for k = 1:length(Xreel)-1
    hold on
    plot(Xreel(1,max(k-2,1):k),Xreel(2,max(k-2,1):k),'->b');
    %plot(Xreel(1,k),Xreel(2,k),'->b');
    hold on
    vision = rectangle('Position',[(Xreel(1,k)-1.25) (Xreel(2,k)-1.25) 2.5 2.5],'Curvature',0.2)
    hold off
    %plot(Xreel(1,max(k-1,1):k),Xreel(2,max(k-1,1):k),'o','markeredgecolor','none','markerfacecolor','black');
    drawnow
    pause(deltaT)
end

hold off

Xrobt=[3;5;0] % Etat initial du robot

% Matrice de commande pour effectuer le mouvement en U autour des amers
Uk=[1 1 1 1 1 1 1 0 0 -1 -1 -1 -1 -1 -1;
    0 0 0 0 0 0 0 -1 -1 0 0 0 0 0 0;
    0 0 0 0 0 0 0 -w -w 0 0 0 0 0 0];
 %end
 