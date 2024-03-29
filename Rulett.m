clear;
clc;

bet = 1;
p_red = 18/38;
num_spins = 10000;
always_red = false;

if always_red
    results = repmat({'red'}, num_spins, 1);
else
    results = randsample({'red','black'}, num_spins, true, [p_red, 1-p_red]);
end

money_vec = cumsum(2*bet*(strcmp(results,'red')-0.5));

num_spins_zero_green = 10000;

if always_red
    results_zero_green = repmat({'red'}, num_spins_zero_green, 1);
else
    results_zero_green = randsample({'red','black','green'}, num_spins_zero_green, true, [p_red, 1-p_red, 1/38]);
end

money_vec_zero_green = cumsum(2*bet*(strcmp(results_zero_green,'red')-0.5));

mu = mean(money_vec);
sigma = std(money_vec);

x = mu-5*sigma:0.1:mu+5*sigma;
y = normpdf(x,mu,sigma);

figure;
histogram(money_vec, 'Normalization', 'pdf');

hold on;
plot(x, y, 'r', 'LineWidth', 2);
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


median_money = median(money_vec);
mad_money = mad(money_vec, 1);
variance_money = var(money_vec);
std_money = std(money_vec);
mean_money = mean(money_vec);

text(20, 0.015, sprintf('Median: %.2f', median_money));
text(20, 0.03, sprintf('Median absolute deviation: %.2f', mad_money));
text(20, 0.025, sprintf('Variance: %.2f', variance_money));
text(20, 0.035, sprintf('STD: %.2f', std_money));
text(20, 0.02, sprintf('Mean: %.2f', mean_money));

figure;
hold on;
plot(money_vec, 'g', 'LineWidth', 2);
xlabel('Number of spins');
ylabel('Money');
title('Money over time');
hold off;
