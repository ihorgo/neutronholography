function A=psi08mutatall()
  
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
    X=[-50:50]'*ones(1,101)/30*4;
    Y=ones(101,1)*[-50:50]/30*4;
for nn=1:15:46
  Z=X*0+(nn-1)/30*4;
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
  
//  mutat(X,Y,Z,hs/30,1);
//pause;
//  mutatb(X,Y,Z,hss/30,2);
//  mutatb(X,Y,Z,hsmod,3);
//  mutatb(X,Y,Z,hssmod,4);
//  mutatb(X,Y,Z,hs/30+hss/30,5);
//  mutatb(X,Y,Z,hsmod+hssmod,6);
//  mutatb(X,Y,Z,(hs+hss).*(hsmod+hssmod),7);
pause;
A.hs(1:101,1:101,(nn-1)/15+1)=hs;
A.hss(1:101,1:101,(nn-1)/15+1)=hss;
A.hsmod(1:101,1:101,(nn-1)/15+1)=hsmod;
A.hssmod(1:101,1:101,(nn-1)/15+1)=hssmod;
end;
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

    
  
  
