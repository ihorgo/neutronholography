function H=RecPsi08rowsymm()
  
  h=sumpsi08();
  
  tmphmod=h.h2.hmod;
//  h.h1=FourBgHolorow(h.h1,4);
  h.h2=FourBgHolorow(h.h2,4);
  h.h2.hmod=tmphmod;
//  h.h3=FourBgHolorow(h.h3,1);
  
//  h.h1=Symmhol(h.h1,8);
  h.h2=Symmhol(h.h2,8);
//  h.h3=Symmhol(h.h3,8);
  siz=4/30*17;
  atsarr=MkRecArray(3,4/30,siz,[siz,siz,siz]);
  tmpx=atsarr.X(:,:,[1,16,31]);
  tmpy=atsarr.Y(:,:,[1,16,31]);
  tmpz=atsarr.Z(:,:,[1,16,31]);
  atsarr.X=tmpx;
  atsarr.Y=tmpy;
  atsarr.Z=tmpz;
  HPsi082=ReconstHoloArb(atsarr,h.h2);
  H=HPsi082;
  disp('elso');
  save('c:\mainsci\macros\psi08\recpsi08crows1symmb.dat',HPsi082);
//  clear HPsi082;
//  disp('masodik');
//  HPsi083=ReconstHoloArb(atsarr,h.h3);
//  save('c:\mainsci\macros\psi08\recpsi08crows1symm.dat',HPsi083,HPsi082);  
// // clear HPsi083;
//  disp('harmadik');
//  HPsi081=ReconstHoloArb(atsarr,h.h1);
//  save('c:\mainsci\macros\psi08\recpsi08crows1symm.dat',HPsi081,HPsi082,HPsi083);  
// // clear HPsi081;
  
endfunction


