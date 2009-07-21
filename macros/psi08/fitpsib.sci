function out=fitpsib()
  
// creating grid, atomic coords, base modelled hologram
 
  f='c:\mainsci\macros\psi08\allints.mat';
  loadmatfile(f);
  U.name='U_matrix_PSI08';
  U.U=ints.U;
//  mclose('all');
  f='c:\mainsci\macros\psi08\hsourc.mat';
  loadmatfile(f);
  U.name='U_matrix_PSI08';
  U.U=ints.U;
  G=MakeGrid(1.18,1,1,90,54+90,126+90,U);
  X=G.X;
  Y=G.Y;
  Z=G.Z;
//  G.X=[X X X X -X -X -X -X X X X X -X -X -X -X Y Y Y Y -Y -Y -Y -Y Y Y Y Y -Y -Y -Y -Y Z Z Z Z -Z -Z -Z -Z Z Z Z Z -Z -Z -Z -Z];
//  G.Y=[Y Y -Y -Y Y Y -Y -Y Z Z -Z -Z Z Z -Z -Z X X -X -X X X -X -X Z Z -Z -Z Z Z -Z -Z X X -X -X X X -X -X Y Y -Y -Y Y Y -Y -Y];
//  G.Z=[Z -Z Z -Z Z -Z Z -Z Y -Y Y -Y Y -Y Y -Y Z -Z Z -Z Z -Z Z -Z X -X X -X X -X X -X Y -Y Y -Y Y -Y Y -Y X -X X -X X -X X -X];
  uc=MkUnitCell('PdH');
  ats=AtomPosCalc(uc,11,2);
disp('eleje');
  shells(1,1)=1; 
  ns=1; 
  for n=2:738 
    if ats.ats(n,6)>ats.ats(n-1,6) 
      shells(ns,2)=n-1; 
      ns=ns+1; 
      shells(ns,1)=n; 
    end; 
  end; 
  shells(ns,2)=n;
  
  f='c:\mainsci\macros\psi08\recpsiph1.dat';
  load(f);
  Hs=H1s.H;
  clear H1s;
  clear H1;
  f='c:\mainsci\macros\psi08\recpsiph1sourc.dat';
  load(f);
  Hs=Hs+H1s.H;
  clear H1s;
  clear H1;
  nm=0;
  for x=0:3
    n1=x*15+1;
    for y=x:3
      n2=y*15+1;
      for z=max(1,y):3
        n3=z*15+1;
        nm=nm+1;
        ms(nm,1:6)=[x/2*4 y/2*4 z/2*4 Hs(n1,n2,n3) norm([x/2*4 y/2*4 z/2*4]) modulo(x+y+z,2)];
      end;
    end;
  end;
  ms=sortrows(ms,5);
  out.msall=ms;
  out.Pd(1)=1;
  out.H(1)=2;
  for n=3:nm
    if ms(n,6)
      out.Pd=[out.Pd n];
    else
      out.H=[out.H n];
    end;
  end;
  
//  load('c:\mainsci\macros\psi08\maxall.dat');
//  ms(1:13,1:3)=(maxs(:,2:4)-1)/30*4;
//  ms(:,4)=maxs(:,5);
  X=ms(:,1);
  Y=ms(:,2);
  Z=ms(:,3);
  recarr.X=[X X X X -X -X -X -X X X X X -X -X -X -X Y Y Y Y -Y -Y -Y -Y Y Y Y Y -Y -Y -Y -Y Z Z Z Z -Z -Z -Z -Z Z Z Z Z -Z -Z -Z -Z];
  recarr.Y=[Y Y -Y -Y Y Y -Y -Y Z Z -Z -Z Z Z -Z -Z X X -X -X X X -X -X Z Z -Z -Z Z Z -Z -Z X X -X -X X X -X -X Y Y -Y -Y Y Y -Y -Y];
  recarr.Z=[Z -Z Z -Z Z -Z Z -Z Y -Y Y -Y Y -Y Y -Y Z -Z Z -Z Z -Z Z -Z X -X X -X X -X X -X Y -Y Y -Y Y -Y Y -Y X -X X -X X -X X -X];
  recarr.history='maxpoints';
  recarr.name=recarr.history;
  out.ms=ms(:,4)/ms(3,4);
  nr=0;
  for nr1=2:2
    rM=4-(nr1-8)*0.02;
//    rM=4;
    for nr2=14:14
      nr=nr+1;
      rm=4-(nr2-8)*0.02;
//      rm=rM;
//      rm=4;
      r=4-0.001*nr;
//      disp(rM,rm);
      for n=1:ns
        r=(1-norm(ats.ats(shells(n,1),1:3))/10)*(rM-rm)+rm;
//        if n<9
//          r=4.12;
//        end;
   //    disp(n);
        at(n).ats=ats;
        at(n).ats.ats=ats.ats(shells(n,1):shells(n,2),:);
//        if at(n).ats.ats(1,4)<0
//          at(n).ats.ats(:,4)=-9;
//          tmp=at(n).ats.ats(2,:);
//          disp(tmp,n);
//        end;
        if n==2
          at(n).ats.ats(:,4)=3;
        end;

//        if n==4
//          at(n).ats.ats(:,4)=3;
//        end;
        at(n).ats.ats(:,1:3)=at(n).ats.ats(:,1:3)/4*r;
        at(n).ats.ats(:,7)=at(n).ats.ats(:,7)*4/r;
        at(n).r=norm(at(n).ats.ats(1,1:3));
        h(n).h=ConstHolo(at(n).ats,1.18,G);
    //pause;
        if n==1
          hsum=h(1).h;
        else
          hsum.hmod=hsum.hmod+h(n).h.hmod;
        end;
      end;

  //    disp('model ready');  
    //pause;
      tmpms=ReconstHoloArb(recarr,hsum,1);
      out.msm(1:nm,nr)=sum(real(tmpms.Hmod),'c');
      out.msm(:,nr)=out.msm(:,nr)/out.msm(3,nr);
      out.rs(nr,1:2)=[rM,rm];
      if min(abs(out.msm(:,nr)))==0
        out.mmsm(:,nr)=out.msm(:,nr)+0.00001;
      end;
      out.err(nr)=sum(((out.msm(:,nr)-out.ms)^2).*(out.ms.^2));
      out.msm2d(nr1,nr2)=out.err(nr);
      out.sig2d(nr1,nr2)=sum(sign(out.msm(:,nr).*out.ms));
      dd=[rM rm out.err(nr) out.sig2d(nr1,nr2)];
      disp(dd);
    end;
  end;
  out.at=at
endfunction

