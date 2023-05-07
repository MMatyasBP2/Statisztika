% A random minta elemszáma
n = 10;

% Véletlenszerû minta generálása (0 és 100 között)
data = randi([0, 100], 1, n);

% Minta rendezése
sorted_data = sort(data);

% Medián kiszámítása
if mod(n, 2) == 0
    median_val = (sorted_data(n/2) + sorted_data(n/2 + 1))/2;
else
    median_val = sorted_data((n+1)/2);
end

% Abszolút eltérések kiszámítása
abs_diff = abs(sorted_data - median_val);

% MAD kiszámítása
sorted_abs_diff = sort(abs_diff);
if mod(n, 2) == 0
    MAD = (sorted_abs_diff(n/2) + sorted_abs_diff(n/2 + 1))/2;
else
    MAD = sorted_abs_diff((n+1)/2);
end

% Minta terjedelmének kiszámítása
range_val = max(data) - min(data);

% Eredmények kiírása
fprintf('A minta medián abszolút eltérése (MAD): %.2f\n', MAD);
fprintf('A minta terjedelme: %.2f\n', range_val);