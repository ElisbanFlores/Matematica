% Factorizacion LU
% Eliminacion Gausiana sin pivoteo
% Elisban Flores Quenaya

function [A L U] = LUGaussElimSinPivoteo2(M)
    A=M     
    U=M
    
    
    [a b]=size(A)    
    
    if a~=b
        disp('No es una matriz cuadrada')
        return;
    end;
    
    n=a;
    
    L=eye(n)
    
    for i=1:n
        
        m=U(i,i) % pivot        
        
        if m==0
            disp('Se tendra una division por cero...')  
            L =[];
            U =[];
            return;
        end;
        % la reduccion
        for j=i+1:n
            L(j,i)=U(j,i)/m         
            for k=i:n
                U(j,k)=U(j,k)-U(i,k)*L(j,i)
            end
        end
    end