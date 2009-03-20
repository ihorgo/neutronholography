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
  

function h=FourBgHolo(h_old,phfilt,varargin)
  
  order=1;
  this=0;
  h=h_old;
  select length(varargin)
    case 2 then
      h.history=AddHistory('','FourBgHolo',h_old,phfilt,varargin(1),varagin(2));
      if varargin(2)==-1 then
        order=-1;
      end;
      thfilt=varargin(1);
      this=1;
    case 1 then
      h.history=AddHistory('','FourBgHolo',h_old,phfilt,varargin(1));
      thfilt=varargin(1);
      this=1;
    else
      h.history=AddHistory('','FourBgHolo',h_old,phfilt);
  end;

  ierr=execstr('tmphh=h_old.h','errcatch');
  if ierr==0 then
    
    ss=size(tmphh);
  // if the order is default (or there is no filtering in th direction
    if order==1 then
      tmp=mean(tmphh,'r');
      ftmp=fft(tmp,-1);
      ftmp(1,phfilt+2:ss(2)-phfilt)=0;
      fftmp=fft(ftmp,1);
      h.h=h.h./(ones(ss(1),1)*fftmp);
    end;
  // if there is filtering in th direction 
    if this==1 then
      tmp=mean(tmphh,'c');
      ftmp=fft(tmp,-1);
      ftmp(thfilt+2:ss(1)-thfilt)=0;
      fftmp=fft(ftmp,1);
      h.h=h.h./(fftmp*ones(1,ss(2)));
    end;
  // if the order is reversse
    if order==-1 then
      tmp=mean(tmphh,'r');
      ftmp=fft(tmp,-1);
      ftmp(1,phfilt+2:ss(2)-phfilt)=0;
      fftmp=fft(ftmp,1);
      h.h=h.h./(ones(ss(1),1)*fftmp);
    end;
  end;

  ierr=execstr('tmphh=h_old.hmod','errcatch');
  if ierr==0 then
    
    ss=size(tmphh);
  // if the order is default (or there is no filtering in th direction
    if order==1 then
      tmp=mean(tmphh,'r');
      ftmp=fft(tmp,-1);
      ftmp(1,phfilt+2:ss(2)-phfilt)=0;
      fftmp=fft(ftmp,1);
      h.hmod=h.hmod./(ones(ss(1),1)*fftmp);
    end;
  // if there is filtering in th direction 
    if this==1 then
      tmp=mean(tmphh,'c');
      ftmp=fft(tmp,-1);
      ftmp(thfilt+2:ss(1)-thfilt)=0;
      fftmp=fft(ftmp,1);
      h.hmod=h.hmod./(fftmp*ones(1,ss(2)));
    end;
  // if the order is reversse
    if order==-1 then
      tmp=mean(tmphh,'r');
      ftmp=fft(tmp,-1);
      ftmp(1,phfilt+2:ss(2)-phfilt)=0;
      fftmp=fft(ftmp,1);
      h.hmod=h.hmod./(ones(ss(1),1)*fftmp);
    end;
  end;
endfunction

    
      
      
