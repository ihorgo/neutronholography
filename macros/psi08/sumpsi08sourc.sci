function M=sumpsi08sourc()
  
  h.name='PSI_08_measurement_inside_source';
  h.history=AddHistory('','sumpsi08sourc','c:\mainsci\macros\psi08\hsourc.mat');
  tmph=zeros(66,360);
  tmpf=tmph;
  
  f='c:\mainsci\macros\psi08\allints.mat';
  loadmatfile(f);
  U.name='U_matrix_PSI08';
  U.U=ints.U;
  mclose('all');
// reading the data file
  f='c:\mainsci\macros\psi08\hsourc.mat';
  loadmatfile(f);
  U.name='U_matrix_PSI08';
  U.U=ints.U;
  G=MakeGrid(1.18,1,1,90,54+90,126+90,U);
  uc=MkUnitCell('PdH');
  ats=AtomPosCalc(uc,25,2);
  modelled=ConstHolo(ats,1.18,G)
  hmod=modelled.hmod;

  i=G.X*0;
  i=H.hs(54:126,:);
  imon=H.hsmon(54:126,:);
  imod=hmod;
  i=i./imon;

// dividing by the integrated intensity
  si=mean(i,'c')*ones(1,360);
  i=i./si;
  
 // i2=i2./si2;
 // i2nr=i2nr+si2nr;
 //filti2=i2*0+1;
//  tmph=tmph+i2;
 // tmphfilt=tmphfilt+filti2;
//  tmphmod=tmphmod+i2m;  
//  tmphn=tmphn+i2nr.*i2.^2;
  
 M.h1.k=2*%pi/1.18;
 M.h1.name='Second measurement';
 M.h1.history=AddHistory('','sumpsi08sourc','c:\mainsci\macros\psi08\hsourc.mat');
 M.h1.h=i;                          
 M.h1.q=G.q;
 M.h1.q=M.h1.q./sum(M.h1.q)*4*%pi;
 M.h1.X=G.X;
 M.h1.Y=G.Y;
 M.h1.Z=G.Z;
 M.h1.filt=M.h1.X*0+1;
 M.h1.hmod=hmod;                                
 M.h1.mon=imon;
 M.h1.status='measurement';
 M.h1.operations='divide by monitor;';
//
//// Calculating the model hologam
//  G=MakeGrid(1.18,1,1,90,ints.thmin,ints.thmax,U);
//  uc=MkUnitCell('CUBIC',2);
//  ats=AtomPosCalc(uc,11,1);
//  modelled=ConstHolo(ats,1.18,G)
//  hmod=modelled.hmod;
//  
// M.hC.k=2*%pi/1.18;
// M.hC.name='Cubic lattice';
// M.hC.history=AddHistory('','sumpsi08partsmod','cubic','2nd_meas grid');                         
// M.hC.q=G.q(3:3:66,:);
// M.hC.X=G.X(3:3:66,:);
// M.hC.Y=G.Y(3:3:66,:);
// M.hC.Z=G.Z(3:3:66,:);
// M.hC.filt=M.h1.X*0+1;
// M.hC.hmod=hmod(3:3:66,:);                                
// M.hC.status='cubic model';
// M.hC.operations='modelled';
//
//  M.hCc=M.hC;
//  M.hCc.name='Cubic centered lattice';
//  M.hCc.history=AddHistory('','sumpsi08partsmod','cubic centered','2nd_meas grid');                         
//  uc=MkUnitCell('CUBIC',2);
//  ats=AtomPosCalc(uc,11,2);
//  modelled=ConstHolo(ats,1.18,G)
//  hmod=modelled.hmod;
//  M.hCc.hmod=hmod(3:3:66,:); 
//  M.hC.status='cubic centered model';
//  M.hC.operations='modelled';
// 
//  M.hFCC=M.hC;
//  M.hFCC.name='FCC lattice';
//  M.hFCC.history=AddHistory('','sumpsi08partsmod','FCC','2nd_meas grid');                         
//  uc=MkUnitCell('FCC',4);
//  ats=AtomPosCalc(uc,11,1);
//  modelled=ConstHolo(ats,1.18,G)
//  hmod=modelled.hmod;
//  M.hFCC.hmod=hmod(3:3:66,:); 
//  M.FCC.status='FCC model';
//  M.FCC.operations='modelled';
//
//  M.hFCCc=M.hC;
//  M.hFCCc.name='FCCc lattice';
//  M.hFCCc.history=AddHistory('','sumpsi08partsmod','FCCc','2nd_meas grid');                         
//  uc=MkUnitCell('FCC',4);
//  ats=AtomPosCalc(uc,11,2);
//  modelled=ConstHolo(ats,1.18,G)
//  hmod=modelled.hmod;
//  M.hFCCc.hmod=hmod(3:3:66,:); 
//  M.FCCc.status='FCCc model';
//  M.FCCc.operations='modelled';
  
  
endfunction




