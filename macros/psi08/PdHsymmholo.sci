function HH=PdHsymmholo()
  
  h=sumpsi08partsmod();
  
  h.h1=Four2DBgHolo(h.h1,5,1);
  h.hC=Four2DBgHolo(h.hC,5,1);
  h.hCc=Four2DBgHolo(h.hCc,5,1);
  h.hFCC=Four2DBgHolo(h.hFCC,5,1);
  h.hFCCc=Four2DBgHolo(h.hFCCc,5,1);
  
  save('c:\mainsci\macros\psi08\psipartsmod.dat',h);
  mclose('all');

  siz=4/30*50;
  atsarr=MkRecArray(3,4/30,siz);
  H1=ReconstHoloArb(atsarr,h.h1);
  save('c:\mainsci\macros\psi08\recpsiph1.dat',H1);
  clear H1;
  mclose('all');
  
  HC=ReconstHoloArb(atsarr,h.hC);
  save('c:\mainsci\macros\psi08\recpsiphC.dat',HC);
  clear HC;
  mclose('all');
 
  HCc=ReconstHoloArb(atsarr,h.hCc);
  save('c:\mainsci\macros\psi08\recpsiphCc.dat',HCc);
  clear HCc;
  mclose('all');
  
  HFCC=ReconstHoloArb(atsarr,h.hFCC);
  save('c:\mainsci\macros\psi08\recpsiphFCC.dat',HFCC);
  clear HFCC;
  mclose('all');
  
  HFCCc=ReconstHoloArb(atsarr,h.hFCCc);
  save('c:\mainsci\macros\psi08\recpsiphFCCc.dat',HFCCc);
  clear HFCCc;
  mclose('all');
  
  load('c:\mainsci\macros\psi08\recpsiph1.dat');
  H1s=SymmRecHolo(H1,6);
  save('c:\mainsci\macros\psi08\recpsiph1.dat',H1,H1s);
  clear H1;
  clear H1s;
  mclose('all');
  
  load('c:\mainsci\macros\psi08\recpsiphC.dat');
  HCs=SymmRecHolo(HC,6);
  save('c:\mainsci\macros\psi08\recpsiphC.dat',HC,HCs);
  clear HC;
  clear HCs;
  mclose('all');
  
  load('c:\mainsci\macros\psi08\recpsiphCc.dat');
  HCcs=SymmRecHolo(HCc,6);
  save('c:\mainsci\macros\psi08\recpsiphCc.dat',HCc,HCcs);
  clear HCc;
  clear HCcs;
  mclose('all');
  
  load('c:\mainsci\macros\psi08\recpsiphFCC.dat');
  HFCCs=SymmRecHolo(HFCC,6);
  save('c:\mainsci\macros\psi08\recpsiphFCC.dat',HFCC,HFCCs);
  clear HFCC;
  clear HFCCs;
  mclose('all');
  
  load('c:\mainsci\macros\psi08\recpsiphFCCc.dat');
  HFCCcs=SymmRecHolo(HFCCc,6);
  save('c:\mainsci\macros\psi08\recpsiphFCC.dat',HFCCc,HFCCcs);
  clear HFCCc;
  clear HFCCcs;
  mclose('all');

  load('c:\mainsci\macros\psi08\recpsiph1.dat');
  HH.H1s=H1s
  clear H1;
  clear H1s;
  mclose('all');
  
  load('c:\mainsci\macros\psi08\recpsiphC.dat');
  HH.HCs=HCs
  clear HC;
  clear HCs;
  mclose('all');
 
  load('c:\mainsci\macros\psi08\recpsiphCc.dat');
  HH.HCcs=HCcs
  clear HCc;
  clear HCcs;
  mclose('all');
  
  load('c:\mainsci\macros\psi08\recpsiphFCC.dat');
  HH.HFCCs=HFCCs
  clear HFCC;
  clear HFCCs;
  mclose('all');
  
  load('c:\mainsci\macros\psi08\recpsiphFCCc.dat');
  HH.HFCCcs=HFCCcs
  clear HFCCc;
  clear HFCCcs;
  mclose('all');

  
endfunction


