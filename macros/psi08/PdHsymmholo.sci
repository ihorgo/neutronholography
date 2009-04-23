function HH=PdHsymmholo()
  
  h=sumpsi08partsmod();
  
  h.h1=Four2DBgHolo(h.h1,5,1);
  h.hC=Four2DBgHolo(h.hC,5,1);
  h.hCc=Four2DBgHolo(h.hCc,5,1);
  h.hFCC=Four2DBgHolo(h.hFCC,5,1);
  h.hFCCc=Four2DBgHolo(h.hFCCc,5,1);
  
  save('c:\mainsci\macros\psi08\psipartsmod.dat',h);
  mclose('all');

//  load('c:\mainsci\macros\psi08\psipartsmod.dat');

  tmpstatus='partsmod loaded';
  
  siz=[4/30*50,4/30*50,4/30*50/2];
  atsarr=MkRecArray(3,4/30,siz,[0,0,siz(3)]);
  H1=ReconstHoloArb(atsarr,h.h1,1);
  save('c:\mainsci\macros\psi08\recpsiph1.dat',H1);
  clear H1;
  mclose('all');

  load('c:\mainsci\macros\psi08\recpsiph1.dat');
//  H1s=SymmRecHolo(H1,24);
//  save('c:\mainsci\macros\psi08\recpsiph1.dat',H1,H1s);
  H1s=HoloCubeSymm(H1,1);
  save('c:\mainsci\macros\psi08\recpsiph1.dat',H1,H1s);
  HH.H=H1;
  HH.Hs=H1s;
  clear H1;
  clear H1s;
  mclose('all');
  
//
//  tmpstatus='measured symmetry used';
//
//  
//  HC=ReconstHoloArb(atsarr,h.hC,1);
//  save('c:\mainsci\macros\psi08\recpsiphC.dat',HC);
//  clear HC;
//  mclose('all');
//
//  
//  load('c:\mainsci\macros\psi08\recpsiphC.dat');
//  HCs=SymmRecHolo(HC,24);
//  save('c:\mainsci\macros\psi08\recpsiphC.dat',HC,HCs);
//  clear HC;
//  clear HCs;
//  mclose('all');
//
//  tmpstatus='C symmetry used';
//
// 
//  HCc=ReconstHoloArb(atsarr,h.hCc,1);
//  save('c:\mainsci\macros\psi08\recpsiphCc.dat',HCc);
//  clear HCc;
//  mclose('all');
//
//  tmpstatus='Cc calculated ';
//
//  
//  load('c:\mainsci\macros\psi08\recpsiphCc.dat');
//  HCcs=SymmRecHolo(HCc,6);
//  save('c:\mainsci\macros\psi08\recpsiphCc.dat',HCc,HCcs);
//  clear HCc;
//  clear HCcs;
//  mclose('all');
//  
//  tmpstatus='Cc symmetry used';
//  
//  HFCC=ReconstHoloArb(atsarr,h.hFCC,1);
//  save('c:\mainsci\macros\psi08\recpsiphFCC.dat',HFCC);
//  clear HFCC;
//  mclose('all');
//  tmpstatus='FCC calculated';
//
//  load('c:\mainsci\macros\psi08\recpsiphFCC.dat');
//  HFCCs=SymmRecHolo(HFCC,6);
//  save('c:\mainsci\macros\psi08\recpsiphFCC.dat',HFCC,HFCCs);
//  clear HFCC;
//  clear HFCCs;
//  mclose('all');
//
//  tmpstatus='FCC symmetry used';
//  
//  
//  HFCCc=ReconstHoloArb(atsarr,h.hFCCc,1);
//  save('c:\mainsci\macros\psi08\recpsiphFCCc.dat',HFCCc);
//  clear HFCCc;
//  mclose('all');
//
//  tmpstatus='FCCc calculated';
//
//
//  load('c:\mainsci\macros\psi08\recpsiphFCCc.dat');
//  HFCCcs=SymmRecHolo(HFCCc,6);
//  save('c:\mainsci\macros\psi08\recpsiphFCC.dat',HFCCc,HFCCcs);
//  clear HFCCc;
//  clear HFCCcs;
//  mclose('all');
//
//  tmpstatus='FCCc symmetry used';
//
//  load('c:\mainsci\macros\psi08\recpsiph1.dat');
//  HH.H1s=H1s
//  clear H1;
//  clear H1s;
//  mclose('all');
//  
//  load('c:\mainsci\macros\psi08\recpsiphC.dat');
//  HH.HCs=HCs
//  clear HC;
//  clear HCs;
//  mclose('all');
// 
//  load('c:\mainsci\macros\psi08\recpsiphCc.dat');
//  HH.HCcs=HCcs
//  clear HCc;
//  clear HCcs;
//  mclose('all');
//  
//  load('c:\mainsci\macros\psi08\recpsiphFCC.dat');
//  HH.HFCCs=HFCCs
//  clear HFCC;
//  clear HFCCs;
//  mclose('all');
//  
//  load('c:\mainsci\macros\psi08\recpsiphFCCc.dat');
//  HH.HFCCcs=HFCCcs
//  clear HFCCc;
//  clear HFCCcs;
//  mclose('all');

  
endfunction


