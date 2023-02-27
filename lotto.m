%Ez a kód véletlenszerûen választ N darab lottószámot, amelyek mindegyike 1 és m közötti egész szám lehet. Az histcounts függvényt használva megszámolja, hogy az egyes számok hányszor fordulnak elõ, majd kiszámítja a sûrûségfüggvényt, ami a valószínûséget adja meg az egyes számok elõfordulására vonatkoztatva. Az eloszlásfüggvény egyszerûen az elõzõ sûrûségfüggvény integrálása, azaz az elõzõ értékek összege.
%Az ábrák a sûrûségfüggvényt és az eloszlásfüggvényt mutatják be. A sûrûségfüggvény az X tengelyen a sorszámokat, az Y tengelyen a valószínûséget ábrázolja, az eloszlásfüggvény pedig ugyanezeket az értékeket mutatja, de állandóan növekvõ értékekkel. A sûrûségfüggvénybõl látható, hogy minél nagyobb a sorszám, annál kisebb a val



% Paraméterek beállítása
n = 6; % Az ötös lottó 6 számból áll
N = 1000000; % A szimuláció lépésszáma
m = 45; % Az ötös lottó számainak maximális értéke

% Véletlenszám-generálás
X = randi([1 m], N, n); % A szimuláció során a lottószámokat véletlenszerûen választjuk ki

% Eloszlás és sûrûségfüggvény számítása
edges = 0.5:(m+0.5); % Az oszlopok értékközei
counts = histcounts(X, edges); % Az elõfordulások száma az oszlopokban
pdf = counts/(N*n); % A sûrûségfüggvény értékei
cdf = cumsum(pdf); % Az eloszlásfüggvény értékei

% Eredmények ábrázolása
figure;
subplot(2,1,1);
bar(1:m, pdf, 'hist');
title(sprintf('Sûrûségfüggvény (%d minta)', N));
xlabel('Sorszám');
ylabel('Valószínûség');
grid on;

subplot(2,1,2);
stairs(0:m, [0 cdf], '-');
title('Eloszlásfüggvény');
xlabel('Sorszám');
ylabel('Valószínûség');
grid on;
