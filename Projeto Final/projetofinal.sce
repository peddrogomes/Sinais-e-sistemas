//UFPE
//Pedro Henrique de A. Gomes
//Vitor Mendes Carvalho
//Eng.Eletronica DES


//Projeto Final de Sinais e Sistemas 2020.3
//Detecçao e Remoçao de Ecos


// * lembrar de gravar o audio utilizando a frequencia 22050Hz
// * ajustar local onde está gravado o som e onde quer salvar o som

clear;
clc;

// Bibliotecas
exec('/home/pedro/Downloads/scilab-6.1.0/bin/sinaisesistemas/SinaisSistemasLIB.sce'); //localizaçao da biblioteca usada
exec('/home/pedro/Downloads/scilab-6.1.0/bin/sinaisesistemas/detectordepico.sce');

// Tratamendo do Som

File = '/home/pedro/Downloads/scilab-6.1.0/bin/sinaisesistemas/som.wav'; // localização do som .wav gravado em 22050 Hz
[x, Fs, bits] = wavread(File);



//paramentros

tamanho = wavread(File, "size");

a= 0 :(tamanho(2)-1); //vetor quantidade de amostras
n= a/Fs; //vetor tempo em segundos com 'a' valores
n11=n;
n2 = 0:2*tamanho(2) -2; //vetor tempo em segundos para a convolução (na convoluçao o tempo é duplicaado)
n3 = 0:4*tamanho(2) -4; //

n2 = n2/Fs;////tempo em segundos dps da convoluçao
n22=n2;
n3 = n3/Fs;


alfa=0.4; //valor de alfa (pode variar)
D = 0.5; //valor de D (pode variar)


//Resposta ao impulso

H = impulso(n) - alfa*impulso(n-D);
aux = x(1,:);

y=conv(aux,H ,'full');  // [,'valid']);

//autocorrelaçao

[d, n11] = xcorr(x,'biased');
[d2, n22] = xcorr(y, 'biased');

//[r c]=size(d2);
//sz=min(d2)+(max(d2)-min(d2))/50;
//peaks=peak_detect(d2,sz);



//tratando a autocorrelacao

d2 = d2(n22>-1);
d = d(n11>-1);
n22 = n22(n22>-1);
n11=n11(n11>-1);

n22=n22/Fs;
n11=n11/Fs;

//Valor de D

[valorr,indice]= min(d2); //minimo da funçao fiyy(m)
valor_de_D=indice/Fs;

//fixxD=valorr; //valor de fixx(D)
//fixxD=d(indice);
//Energia do Sinal

Ex=d(1); //fixx(0) 
Ey=d2(1); //fiyy(0)
fixxd=d(indice);
fiyyd=d2(indice);

l=(Ey+fiyyd-fixxd)/Ex;

aa=1;
bb=-1;
cc=0.5-l;

// como a funcao correlaçao eh uma funcao par (Fixx(D)=Fixx(-D))
// fiyy[m] = fixx[m] -alfa(fixx[m-D]+fixx[m+D]) alfa*alfa*fixx[m]
// fazendo m=0

//aa=d(indice);
//bb=-(d(1)+d(2*indice));
//cc=fixm-fiym;

delta=((bb)^2)-(4*aa*cc);
delta= sqrt(delta);
alfa1=(-bb+delta)/(2*aa);
alfa2=(-bb-delta)/(2*aa);


mtNew = filter(1,[1 zeros(1,indice-1) -alfa ],y);

//criando audio de saida
wavwrite(y,'/home/pedro/Downloads/scilab-6.1.0/bin/sinaisesistemas/saida.wav'); 


clf
subplot(221)
title('x[n]')
plot2d(n, x(1,:)) 

subplot(222)
plot2d(n,H)

subplot(223)
title('y[n]')
plot2d(n2,y) 

subplot(224)
title('ϕyy')
plot2d(n22,d2)

subplot(224)
title('ϕxx, ϕyy')
plot2d(n11,d)



//utilizado para plotar os pontos de D e alfa
ddde=1:1:10;
al=1:1:10;
ddde(1)=0.9;ddde(2)=0.5;ddde(3)=0.4;ddde(4)=0.3;ddde(5)=0.2;ddde(6)=0.1;ddde=0.08;ddde=0.06;ddde=0.04;
al(1)=0.04;al(2)=0.05;al(3)=0.05;al(4)=0.06;al(5)=0.08;al(6)=0.2;al(7)=0.3;al(8)=0.4;al=0.9;
//subplot(224)
//plot2d(ddde,al);
