function a=RecPsiT08()
  
  h=sumpsiT08();
  
  h.h1=Four2DBgHolo(h.h1,4,0);
  h.h2=Four2DBgHolo(h.h2,4,0);
  h.h3=Four2DBgHolo(h.h3,1,0);
  
  atsarr=MkRecArray(3,1.18/8,5*1.18);
  HPsi082=ReconstHoloArb(atsarr,h.h2);
  save('c:\mainsci\macros\psi08\recpsi08cT.dat',HPsi082);  
  HPsi083=ReconstHoloArb(atsarr,h.h3);
  save('c:\mainsci\macros\psi08\recpsi08cT.dat',HPsi083,HPsi082);  
  HPsi081=ReconstHoloArb(atsarr,h.h1);
  save('c:\mainsci\macros\psi08\recpsi08cT.dat',HPsi081,HPsi082,HPsi083);  
  a.H1=HPsi081;
  a.H2=HPsi082;
  a.H3=HPsi083;
endfunction


