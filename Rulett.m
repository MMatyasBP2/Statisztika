num_simulations = 100;
num_spins = 100;
bet_amount = 10;
bet_on_red = true;

money = zeros(num_simulations, num_spins);
money(:,1) = 1000;

for i = 1:num_simulations
    for j = 2:num_spins
        if bet_on_red
            bet_color = 'Red';
        else
            bet_color = 'Black';
        end
        money(i,j) = money(i,j-1) - bet_amount;
        
        result = roulette_spin();
        if strcmpi(result.Color, bet_color)
            money(i,j) = money(i,j) + bet_amount * 2;
        end
    end
end

figure;
plot(1:num_spins, mean(money));
xlabel('Pörgetések száma');
ylabel('Átlagos pénzösszeg');
title(['Átlagos pénzösszeg a(z) ' num2str(num_simulations) ' szimuláció után']);

function result = roulette_spin()
    numbers = 0:36;
    colors = {'Red', 'Black'};
    probabilities = [18/37 18/37 18/37 18/37 18/37 18/37 18/37 18/37 18/37 18/37 18/37 18/37 18/37 18/37 18/37 18/37 18/37 18/37 18/37 18/37 18/37 18/37 18/37 18/37 18/37 18/37 18/37 18/37 2/37];
    result.Number = randsample(numbers, 1, true, probabilities);
    if result.Number == 0
        result.Color = 'Green';
    elseif mod(result.Number, 2) == 0
        result.Color = colors{2};
    else
        result.Color = colors{1};
    end
end
