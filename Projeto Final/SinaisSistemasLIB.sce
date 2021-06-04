// UFPE
// Prof. Gilson Jerônimo
// Biblioteca de funcoes uteis para Sinais e Sistemas

// Definicoes
// 1) Essa biblioteca considera um sinal como uma matriz linha (1 x N)
// 2) Sinais iniciam no tempo n = 0 por definicao
// 3) Os sinais sao de tempo discreto

// define a funcao impulso
function delta = impulso(x)
    delta = 1*(x == 0);
endfunction

// define a funcao degrau
function u = degrau(x)
    u = 1*(x >= 0);
endfunction

// Deslocamento a direita
function y = tsSignal(x,delay)
    y = [zeros(1,delay) x];
endfunction

// Adicoes de Sinais
function y = addSignal(h,x)
    Lh = length(h);
    Lx = length(x);
    if Lh < Lx then
        menor = h;
        maior = x;
        D = Lx - Lh;
    else
        menor = x;
        maior = h;
        D = Lh - Lx;
    end
    y = maior + [menor, zeros(1,D)];
endfunction

// Multiplicacao de Sinais
function y = multSignal(h,x)
    Lh = length(h);
    Lx = length(x);
    if Lh < Lx then
        menor = h;
        maior = x;
        D = Lx - Lh;
    else
        menor = x;
        maior = h;
        D = Lh - Lx;
    end
    y = maior .* [menor, zeros(1,D)];
endfunction

// Plotar um sinal de tempo discreto
function plotDiscreteTime(x)
    n = 0:(length(x)-1);
    plot2d3(n,x);
    a = gce(); // comente para remover os circulos
    a.children(1).mark_style = 9; // comente para remover os circulos
    b = gca();
    b.x_location = "origin";
endfunction
