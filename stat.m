% A random minta elemsz�ma
n = 10;

% V�letlenszer� minta gener�l�sa (0 �s 100 k�z�tt)
data = randi([0, 100], 1, n);

% Minta rendez�se
sorted_data = sort(data);

% Medi�n kisz�m�t�sa
if mod(n, 2) == 0
    median_val = (sorted_data(n/2) + sorted_data(n/2 + 1))/2;
else
    median_val = sorted_data((n+1)/2);
end

% Abszol�t elt�r�sek kisz�m�t�sa
abs_diff = abs(sorted_data - median_val);

% MAD kisz�m�t�sa
sorted_abs_diff = sort(abs_diff);
if mod(n, 2) == 0
    MAD = (sorted_abs_diff(n/2) + sorted_abs_diff(n/2 + 1))/2;
else
    MAD = sorted_abs_diff((n+1)/2);
end

% Minta terjedelm�nek kisz�m�t�sa
range_val = max(data) - min(data);

% Eredm�nyek ki�r�sa
fprintf('A minta medi�n abszol�t elt�r�se (MAD): %.2f\n', MAD);
fprintf('A minta terjedelme: %.2f\n', range_val);