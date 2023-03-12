clear;
clc;

money = 1;
p_red = 18/38;
num_spins = 1000;

results = randsample({'red','black'}, num_spins, true, [p_red, 1-p_red]);

money_vec = cumsum(2*money*(strcmp(results,'red')-0.5));

mu = mean(money_vec);
sigma = std(money_vec);

x = -100:0.1:100;
y = normpdf(x,mu,sigma);

figure;
histogram(money_vec,50,'Normalization','pdf');
hold on;
plot(x,y,'r','LineWidth',2);
plot([mu mu], [0 max(y)], 'g--','LineWidth',2);
xlabel('Amount');
ylabel('Relative frequency');
title('Roulette simulation');

hold off;

median_money = median(money_vec);
mad_money = mad(money_vec, 1);
variance_money = var(money_vec);
mean_money = mean(money_vec);

disp(['Median: ' num2str(median_money)]);
disp(['Median absolute deviation: ' num2str(mad_money)]);
disp(['Variance: ' num2str(variance_money)]);
disp(['Mean: ' num2str(mean_money)]);
