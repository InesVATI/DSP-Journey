% Approximation
 x=[0 0.2 0.6 1.1 1.5 2]'; N=length(x);
  c10=2; c20=3; y=c10*x+c20;
  y=y+0.3*(2*rand(N,1)-1); MEASUREMENT=[x y];

figure(1)
subplot(2,2,2);
  stem(x,y); grid on
    title('MEASUREMENT');
    xlabel('x')
    A=[sum(x.^2) sum(x);
        sum(x)    N];
    b = [sum(x.*y); sum(y)];
    c=inv(A)*b 
    subplot(1,2,1);
    c1= 1.8:0.05:2.2; c2 = 2.8:0.05:3.2;
    for j= 1:length(c1)
        for i=1:length(c2)
            S(i,j)=sum((c1(j)*x+c2(i)-y).^2);
        end
    end
    mesh(c1,c2,S); xlabel('c1');ylabel('c2');
     title('ERROR SURFACE')
 subplot(2,2,4); 
    contour(c1,c2,S,50); xlabel('c1'); ylabel('c2');title('CONTOUR PLOT')
       
  %Gradient method
  C1(1)=2.2; C2(1)=3; alpha=0.05;
  hold on; plot(C1(1),C2(1),'or'); hold off
  for k=2:20;
      C1(k)=C1(k-1)-alpha*sum((C1(k-1)*x+C2(k-1)-y).*x);
      C2(k)=C2(k-1)-alpha*sum((C1(k-1)*x+C2(k-1)-y));
      hold on; plot(C1(k), C2(k), 'or'); hold off
  end
  subplot(2,2,2)
  xx= 0:0.1:2; f=c(1)*xx+c(2);
  hold on; plot(xx, f, '-or'); hold off
  title(['SIGNAL S: ',num2str(c(1)),', ',num2str(c(2))])