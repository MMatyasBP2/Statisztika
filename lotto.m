%Ez a k�d v�letlenszer�en v�laszt N darab lott�sz�mot, amelyek mindegyike 1 �s m k�z�tti eg�sz sz�m lehet. Az histcounts f�ggv�nyt haszn�lva megsz�molja, hogy az egyes sz�mok h�nyszor fordulnak el�, majd kisz�m�tja a s�r�s�gf�ggv�nyt, ami a val�sz�n�s�get adja meg az egyes sz�mok el�fordul�s�ra vonatkoztatva. Az eloszl�sf�ggv�ny egyszer�en az el�z� s�r�s�gf�ggv�ny integr�l�sa, azaz az el�z� �rt�kek �sszege.
%Az �br�k a s�r�s�gf�ggv�nyt �s az eloszl�sf�ggv�nyt mutatj�k be. A s�r�s�gf�ggv�ny az X tengelyen a sorsz�mokat, az Y tengelyen a val�sz�n�s�get �br�zolja, az eloszl�sf�ggv�ny pedig ugyanezeket az �rt�keket mutatja, de �lland�an n�vekv� �rt�kekkel. A s�r�s�gf�ggv�nyb�l l�that�, hogy min�l nagyobb a sorsz�m, ann�l kisebb a val



% Param�terek be�ll�t�sa
n = 6; % Az �t�s lott� 6 sz�mb�l �ll
N = 1000000; % A szimul�ci� l�p�ssz�ma
m = 45; % Az �t�s lott� sz�mainak maxim�lis �rt�ke

% V�letlensz�m-gener�l�s
X = randi([1 m], N, n); % A szimul�ci� sor�n a lott�sz�mokat v�letlenszer�en v�lasztjuk ki

% Eloszl�s �s s�r�s�gf�ggv�ny sz�m�t�sa
edges = 0.5:(m+0.5); % Az oszlopok �rt�kk�zei
counts = histcounts(X, edges); % Az el�fordul�sok sz�ma az oszlopokban
pdf = counts/(N*n); % A s�r�s�gf�ggv�ny �rt�kei
cdf = cumsum(pdf); % Az eloszl�sf�ggv�ny �rt�kei

% Eredm�nyek �br�zol�sa
figure;
subplot(2,1,1);
bar(1:m, pdf, 'hist');
title(sprintf('S�r�s�gf�ggv�ny (%d minta)', N));
xlabel('Sorsz�m');
ylabel('Val�sz�n�s�g');
grid on;

subplot(2,1,2);
stairs(0:m, [0 cdf], '-');
title('Eloszl�sf�ggv�ny');
xlabel('Sorsz�m');
ylabel('Val�sz�n�s�g');
grid on;
