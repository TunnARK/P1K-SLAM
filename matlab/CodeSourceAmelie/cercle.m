
function h = cercle(centre,rayon,couleur)
n = 1000;
t = linspace(0,2*pi,n);
x = centre(1) + rayon*sin(t);
y = centre(2) + rayon*cos(t);

h = patch(x,y,couleur,'edgecolor','none','facealpha',.2);
end