% Rulett szimuláció

% Előkészítés
clear;
clc;

% Paraméterek
money = 1; % Pénzösszeg
p_red = 18/38; % A piros színre való fogadás valószínűsége
num_spins = 1000; % Pörgetések száma

% Rulett szimuláció
results = randsample({'red','black'}, num_spins, true, [p_red, 1-p_red]);

% Pénzösszeg változása az idő függvényében
money_vec = cumsum(2*money*(strcmp(results,'red')-0.5));

% Normális eloszlás illesztése
mu = mean(money_vec);
sigma = std(money_vec);
x = -100:0.1:100;
y = normpdf(x,mu,sigma);

% Ábra
figure;
histogram(money_vec,50,'Normalization','pdf');
hold on;
plot(x,y,'r','LineWidth',2);
plot([mu mu], [0 max(y)], 'g--','LineWidth',2);
xlabel('Pénzösszeg');
ylabel('Relatív gyakoriság');
title('Rulett szimuláció');

% Ábrázolás
hold off;
