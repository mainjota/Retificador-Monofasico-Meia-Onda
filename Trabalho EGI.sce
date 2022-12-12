// Comando:

// Faça um programa no Matlab ou Scilab para os cálculo de um Retificador de Meia Onda com filtro capacitivo.
// O usuário deve entrar com os valores iniciais, que pode ser tensão eficaz ou de pico, do secundário ou primário do transformador com sua frequência e o valor da capacitância do filtro. Caso seja dados do primário, deve se obter também o fator de conversão.
// A partir dos dados de entrada, devem ser calculados: Tensão de pico, Ripple, média e mínima e corrente média na carga e a tensão reversa no diodo. Os dados devem ser exibidos de forma organizada e clara para o usuário
// Uma figura do circuito retificador deve ser mostrada em algum momento da execução do software.
// Após essa etapa, o programa deve dar condição de entrar com novos dados ou ser finalizado.

// Preparação

clc;
clear;



// Interrogatório

printf("Retificador Meia Onda com Filtro Capacitivo (Interativo)\n\n\n Alunos:\n Diogo Campos (ELE3B)\n Gabriel Galantini (ELE3B)\n Victor Fernandes (ELE3B)\n\n---------------------------------------------------------------\n");


printf("Preencha os valores, caso não haja preencha com 0.\nPreencha com pelo menos um valor de tensão.\n---------------------------------------------------------------\n");
rcarga = input("Resistência da Carga Instalada (Ω): ");
vef1 = input("Tensão Eficaz Primário (V): ");
vef2 = input("Tensão Eficaz Secundário (V): ");s
vp1 = input("Tensão Pico Primário (V): ");
vp2 = input("Tensão Pico Secundário (V): ");
alpha = input("Relação de transformação primario/secundário (α): ");
fhz = input("Frequência (Hz): ");
uc = input("Capacitância do filtro (µ) : ");
tensoes = [vef1,vef2,vp1,vp2];


// Erros



if alpha == 0 then;
    disp("Erro. Alpha não pode ser 0."); // Erro caso alpha inserido valha 0.
    abort;
end;

if tensoes == 0 then;
    disp("Erro. Você não disponibilizou nenhuma tensão."); // Erro caso as tensões inseridas valham 0.
    abort;
end;

if uc == 0 then;
    disp("Erro. Nenhum valor de capacitância foi informado."); // Erro caso a capacitância inserida valha 0.
    abort;
end;

if rcarga == 0 then;
    disp("Erro. O valor da carga não foi disponibilizado."); // Erro caso a resistência da carga instalada valha 0.
    abort;
end;

if fhz == 0 then;
    disp("A frequência informada é = 0."); // Erro caso a frequência inserida valha 0.
    abort;
end;


// Transformação de Variaveis


vsectransf = (vef1/alpha); // Tensão eficaz do primario transformada em tensao eficaz do secundario


vmax0 = (vp1/alpha); // Vmax do primário transformado em Vmax do secundário
vmax1 = (vsectransf*(sqrt(2))); // Vefz do primario transformado em Vmax do secundário 
vmax2 = (vef2*(sqrt(2))); // Vefz do secundario transformado em vmax secundario
vmax3 = vp2;

vmax = max(vmax0,vmax1,vmax2,vmax3);

tensaoeficazsecundario = (vef2); // Tensão Eficaz Operando
tensaoeficazsecundario2 = (vsectransf); // Tensão Eficaz Operando 2
tensaopicosecundario = (vmax0); // Tensão Pico Operando
tensaopicosecundario2 = (vp2); // Tensão Pico Operando 2


capac = (uc*(0.000001)); // Passando Capacitor para Micro

i1 = (vmax/rcarga);


// Cálculo Tensão de Ripple

vrp = ((i1)/((fhz)*(capac)));


// Cálculo de Vmed

vmed = (vmax-(vrp/2));


// Cálculo Imed na Carga

imed = (vmed/rcarga);


// Cálculo PIV  

piv = (2*vmax);


// Cálculo Vmin

vmin = (vmax-vrp);

// Disposição dos Valores

format(5); // Arredondar os valores para 3 casas.

printf("\n\nA tensão média na carga é de (V): ");
disp(vmed);
printf("\nA tensão máxima na carga é de (V): ");
disp(vmax);
printf("\nA tensão mínima na carga é de (V): ");
disp(vmin);
printf("\nA tensão de Ripple é de (V): ");
disp(vrp);
printf("\nA corrente média na carga é de (A): ");
disp(imed);
printf("\nA tensão reversa máxima é de (V): ");
disp(piv);
printf("\n\n\n");


// Finalização

k=-1;
mode(k);

circuito = imread('circuitoretificador.png');
imshow(circuito);

restart = input("Digite (1) se deseja inserir novos valores:  ");

if (restart==1) then
    clear
    clc
    exec("Trabalho EGI.sce",[-1]) 
else 
    clear
    clc
    abort
end





