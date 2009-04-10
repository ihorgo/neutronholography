// Written by Marton Marko
// marko@szfki.hu
// 
// function FourBgHolo makes a high-pass fourier filtering, and divides the 
// original data by the filtered data, so the result will have:
//    non-harmonic background around 1 * (1 + holographic oscillation)
// inputs: 
//  h is a structure of hologram
//  phfilt is the highest frequency to cut out in ph direction
//  varargin(1) is the highest frequency to cut out in th direction
//  varargin(2) the order of cutting out default is 1 (ph-th), -1 is th-ph,
  

function h=FourBgHolorow(h_old,phfilt)
  
  order=1;
  this=0;
  h=h_old;
  h.history=AddHistory('','FourBgHolorow',h_old,phfilt);
 
  ierr=execstr('tmphh=h_old.h','errcatch');
  if ierr==0 then   
    ss=size(tmphh);
    ftmp=fft(tmphh,-1,ss(2),ss(1));
    ftmp(:,phfilt+2:ss(2)-phfilt)=0;
    fftmp=fft(ftmp,1,ss(2),ss(1));
    h.h=h.h./fftmp;
  end;

  ierr=execstr('tmphh=h_old.hmod','errcatch');
  if ierr==0 then
    ss=size(tmphh);
    ftmp=fft(tmphh,-1,ss(2),ss(1));
    ftmp(:,phfilt+2:ss(2)-phfilt)=0;
    fftmp=fft(ftmp,1,ss(2),ss(1));
    h.hmod=h.hmod./fftmp;
  end;
endfunction

    
      
      
