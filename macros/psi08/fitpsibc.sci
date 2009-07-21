function out=fitpsibc()
  
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
  nm=11;
  out.msall=ms;
  out.Pd(1)=1;
  out.Pdr(1)=norm(ms(1,1:3));
  out.H(1)=2;
  out.Hr(1)=norm(ms(2,1:3));
  for n=3:nm
    if ms(n,6)
      out.Pd=[out.Pd n];
      out.Pdr=[out.Pdr,norm(ms(n,1:3))];
    else
      out.H=[out.H n];
      out.Hr=[out.Hr,norm(ms(n,1:3))];
    end;
  end;
  disp(out.Pdr);
//  load('c:\mainsci\macros\psi08\maxall.dat');
//  ms(1:13,1:3)=(maxs(:,2:4)-1)/30*4;
//  ms(:,4)=maxs(:,5);
  X=ms(1:nm,1);
  Y=ms(1:nm,2);
  Z=ms(1:nm,3);
  recarr.X=[X X X X -X -X -X -X X X X X -X -X -X -X Y Y Y Y -Y -Y -Y -Y Y Y Y Y -Y -Y -Y -Y Z Z Z Z -Z -Z -Z -Z Z Z Z Z -Z -Z -Z -Z];
  recarr.Y=[Y Y -Y -Y Y Y -Y -Y Z Z -Z -Z Z Z -Z -Z X X -X -X X X -X -X Z Z -Z -Z Z Z -Z -Z X X -X -X X X -X -X Y Y -Y -Y Y Y -Y -Y];
  recarr.Z=[Z -Z Z -Z Z -Z Z -Z Y -Y Y -Y Y -Y Y -Y Z -Z Z -Z Z -Z Z -Z X -X X -X X -X X -X Y -Y Y -Y Y -Y Y -Y X -X X -X X -X X -X];
  recarr.history='maxpoints';
  recarr.name=recarr.history;
  out.ms=ms(1:nm,4)/ms(3,4);
  nr=0;
  tao=48;
  bh=5.2;
  rM=4.04;
  rm=3.92;
  b121=3*bh;
  b122=1*bh;
//pause;
  for nr1=1:21
//    bh=4.8+nr1/5;
     rM=4.0-(nr1-11)*0.01;
//    rM=4;//
//      b121=(nr1-3);
    for nr2=1:21
//      b122=(nr2-3);
      nr=nr+1;
//      tao=30+nr2*6;
      rm=4-(nr2-11)*0.01;
//      rm=rM;
//      rm=4;
//      r=4-0.001*nr;
//      disp(rM,rm);
      for n=1:ns
        r=(1-norm(ats.ats(shells(n,1),1:3))/10)*(rM-rm)+rm;
        R=norm(ats.ats(shells(n,1),1:3));
        DR=0.25*(1-exp(-1*R/tao));
        bh2=bh*exp(-1*(2*%pi/1.18*DR).^2/2);
//        if n<9
//          r=4.12;
//        end;
   //    disp(n);
        at(n).ats=ats;
        at(n).ats.ats=ats.ats(shells(n,1):shells(n,2),:);
        if at(n).ats.ats(1,4)<0
          at(n).ats.ats(:,4)=at(n).ats.ats(:,4)*bh2;
//          tmp=at(n).ats.ats(2,:);
//          disp(tmp,n);
        end;
        if n==2
          at(n).ats.ats(:,4)=b121*bh2;
        end;

        if n==4
          at(n).ats.ats(:,4)=b122*bh2;
        end;
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
//pause;
  //    disp('model ready');  
    //pause;
      tmpms=ReconstHoloArb(recarr,hsum,1);
      out.msm(1:nm,nr)=sum(real(tmpms.Hmod),'c');
      out.ii(nr)=out.msm(3,nr);
      out.msmr(1:rm,nr)=out.msm(1:rm,nr);
      out.msm(:,nr)=out.msm(:,nr)/out.msm(3,nr);
      out.rs(nr,1:2)=[rM,rm];
      if min(abs(out.msm(:,nr)))==0
        out.mmsm(:,nr)=out.msm(:,nr)+0.00001;
      end;
      out.err(nr)=sum(((out.msm(:,nr)-out.ms)^2).*(out.ms.^2));
      out.errH(nr)=sum(((out.msm(out.H,nr)-out.ms(out.H))^2).*(out.ms(out.H).^2));
      out.errPd(nr)=sum(((out.msm(out.Pd,nr)-out.ms(out.Pd))^2).*(out.ms(out.Pd).^2));

      out.errPd2(nr)=sum(((out.msm(out.Pd,nr)-out.ms(out.Pd))^2)./((out.Pdr).^2)');
      out.msm2d(nr1,nr2)=out.err(nr);
      out.sig2d(nr1,nr2)=sum(sign(out.msm(:,nr).*out.ms));
        dd=[rM rm out.err(nr) out.sig2d(nr1,nr2) tao bh out.errPd(nr) out.errH(nr) out.errPd2(nr) b121 b122 out.ii(nr)];
      disp(dd);
    end;
  end;
  out.at=at
endfunction

