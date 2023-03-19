clear;
clc;

bet = 1;
p_red = 18/38;
num_spins = 1000;
always_red = false;

if always_red
    results = repmat({'red'}, num_spins, 1);
else
    results = randsample({'red','black'}, num_spins, true, [p_red, 1-p_red]);
end

money_vec = cumsum(2*bet*(strcmp(results,'red')-0.5));

num_spins_zero_green = 1000;

if always_red
    results_zero_green = repmat({'red'}, num_spins_zero_green, 1);
else
    results_zero_green = randsample({'red','black','green'}, num_spins_zero_green, true, [p_red, 1-p_red, 1/38]);
end

money_vec_zero_green = cumsum(2*bet*(strcmp(results_zero_green,'red')-0.5));

mu = mean(money_vec);
sigma = std(money_vec);

x = -100:0.1:100;
y = normpdf(x,mu,sigma);

figure;
histogram(money_vec,50,'Normalization','pdf');

hold on;
plot(x,y,'r','LineWidth',2);
plot([mu mu], [0 max(y)], 'g--','LineWidth',2);

mu_zero_green = mean(money_vec_zero_green);
sigma_zero_green = std(money_vec_zero_green);

y_zero_green = normpdf(x,mu_zero_green,sigma_zero_green);

plot(x,y_zero_green,'b','LineWidth',2);
plot([mu_zero_green mu_zero_green], [0 max(y_zero_green)], 'k--','LineWidth',2);

xlabel('Amount');
ylabel('Relative frequency');
title('Roulette simulation');
legend('Normal', 'Normal (0 green)', 'Location', 'NorthWest');
hold off;

disp('Results for normal game:');
disp(['Median: ' num2str(median(money_vec))]);
disp(['Median absolute deviation: ' num2str(mad(money_vec, 1))]);
disp(['Variance: ' num2str(var(money_vec))]);
disp(['Mean: ' num2str(mean(money_vec))]);

disp('Results for 0 green game:');
disp(['Median: ' num2str(median(money_vec_zero_green))]);
disp(['Median absolute deviation: ' num2str(mad(money_vec_zero_green, 1))]);
disp(['Variance: ' num2str(var(money_vec_zero_green))]);
disp(['Mean: ' num2str(mean(money_vec_zero_green))]);
