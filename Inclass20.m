%Inclass 20

%In this folder you will find a .mat file with x and y data

% For all of the questions below, use any options as necessary to get a
% good fit - starting points, lower bounds etc. 

data = load('data.mat');
xx = data.xx';
yy = data.yy';

% 1. Define a custom model and try to fit the data to a Michaelis function 
% y = V*x/(K+x). 

micha_fit_str = 'V*x/(K+x)';
micha_fitmodel = fittype(micha_fit_str);
[micha_fitout, micha_fitmetric] = fit(xx, yy, micha_fitmodel, 'StartPoint', [0.2000 0.1186]);
plot(micha_fitout, xx, yy);

% 2. Use a custom model to try to fit the data to a Hill function with
% exponent 2: y = V*x^2/(K^2+x^2)

hill_fit_str = 'V*x^2/(K^2+x^2)';
hill_fitmodel = fittype(hill_fit_str);
[hill_fitout, hill_fitmetric] = fit(xx, yy, hill_fitmodel, 'StartPoint', [0.2000 0.1186]);
plot(hill_fitout, xx, yy);

% 3. Now treat the exponent as a free parameter and perform the fit again,
% that is fit to the model y = V*x^n/(K^n+x^n)

new_fit_str = 'V*x^n/(K^n+x^n)';
new_fitmodel = fittype(new_fit_str);
[new_fitout, new_fitmetric] = fit(xx, yy, new_fitmodel, 'StartPoint', [2 4 2], 'Lower', [0 0 0]);
plot(new_fitout, xx, yy);

% 4. Redo parts 1 and 2, but using your model from 3 and fixing the value of
% n to either 1 or 2.

% Part 1 & 2 Redo

model = fittype(new_fit_str, 'problem', 'n');
[model1_fitout, model1_fitmetric] = fit(xx, yy, model, 'problem', 1, 'StartPoint', [0.2000 0.1186]);
plot(model1_fitout, xx, yy);

[model2_fitout, model2_fitmetric] = fit(xx, yy, model, 'problem', 2, 'StartPoint', [0.2000 0.1186]);
plot(model2_fitout, xx, yy);