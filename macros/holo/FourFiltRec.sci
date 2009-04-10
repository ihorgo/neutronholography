function Hf=FourFiltRec(H,rm,rM)

// Image processing procedures
 
  Hf=H;
  if execstr('hol=H.H','errcatch')==0;
    s=size(hol);
    steps=[1,s(1),s(1)*s(2)];
    sizes=s(1)*s(2)*s(3);
    fhol=matrix(fftw(hol(1:sizes),-1,s,steps),s);
    C=ceil(s/2); // centre of the Fourier space
    Cm=C-1; // position of f=-1
    E=ceil(s/2+0.1); // highest positive frequency
    B=E+1; // highest negative frequency 
    for nn=1:s(3)
      rr(1:s(1),1:s(2),nn)=((nn-C(3)).^2+([1:s(1)]'*ones(1,s(2))-C(2)).^2+(ones(s(1),1)*[1:s(3)]-C(1)).^2).^0.5;
    end;
    pp=(1-D3('sign',rM-rr))/2;
    pp2=(1+D3('sign',rm-rr))/2;
    filt=sign(pp+pp2);

    filt2=1-filt([C(1):s(1),1:Cm(1)],[C(2):s(2),1:Cm(2)],[C(3):s(3),1:Cm(3)]);
    Hf.fmeas=fhol;
    fhol=fhol.*filt2;
    Hf.fmeasfilt=fhol;
    ffhol=matrix(fftw(fhol(1:sizes),1,s,steps),s);

    hol=hol-ffhol;
    Hf.H=hol;
  end;
  
  if execstr('hol=H.Hmod','errcatch')==0;
    s=size(hol);
    steps=[1,s(1),s(1)*s(2)];
    sizes=s(1)*s(2)*s(3);
    fhol=matrix(fftw(hol(1:sizes),-1,s,steps),s);
    C=ceil(s/2); // centre of the Fourier space
    Cm=C-1; // position of f=-1
    E=ceil(s/2+0.1); // highest positive frequency
    B=E+1; // highest negative frequency 
    for nn=1:s(3)
      rr(1:s(1),1:s(2),nn)=((nn-C(3)).^2+([1:s(1)]'*ones(1,s(2))-C(2)).^2+(ones(s(1),1)*[1:s(3)]-C(1)).^2).^0.5;
    end;
    pp=(1-D3('sign',rM-rr))/2;
    pp2=(1+D3('sign',rm-rr))/2;
    filt=sign(pp+pp2);

    filt2=1-filt([C(1):s(1),1:Cm(1)],[C(2):s(2),1:Cm(2)],[C(3):s(3),1:Cm(3)]);
    Hf.fmod=fhol;
    fhol=fhol.*filt2;
    Hf.fmodfilt=fhol;
    ffhol=matrix(fftw(fhol(1:sizes),1,s,steps),s);

    hol=hol-ffhol;
    Hf.Hmod=hol;
  end;

endfunction

        

