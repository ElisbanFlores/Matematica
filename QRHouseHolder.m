% Factorizacion QR 
% HouseHolder, para matrices cuadradas
% Elisban Flores Quenaya

function [AA Q R] = QRHouseHolder(A)

    AA=A
    [n,b]=size(A)
    if n~=b
        disp('No es una matriz cuadrada')
        return
    end
    
    Q=eye(n)
    R=A
    
    for i=1:n-1
        signo=sign(R(i,i))        
        I=eye(n)        
        if signo==0
            signo=1            
        end
        
        u=R(i:n,i)+signo*norm(R(i:n,i))*I(i:n,i)        
        H=I(i:n,i:n)-2/(u'*u)*(u*u')
        I(i:n,i:n)=H
        H=I
        R=H*R
        Q=H*Q
    end
    Q=Q'       
end