function H=ReconstHoloPt(h,r,varargin)
  
// if the third input is 1 then the reconstruction uses 
// simple Fourier-transformation, (exp(ik_r_))
// if it is 0 or it is missing, or the hologram was measured
// using more than 1 wavelength then the reconstruction procedure uses
// the inverse of the basic holographic equation (exp(ik_r_-ikr))


  if length(varargin)==1
    four=varargin(1);
  else
    four=0;
  end;
  if max(size(h.k))>1
    four=0;
  end;

  swl=max(size(h.k));
  // reconstruction  
  ierr=execstr('hol=h.h','errcatch');
  if ierr==0    
    for n=1:swl
      if four==0
        eikr=exp(-1*%i*norm([h.X(1,1,n),h.Y(1,1,n),h.Z(1,1,n)])*norm(r))
        hol(:,:,n)=hol(:,:,n)*eikr;
      end;
      H(n,1)=sum(hol(:,:,n).*exp(%i*(h.X(:,:,n)*r(1)+h.Y(:,:,n)*r(2)+h.Z(:,:,n)*r(3))));
    end;
    H(swl+1,1)=sum(H(1:swl));
  else
    H(1:swl+1,1)=0;
  end;
  ierr=execstr('hol=h.hmod','errcatch');
  if ierr==0    
    for n=1:swl
      if four==0
        eikr=exp(-1*%i*norm([h.X(1,1,n),h.Y(1,1,n),h.Z(1,1,n)])*norm(r))
        hol(:,:,n)=hol(:,:,n)*eikr;
      end;
      H(n,2)=sum(hol(:,:,n).*exp(%i*(h.X(:,:,n)*r(1)+h.Y(:,:,n)*r(2)+h.Z(:,:,n)*r(3))));
    end;
    H(swl+1,2)=sum(H(1:swl,2));
  else
    H(1:swl+1,2)=0;
  end;
  
endfunction

