function H=RecPsi08row()
  
  h=sumpsi08();
  
 // h.h1=FourBgHolorow(h.h1,4);
  h.h2=FourBgHolorow(h.h2,4);
 // h.h3=FourBgHolorow(h.h3,1);
  
  atsarr=MkRecArray(2,4/30,4/3*4);
  HPsi082=ReconstHoloArb(atsarr,h.h2);
  H=HPsi082;
  save('c:\mainsci\macros\psi08\recpsi08crows1.dat',HPsi082);
  clear HPsi082;
//  HPsi083=ReconstHoloArb(atsarr,h.h3);
//  save('c:\mainsci\macros\psi08\recpsi08crows.dat',HPsi083,HPsi082);  
//  clear HPsi083;
//  HPsi081=ReconstHoloArb(atsarr,h.h1);
//  save('c:\mainsci\macros\psi08\recpsi08crows.dat',HPsi081,HPsi082,HPsi083);  
//  clear HPsi081;
  
endfunction


