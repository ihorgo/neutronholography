// Written by Marton Marko
// marko@szfki.hu
// 
// function Four2DBgHolo makes a high-pass 2D fourier filtering, and divides the 
// original data by the filtered data, so the result will have:
//    non-harmonic background around 1 * (1 + holographic oscillation)
// inputs: 
//  h is a structure of hologram
//  phfilt is the lowest frequency to cut out in ph direction
//  thfilt is the lowest frequency to cut out in th direction

function h=Four2DBgHolo(h_old,phfilt,thfilt)
  
  order=1;
  this=0;
  h=h_old;
  h.history=AddHistory('','Four2DBgHolo',h_old,phfilt,thfilt);

  ierr=execstr('tmphh=h_old.h','errcatch');
  if ierr==0 then
    ss=size(tmphh);
    tmp=tmphh;
    ftmp=fft(tmp,-1);
    ftmp(:,phfilt+2:ss(2)-phfilt)=0;
    ftmp(thfilt+2:ss(1)-thfilt,:)=0;
    fftmp=real(fft(ftmp,1));
    tmp2=tmp./fftmp;
    h.h=tmp2;
  end;
  
  ierr=execstr('tmphh=h_old.hmod','errcatch');
  if ierr==0 then
    ss=size(tmphh);
    tmp=tmphh;
    ftmp=fft(tmp,-1);
    ftmp(:,phfilt+2:ss(2)-phfilt)=0;
    ftmp(thfilt+2:ss(1)-thfilt,:)=0;
    fftmp=real(fft(ftmp,1));
    tmp2=tmp./fftmp;
    h.hmod=tmp2;
  end;
  
endfunction

    
      
      
