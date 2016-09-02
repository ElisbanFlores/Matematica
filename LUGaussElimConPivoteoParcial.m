% Factorizacion LU 
% Eliminacion Gausiana con pivoteo parcial
% Elisban Flores Quenaya

function [AA L U M P] = LUGaussElimConPivoteoParcial(A)
    AA=A     
    U=A
    
    
    [a b]=size(A)    
    
    if a~=b
        disp('No es una matriz cuadrada')
        return;
    end;
    
    n=a;
    
    L=eye(n)
    P=eye(n)
    M=eye(n)
    
    for i=1:n
        
        % se Buscara el mayor valor de la fila
        
        may=U(i,i)
        f=i
        c=i
        for j=i+1:n
            if U(j,i)>may
                may=U(j,i)
                f=j
                c=i
            end
        end
        % si hay un numero mayor que U(i,i) se debe hacer el intercambio
        if may~=U(i,i)
            for j=1:n
                % se intercambia en la matriz A=U
                t=U(i,j)
                U(i,j)=U(f,j)
                U(f,j)=t
                % se intercambia en la matriz P
                t=P(i,j)
                P(i,j)=P(f,j)
                P(f,j)=t
            
            end        
        end
            
        
        m=U(i,i) % pivot        
        
        if m==0
            disp('Se tendra una division por cero...')  
            L =[];
            U =[];
            return;
        end;
        % la reduccion
        for j=i+1:n
            M(j,i)=-U(j,i)/m         
            for k=i:n
                U(j,k)=U(j,k)+U(i,k)*M(j,i)
            end
        end    
    end
    
    L=P*AA*inv(U)
    M=inv(L)*P
end    