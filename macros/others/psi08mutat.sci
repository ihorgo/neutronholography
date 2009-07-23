function psi08mutat(nn,varargin)
  
  if length(varargin)==2
    H.Hs=varargin(1);
    Hsourc.Hs=varargin(2);
  else
    f='c:\mainsci\macros\psi08\recpsiph1line.dat';
    load(f);
    H.H=H1;
    H.Hs=H1s;
    Hmod.Hs=H1s;
    clear H1s;
    clear H1;
    f='c:\mainsci\macros\psi08\recpsiph1sourcline.dat';
    load(f);
    Hsourc.H=H1;
    Hsourc.Hs=H1s;
    clear H1s;
    clear H1;
    f='c:\mainsci\macros\psi08\recpsibiph1line.dat';
//    f='c:\mainsci\macros\psi08\mod090429.dat';
    load(f);
    H.Hs.Hmod=H1s.H;
    Hsourc.Hs.Hmod=H1s.Hmod;
    clear H1s;
    clear H1;
  end;
//  ttmp=H.Hs.H(:,:,nn)+Hsourc.Hs.H(:,:,nn); 
  ttmp=H.Hs.H(:,:,nn); 
  tmp(51:101,51:101)=ttmp; 
  tmp(1:51,51:101)=ttmp(:,51:-1:1)';  
  tmp(51:101,1:51)=ttmp(51:-1:1,:)'; 
  tmp(1:51,1:51)=ttmp(51:-1:1,51:-1:1);
//  tmp=real(H.H.H(:,:,nn)); 
  hs=tmp;
//  mutat(tmp,1);  

  ttmp=H.Hs.Hmod(:,:,nn); 
  tmp(51:101,51:101)=ttmp; tmp(1:51,51:101)=ttmp(:,51:-1:1)';  
  tmp(51:101,1:51)=ttmp(51:-1:1,:)'; 
  tmp(1:51,1:51)=ttmp(51:-1:1,51:-1:1);
//  tmp=real(H.H.Hmod(:,:,nn)); 
  hsmod=tmp;
  ttmp=Hsourc.Hs.H(:,:,nn); 
  tmp(51:101,51:101)=ttmp; tmp(1:51,51:101)=ttmp(:,51:-1:1)';  
  tmp(51:101,1:51)=ttmp(51:-1:1,:)'; 
  tmp(1:51,1:51)=ttmp(51:-1:1,51:-1:1);
//  tmp=real(H.H.Hmod(:,:,nn)); 
  hss=tmp;
//  mutat(tmp.*(-1+sign(tmp)),2)
//  mutat(tmp,2)

//  ttmp=Hmod.Hs.H(:,:,nn); 
  ttmp=Hsourc.Hs.Hmod(:,:,nn); 
  tmp(51:101,51:101)=ttmp; 
  tmp(1:51,51:101)=ttmp(:,51:-1:1)';  
  tmp(51:101,1:51)=ttmp(51:-1:1,:)'; 
  tmp(1:51,1:51)=ttmp(51:-1:1,51:-1:1);  
//  tmp=real(Hsourc.H.H(:,:,nn)); 
  hssmod=tmp;
//  mutat(tmp,3);  

//  ttmp=Hsourc.Hs.Hmod(:,:,nn); 
//  tmp(51:101,51:101)=ttmp; tmp(1:51,51:101)=ttmp(:,51:-1:1)';  
//  tmp(51:101,1:51)=ttmp(51:-1:1,:)'; 
//  tmp(1:51,1:51)=ttmp(51:-1:1,51:-1:1);
////  tmp=real(Hsourc.H.Hmod(:,:,nn)); 
//  hssmod=tmp
////  mutat(tmp,4)
  
  mutat(hs/30,1);
  mutat(hss/30,2);
  mutat(hsmod,3);
  mutat(hssmod,4);
  mutat(hs/30+hss/30,5);
  mutat(hsmod+hssmod,6);
  mutat((hs+hss).*(hsmod+hssmod),7);
//  mutat(hss+hs,3);

//  mutat((hsmod).*(-1+sign(hsmod)),2);
//  mutat((hs).*(1+sign(hs)),1);
//  mutat((hss).*(1+sign(hss)),2);
//  mutat((hsmod).*(1+sign(hsmod)),3);
//  mutat((hsmods).*(1+sign(hsmods)),4);

//  mutat((hsmod).*(1+sign(hsmod)),2);
//  mutat((hs).*(1+sign(hs)),1);
//  mutat((hss).*(1+sign(hss)),3);

//  mutat(abs(hsmod).^2,2);
//  mutat(abs(hs).^2,1);
//  mutat(abs(hss).^2,3);

//  mutat(abs(hsmod),2);
//  mutat(abs(hs),1);
//  mutat(abs(hss),3);

//    mutat((hs).*hsmod,5);
//    mutat((hss).*hsmods,6);
//  mutat((hs+hss).*(hsmod+hsmods),7);

//  mutat((hs+hss),5);
endfunction;

    
  
  
