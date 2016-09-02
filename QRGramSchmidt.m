% Factorizacion QR 
% Gram Schmidt por columnas
% Elisban Flores Quenaya

function [A Q R] = QRGramSchmidt(A)

    [n,b]=size(A)
    if n~=b
        disp('No es una matriz cuadrada')
        return
    end
    
    R=eye(n)
    Q=eye(n)
    Q(:,1)=A(:,1)/norm(A(:,1))
    %explorar por columnas
    for i=2:n
        suma=0
        for j=1:i-1
            norma=norm(Q(:,j))
            if norma==0
                disp('Posible division entre cero...')
                return
            end                
            alfa=(A(:,i)'*Q(:,j))/norma
            suma=suma + alfa*Q(:,j)            
        end        
        Q(:,i)=A(:,i)-suma
        Q(:,i)=Q(:,i)/norm(Q(:,i))
    end
    R=Q'*A
end