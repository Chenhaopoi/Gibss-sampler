num_samples = 60;
num_dims = 5;

beta = [0, 0,0,1,1.2];
%gama(1) =0.5; gama(2) =0.5;gama(3) =0.5;gama(4) =0.5;gama(5)=0.5;
%prop_sigma = 1;
fgama=0.5^5;
x = zeros(num_samples, num_dims);
tao=0.33;
x(1, 1) =normrnd(0,1);
x(1, 2) =normrnd(0,1);
x(1, 3) =normrnd(0,1);
x(1, 4) =normrnd(1,1);
x(1, 5) =normrnd(1.2,1);
t = 1;
dims = 1:num_dims;
while t < num_samples %gibbs sampler
    t = t + 1;
    for iD = 1:num_dims
     T = [t, t,t,t,t];
     T(iD)=T(iD)-1;
        not_idx = (dims ~= iD+1);
        mu_cond = (1-fgama)*beta(iD) + fgama*(x(T(iD), not_idx) - beta(not_idx));
        if beta(iD)==0 sigma_cond = (1-fgama)*tao+fgama*(10*tao)*2.5^0.5;
        else sigma_cond = (1-fgama)*tao+fgama*(10*tao);
      end
      x(t,iD) = normrnd(mu_cond(iD), sigma_cond);
      T(iD)=T(iD)+1;
   end
end
i=1;
while i<=5
  b(i)=mean(x(1:60,i));  %beta hat
  vb(i)=std(x(1:60,i)'); %
  i=i+1;
end