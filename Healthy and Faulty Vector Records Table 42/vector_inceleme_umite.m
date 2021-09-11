% ILK DEGISKENE INCELENECEK DOSYANIN ADINI GIR
% percv1div: v1 vektorunun ortalamaya gore yuzde olarak ne kadar saptigini
% veriyo. Her bir vektördeki sapmalarin, saglikli durumlarda az, hatali 
% durumda bariz fazla oldugunu gorebilirsin

dosya=healthy_fulltork_v2;

N=length(dosya);

total_zv=0;
v1=0; v2=0; v3=0; v4=0; v5=0; v6=0; 
A=0; B=0; C=0;
for(i=1:N)
    if(dosya(i)==0)
        total_zv=total_zv+1;
    elseif (dosya(i)==1)
            v1=v1+1;
            A=A+1;
                
    elseif (dosya(i)==2)
            v2=v2+1;
            C=C+1;
                
    elseif (dosya(i)==3)
            v3=v3+1;
            B=B+1;
                
    elseif (dosya(i)==4)
            v4=v4+1;
            A=A+1;
                
    elseif (dosya(i)==5)
            v5=v5+1;
            C=C+1;
                
    elseif (dosya(i)==6)
            v6=v6+1;
            B=B+1;
                
    end
end

total_active_v=N-total_zv;
phase_avg=total_active_v/3;
active_avg=total_active_v/6;

percv1div=100*(v1-active_avg)/active_avg;
percv2div=100*(v2-active_avg)/active_avg;
percv3div=100*(v3-active_avg)/active_avg;
percv4div=100*(v4-active_avg)/active_avg;
percv5div=100*(v5-active_avg)/active_avg;
percv6div=100*(v6-active_avg)/active_avg;


percA= 100*(A-phase_avg)/phase_avg;
percB= 100*(B-phase_avg)/phase_avg;
percC= 100*(C-phase_avg)/phase_avg;

percA2=percv1div+percv4div;
percB2=percv3div+percv6div;
percC2=percv2div+percv5div;