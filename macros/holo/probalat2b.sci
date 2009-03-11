function a=probalat2b()


  itnum=10;
  U=MkUnitCell('PdH');
  ats=AtomPosCalc(U,4);
  ats.ats=[2 0 0 -1];

  h=ConstHolo(ats,1);
  pi=%pi;
  atssize=[4,2,2];
  orig=[0 0 0];
  atsarray=MkRecArray(3,0.1,atssize,orig);
  windowfunc=cos((atsarray.X-orig(1))/atssize(1)*pi).*cos((atsarray.Y-orig(1))/atssize(2)*pi).*cos((atsarray.Z-orig(3))/atssize(3)*pi);
  s=size(atsarray.X);
  tmpfi=zeros(s(1),s(2),s(3));
  smed=round((s(3)+1)/2);
  a=tmpfi;
  a2=a;
  rec=zeros(s(1),s(2),itnum+1,2);
  H=ReconstHoloArb(atsarray,h);
  sh=size(h.X);
  hh=zeros(sh(1),sh(2),itnum+1);
  hh(:,:,1)=h.hmod;
  rec(:,:,1,1)=H.Hmod(:,:,smed);

  for itn=1:itnum
    tmp=1+H.Hmod;
    tmpfi=D3('atan',imag(tmp),real(tmp));
//    stmp=size(H.Hmod)
//    stmp2d=[stmp(1),stmp(2)*stmp(3)];
//    tmp2d=matrix(1+H.Hmod,stmp2d);
//    tmpfi2d=atan(imag(tmp),real(tmp)); 
//    tmpfi=matrix(tmpfi2d,stmp)
    tmp2=real(tmp.*exp(%i*tmpfi*-1));
    a=1-tmp2;

//    tmpa2d=matrix(a,stmp2d)
//    stmpa2d=(sign(tmpa2d)-1)/2;
    tmpasig=(D3('sign',a)-1)/2;
    a2=a+a.*tmpasig; 
//    a2=matrix(stmp);

    atsarray.rec=((1-a2).*exp(%i*tmpfi)-1).*windowfunc;
    rec(:,:,itn,2)=atsarray.rec(:,:,smed);

    h=ConstHoloCompl(atsarray,1);
    H=ReconstHoloArb(atsarray,h);
    hh(:,:,itn+1)=h.hmod;
    rec(:,:,itn+1,1)=H.Hmod(:,:,smed);
    save('c:\users\murci\iratok\cikkeim\commenttwin\probalatsci2bwindow2.dat',rec,hh,itnum,H,h);
  end;
  a=1;
endfunction
