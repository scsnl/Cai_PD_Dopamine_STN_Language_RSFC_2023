addpath(genpath('../PermCCA-master')); %add permCCA core function path

% load X, y and Z (Z contains confound variables)
X = csvread(X_fname, 1, 0);
y = csvread(y_fname, 1, 0);
Z = csvread(Z_fname, 1, 0);

X_norm = normalize(X);
y_norm = normalize(y);
Z_norm = normalize(Z);

nR = 100;
nP = 1000;
for rep = 1:nR
     rng(rep);
     [pfwe_rep(rep,:), r_rep(rep,:), A, B, U, V] = permcca(y_norm,X_norm,nP,Z_norm,Z_norm);
end

[pfwe, r, A, B, U, V] = permcca(y_norm,X_norm,nP,Z_norm,Z_norm);

