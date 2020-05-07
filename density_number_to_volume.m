% particle-size distribution (PSD)  
% probability density function in number and volume 
% 
load diameter_ansart_40_63.txt % experimental value 

% dp particle  diameter 
% fp PSD particle in number
% fvp PSD particle in volume 
% FFP cumulative PSD particle volume 
dp = diameter_ansart_40_63(:,1) ; 
fp = diameter_ansart_40_63(:,2) ; 

dpV = ( pi.*dp.^3 )./ 6  ; % diameter * particle volume
V = sum(dpV); 
% passage du volume en cumulée :
% cumulative volume psd 
fvp =fp.* ( pi.*dp.^3 )./ (6*V)    ; 

%fvp =fp./( ( pi.*dp.^3 )./ (6*V))    ; 
%cumulative psd
FFp(1) = 0 ;
for i = 2:length(fvp) 
    FFp(i) = FFp(i-1) + (dp(i) - dp(i-1))* fvp(i) ; 
end

figure(1)
subplot(1,2,1)
semilogx(dp,fp)
subplot(1,2,2)
semilogx(dp,Fp)

figure(2)
subplot(1,2,1)
semilogx(dp,fvp)
subplot(1,2,2)
semilogx(dp,FFp*100/FFp(i))
