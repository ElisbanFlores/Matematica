% Factorizacion QR 
% Givens, para matrices cuadradas
% Elisban Flores Quenaya

function [AA Q R] = QRGivens(A)

    AA=A
    [n,b]=size(A)
    if n~=b
        disp('No es una matriz cuadrada')
        return
    end
    
    Q=eye(n)
    R=A
    
    %A=[1 2 3; 3 3 4;4 5 6]
    %x1=1
    %x2=3
    
    % crear un zero en la posicion (2,1)
    
    for i=1:n
        for j=i+1:n
            
            x1=R(i,i)
            x2=R(j,i)
            % Hallar c y s
            s=0, c=0
            if(abs(x2)>=abs(x1))
                t=x1/x2, s=1/sqrt(1+t*t), c=s*t
            else
                t=x2/x1, c=1/sqrt(1+t*t), s=c*t
            end
            
            %Armar J
            
            J=eye(n)
            %i j
            J(i,i)=c;
            J(i,j)=s;
            J(j,i)=-s;
            J(j,j)=c
            
            R=J*R  
            Q=J*Q            
        end
    end
    Q=Q'    
end