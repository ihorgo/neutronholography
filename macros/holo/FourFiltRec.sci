function Hf=FourFiltRec(H,rm,rM)

// Image processing procedures
 
  Hf=H;
  if execstr('hol=H.H','errcatch')==0;
    s=size(hol);
    steps=[1,s(1),s(1)*s(2)];
    sizes=s(1)*s(2)*s(3);
    fhol=matrix(fftw(hol(1:sizes),-1,s,steps),s);

    ffhol=matrix(fftw(fhol(1:sizes),1,s,steps),s);
    hol=hol-ffhol;
    Hf.H=hol;
  end;
  
  if execstr('hol=H.Hmod','errcatch')==0;
    s=size(hol);
    steps=[1,s(1),s(1)*s(2)];
    sizes=s(1)*s(2)*s(3);
    
    fhol=matrix(fftw(hol(1:sizes),-1,s,steps),s);
    s2=s+[0.01,0.01,0.01];
    for nn=1:s(3)
      rr(1:s(1),1:s(2),nn)=((nn-floor(s2(3)/2)).^2+([1:s(1)]'*ones(1,s(2))-floor(s2(2)/2)).^2+(ones(s(1),1)*[1:s(3)]-floor(s2(3)/2)).^2).^0.5;
    end;
    pp=(1-D3('sign',rr-rM))/2;
    pp2=(1+D3('sign',rr-rm))/2;
    filt=ceil(pp.*pp2);
    filt2=filt([ceil(s2(1)/2):s(1),1:floor(s2(1)/2)],[ceil(s2(2)/2):s2(2),1:floor(s2(2)/2)],[ceil(s2(3)/2):s2(3),1:floor(s2(3)/2)]);
    fhol=fhol.*filt;
    ffhol=matrix(fftw(fhol(1:sizes),1,s,steps),s);
    hol=hol-ffhol;
    Hf.H=hol;
  end;

endfunction

        

