function M=sumpsiT08()
  
  h.name='PSI_08_measurement_inside_detector';
  h.history=AddHistory('','sumpsi08','c:\mainsci\macros\psi08\allints.mat');
  tmph=zeros(66,360);
  tmpf=tmph;
  
  
// reading the data file
  f='c:\mainsci\macros\psi08\allints.mat';
  loadmatfile(f);
  U.name='U_matrix_PSI08';
  U.U=ints.U';


// Calculating the model hologam
  G=MakeGrid(1.18,1,1,90,ints.thmin,ints.thmax,U);
  uc=MkUnitCell('PdH');
  ats=AtomPosCalc(uc,5,2);
  modelled=ConstHolo(ats,1.18,G)
  hmod=modelled.hmod;
  

  tmph=zeros(22,360);
  tmphfilt=tmph;
  tmphmod=tmph;
  tmphn=tmph;

// intensity over monitor cnt
  i1=zeros(3,360);
  i1n=i1;
  i1m=i1;
  i1(1,:)=sum(ints.int1.ints(35:37,:),'r')./sum(ints.int1.mons(35:37,:),'r');
  i1(2,:)=sum(ints.int1.ints(38:40,:),'r')./sum(ints.int1.mons(38:40,:),'r');
  i1(3,:)=sum(ints.int1.ints(41:42,:),'r')./sum(ints.int1.mons(41:42,:),'r');
  
// relative noise
  i1nr(1,:)=sum(ints.int1.ints(35:37,:),'r').^-1+sum(ints.int1.mons(35:37,:),'r').^-1;
  i1nr(2,:)=sum(ints.int1.ints(38:40,:),'r').^-1+sum(ints.int1.mons(38:40,:),'r').^-1;
  i1nr(3,:)=sum(ints.int1.ints(41:42,:),'r').^-1+sum(ints.int1.mons(41:42,:),'r').^-1;
 //tmph=zeros(22,360);
 // tmphfilt=tmph;
 // tmphmod=tmph;
 // tmphn=tmph;
//pause;


////////////////////////////////FIRST MEASUREMENT /////////////////////////////////////
//// intensity over monitor cnt
//  i1=zeros(3,360);
//  i1n=i1;
//  i1m=i1;
//  i1(1,:)=sum(ints.int1.ints(35:37,:),'r')./sum(ints.int1.mons(35:37,:),'r');
//  i1(2,:)=sum(ints.int1.ints(38:40,:),'r')./sum(ints.int1.mons(38:40,:),'r');
//  i1(3,:)=sum(ints.int1.ints(41:42,:),'r')./sum(ints.int1.mons(41:42,:),'r');
il=ints.int1.ints(35:42,:)./ints.int1.mons(35:42,:);

//// relative noise
//  i1nr(1,:)=sum(ints.int1.ints(35:37,:),'r').^-1+sum(ints.int1.mons(35:37,:),'r').^-1;
//  i1nr(2,:)=sum(ints.int1.ints(38:40,:),'r').^-1+sum(ints.int1.mons(38:40,:),'r').^-1;
//  i1nr(3,:)=sum(ints.int1.ints(41:42,:),'r').^-1+sum(ints.int1.mons(41:42,:),'r').^-1;

//// modelled hologram
//  i1m(1,:)=mean(hmod(35:37,:),'r');
//  i1m(2,:)=mean(hmod(38:40,:),'r');
//  i1m(3,:)=mean(hmod(41:42,:),'r');

//pause; 

// dividing by the integrated intensity
  //si1=mean(i1,'c')*ones(1,360);
  //si1nr=sum(i1n,'c')/360/360*ones(1,360)./si1.^2;
  
 // i1=i1./si1;
 // i1nr=i1nr+si1nr;
  
 // si1m=mean(i1m,'c')*ones(1,360);
 // i1m=i1m./si1m;
  
 // filti1=zeros(22,360);
 // filti1(12:14,1:360)=i1*0+1;

 //  tmph(12:14,1:360)=i1;
 // tmphfilt=filti1;
 // tmphmod(12:14,1:360)=i1m;
 // tmphn(12:14,1:360)=i1nr.*i1.^2;
 
 M.h1.k=2*%pi/1.18;
 M.h1.name='First measurement';
 M.h1.history=AddHistory('','sumpsi08','c:\mainsci\macros\psi08\allints.mat','1st_meas');
 M.h1.h=il;
 M.h1.q=G.q(35:42,:);
 M.h1.X=G.X(35:42,:);
 M.h1.Y=G.Y(35:42,:);
 M.h1.Z=G.Z(35:42,:);
 M.h1.filt=M.h1.X*0+1;
 M.h1.hmod=hmod(35:42,:);                                
 M.h1.mon=ints.int1.mons(35:42,:);
 M.h1.status='measurement';
 M.h1.operations='divide by monitor';
 
 //////////////////////////////SECOND MEASUREMENT ///////////////////////////
// holo measurements
  i2=zeros(22,360);
  i2n=i2;
  i2m=i2;
// intensity over monitor cnt

  i2=ints.int2.ints(ints.ths2(1,1):ints.ths2(1,2):ints.ths2(1,3),ints.phs2(1):ints.phs2(2))./ints.int2.mons(ints.ths2(1,1):ints.ths2(1,2):ints.ths2(1,3),ints.phs2(1):ints.phs2(2));
// relative noise
  i2nr=(ints.int2.ints(ints.ths2(1,1):ints.ths2(1,2):ints.ths2(1,3),ints.phs2(1):ints.phs2(2)).^-1+ints.int2.mons(ints.ths2(1,1):ints.ths2(1,2):ints.ths2(1,3),ints.phs2(1):ints.phs2(2)).^-1);

