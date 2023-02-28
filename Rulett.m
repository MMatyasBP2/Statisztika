% Be�ll�t�sok
num_simulations = 100;  % Szimul�ci�k sz�ma
num_spins = 100;  % P�rget�sek sz�ma
bet_amount = 10;  % T�t �sszege
bet_on_red = true;  % Fogad�s sz�ne: true = piros, false = fekete

% Inicializ�l�s
money = zeros(num_simulations, num_spins);
money(:,1) = 1000;  % Kezd� p�nz�sszeg

% Szimul�ci�
for i = 1:num_simulations
    for j = 2:num_spins
        % Fogad�s
        if bet_on_red
            bet_color = 'Red';
        else
            bet_color = 'Black';
        end
        money(i,j) = money(i,j-1) - bet_amount;
        
        % P�rget�s
        result = roulette_spin();
        if strcmpi(result.Color, bet_color)
            money(i,j) = money(i,j) + bet_amount * 2;
        end
    end
end

% Eredm�nyek �br�zol�sa
figure;
plot(1:num_spins, mean(money));
xlabel('P�rget�sek sz�ma');
ylabel('�tlagos p�nz�sszeg');
title(['�tlagos p�nz�sszeg a(z) ' num2str(num_simulations) ' szimul�ci� ut�n']);

% Roulette p�rget�s f�ggv�ny
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
