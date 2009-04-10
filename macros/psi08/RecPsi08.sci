function RecPsi08()
  
  h=sumpsi08();
  
  h.h1=Four2DBgHolo(h.h1,4,0);
  h.h2=Four2DBgHolo(h.h2,4,0);
  h.h3=Four2DBgHolo(h.h3,1,0);
  
  atsarr=MkRecArray(3,3.94/30,3.94/3*5);
  HPsi082=ReconstHoloArb(atsarr,h.h2);
  save('c:\mainsci\macros\psi08\recpsi08c.dat',HPsi082);  
  HPsi083=ReconstHoloArb(atsarr,h.h3);
  save('c:\mainsci\macros\psi08\recpsi08c.dat',HPsi083,HPsi082);  
  HPsi081=ReconstHoloArb(atsarr,h.h1);
  save('c:\mainsci\macros\psi08\recpsi08c.dat',HPsi081,HPsi082,HPsi083);  
  
endfunction