// hologram (modelled)
  i2m=hmod(ints.ths2(1,1):ints.ths2(1,2):ints.ths2(1,3),ints.phs2(1):ints.phs2(2));
  
// dividing by the integrated intensity
  si2=mean(i2,'c')*ones(1,360);
  i2=i2./si2;
  
 // i2=i2./si2;
 // i2nr=i2nr+si2nr;
 //filti2=i2*0+1;
//  tmph=tmph+i2;
 // tmphfilt=tmphfilt+filti2;
//  tmphmod=tmphmod+i2m;  
//  tmphn=tmphn+i2nr.*i2.^2;
  
 M.h2.k=2*%pi/1.18;
 M.h2.name='Second measurement';
 M.h2.history=AddHistory('','sumpsi08','c:\mainsci\macros\psi08\allints.mat','2nd_meas');
 M.h2.h=i2;                          
 M.h2.q=G.q(3:3:66,:);
 M.h2.X=G.X(3:3:66,:);
 M.h2.Y=G.Y(3:3:66,:);
 M.h2.Z=G.Z(3:3:66,:);
 M.h2.filt=M.h2.X*0+1;
 M.h2.hmod=hmod(3:3:66,:);                                
 M.h2.mon=ints.int2.mons(3:3:66,:);
 M.h2.status='measurement';
 M.h2.operations='divide by monitor;';
 
  
  ////////////////////////////////THIRD MEASUREMENT //////////////////////////////////////
 
 // 2nd holo measurement
  i3=zeros(5,90);
  i3n=i3;
  i3m=i3;
// intensity over monitor cnt
  //i3(1,1:90)=sum(ints.int3.ints(36:37,1:90),'r')./sum(ints.int3.mons(36:37,1:90),'r');
  //i3(2,1:90)=sum(ints.int3.ints(38:40,1:90),'r')./sum(ints.int3.mons(38:40,1:90),'r');
  //i3(3,1:90)=sum(ints.int3.ints(41:43,1:90),'r')./sum(ints.int3.mons(41:43,1:90),'r');
  //i3(4,1:90)=sum(ints.int3.ints(44:46,1:90),'r')./sum(ints.int3.mons(44:46,1:90),'r');
  //i3(5,1:90)=sum(ints.int3.ints(47:49,1:90),'r')./sum(ints.int3.mons(47:49,1:90),'r');
i3=ints.int3.ints(36:1:49,1:90)./ints.int3.mons(36:1:49,1:90);
// relative noise
  //i3nr(1,1:90)=sum(ints.int3.ints(36:37,1:90),'r').^-1+sum(ints.int3.mons(36:37,1:90),'r').^-1;
  //i3nr(2,1:90)=sum(ints.int3.ints(38:40,1:90),'r').^-1+sum(ints.int3.mons(38:40,1:90),'r').^-1;
  //i3nr(3,1:90)=sum(ints.int3.ints(41:43,1:90),'r').^-1+sum(ints.int3.mons(41:43,1:90),'r').^-1;
  //i3nr(4,1:90)=sum(ints.int3.ints(44:46,1:90),'r').^-1+sum(ints.int3.mons(44:46,1:90),'r').^-1;
  //i3nr(5,1:90)=sum(ints.int3.ints(47:49,1:90),'r').^-1+sum(ints.int3.mons(47:49,1:90),'r').^-1;

// hologram
  //i3m(1,1:90)=mean(hmod(36:37,1:90),'r');
  //i3m(2,1:90)=mean(hmod(38:40,1:90),'r');
  //i3m(3,1:90)=mean(hmod(41:43,1:90),'r');
  //i3m(4,1:90)=mean(hmod(44:46,1:90),'r');
  //i3m(5,1:90)=mean(hmod(47:49,1:90),'r');
  
  
// dividing by the integrated intensity
  //si3=mean(i3,'c')*ones(1,90);
  //si3nr=((sum(i3n,'c')/90/90)*ones(1,90))./si3.^2;
  
  //i3=i3./si3;
  //i3nr=i3nr+si3nr;
  //filti3=zeros(22,360);
  //filti3(12:16,1:90)=i3*0+1;
  //tmph(12:16,1:90)=tmph(12:16,1:90)+i3;
  //tmphfilt=tmphfilt+filti3;
  //tmphmod(12:16,1:90)=tmphmod(12:16,1:90)+i3m;
  //tmphn(12:16,1:90)=tmphn(12:16,1:90)+i3nr.*i3.^2;
  
   M.h3.k=2*%pi/1.18;
   M.h3.name='Third measurement';
   M.h3.history=AddHistory('','sumpsi08','c:\mainsci\macros\psi08\allints.mat','3th_meas');
   M.h3.h=i3;
   M.h3.q=G.q(36:1:49,1:90);
   M.h3.X=G.X(36:1:49,1:90);
   M.h3.Y=G.Y(36:1:49,1:90);
   M.h3.Z=G.Z(36:1:49,1:90);
   M.h3.filt=M.h3.X*0+1;
   M.h3.hmod=hmod(36:1:49,1:90);
   M.h3.mon=ints.int3.mons(36:1:49,1:90);
   M.h3.status='measurement';
   M.h3.operations='divide by monitor;';


  //G=MakeGrid(1.18,3,1,90,147,210,U);
  //h.h=tmph./tmphfilt;
  //h.hmod=tmphmod./tmphfilt;
  //h.var=tmphn./tmphfilt.^2;
  //h.X=G.X;
  //h.Y=G.Y;
  //h.Z=G.Z;
  //h.q=G.q;
  //h.filt=ones(22,360);

endfunction




