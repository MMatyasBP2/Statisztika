% Rulettkerék szimuláció Matlabban

% Játék konfigurációja
bet = 10; % Betét mérete
max_turak = 10; % Maximális játékmenetek száma

% Kerék konfigurációja
szinek = {'piros', 'fekete'}; % Színek
szamok = 0:36; % Számok
szin_szamok = [szinek{1}, num2cell(szamok(1:10)), szinek{2}, num2cell(szamok(11:18)),...
               szinek{1}, num2cell(szamok(19:28)), szinek{2}, num2cell(szamok(29:36)), 'zéró'];

% Játékmenet
penz = 100; % Pénz kezdőösszege
for i = 1:max_turak
    % Játékos által kiválasztott szám/szín
    tipp = randi(length(szin_szamok));
    tipp_szin_szam = szin_szamok{tipp};
    
    % Kerék forgatása
    eredmeny_szin_szam = szin_szamok{randi(length(szin_szamok))};
    
    % Nyereség/kár számítása
    if strcmp(tipp_szin_szam, eredmeny_szin_szam)
        penz = penz + bet*36;
        disp(['Nyertél! A kiválasztott szám/szín: ', tipp_szin_szam, ', a rulettkerék eredménye: ', eredmeny_szin_szam])
    else
        penz = penz - bet;
        disp(['Vesztettél! A kiválasztott szám/szín: ', tipp_szin_szam, ', a rulettkerék eredménye: ', eredmeny_szin_szam])
    end
    
    % Játékos állása
    disp(['Az állásod: ', num2str(penz)])
    
    % Ha elfogyott a pénz, vége a játéknak
    if penz <= 0
        disp('Elfogyott a pénzed! Vége a játéknak.')
        break
    end
end