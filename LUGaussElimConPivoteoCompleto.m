% Factorizacion LU 
% Eliminacion Gausiana con pivoteo Completo
% Elisban Flores Quenaya

function [AA L U M P Q] = LUGaussElimConPivoteoCompleto(A)
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
    Q=eye(n)
    M=eye(n)
    
    for i=1:n
        
        % se Buscara el mayor valor de la submatriz
        
        may=U(i,i)
        f=i
        c=i
        
        for j=i:n
            for k=i:n
                if U(j,k)>may
                    may=U(j,k)
                    f=j
                    c=k
                end
            end
        end
        
        % si hay un numero mayor que U(i,i) se debe hacer el intercambio
        if f~=i
            %intercambios por filas
            disp('intercambio filas')
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
        
        if c~=i
            %intercambio por columnas
            disp('intercambio de columnas') 
            for j=1:n
                % se intercambia en la matriz A=U
                t=U(j,i)
                U(j,i)=U(j,k)
                U(j,k)=t
                % se intercambia en la matriz Q
                t=Q(j,i)
                Q(j,i)=Q(j,k)
                Q(j,k)=t
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
    
    L=P*AA*Q*inv(U)
    M=inv(L)*P
end