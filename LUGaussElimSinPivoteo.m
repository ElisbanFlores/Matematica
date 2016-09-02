% Factorizacion LU
% Metodo detallado en sesion de clases
% Elisban Flores Quenaya

function [A L U] = LUGaussElimSinPivoteo(M)
    A=M     
    U=M
    L=zeros
    
    [a b]=size(A)    
    
    if a~=b
        disp('No es una matriz cuadrada')
        return;
    end;
    
    n=a;
    
    for i=1:n
        m=U(i,i)        
        
        if m==0
            disp('Se tendra una division por cero...')  
            L =[];
            U =[];
            return;
        end;
            
        for j=i:n
            L(j,i)=U(j,i)
            U(i,j)=U(i,j)/m                        
        end        
        for k=i+1:n
            t=-U(k,i)
            for j=i:n
                U(k,j)=U(i,j)*t+U(k,j)
            end
        end  
    end