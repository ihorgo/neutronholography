function out=MutatHoloCube(H,nn)

  ierr=execstr('tmphh=H.H','errcatch');
  if ierr==0
    s=size(tmphh);
    mm=s(1);
    mp=mm+1;
    tmph=(tmphh(:,:,nn)+tmphh(:,:,mp-nn))/2; 
    tmph=PlaneSymmRot4(tmph(:,:,1)); 
    tmph=(tmph+tmph(mm:-1:1,:)+tmph(:,mm:-1:1))/3;
    h=tmph;
    tmph=permute(tmphh(:,nn,:)+tmphh(:,mp-nn,:),[1,3,2])/2; 
    tmph=PlaneSymmRot4(tmph(:,:,1)); 
    tmph=(tmph+tmph(mm:-1:1,:)+tmph(:,mm:-1:1))/3;
    h=h+tmph
    tmph=permute(tmphh(nn,:,:)+tmphh(mp-nn,:,:),[3,2,1]); 
    tmph=PlaneSymmRot4(tmph(:,:,1)); 
    tmph=(tmph+tmph(mm:-1:1,:)+tmph(:,mm:-1:1))/3;
    h=h+tmph
    h=h/3;
    mutat(real(h),1);
    out.H=h;
  end;
  ierr=execstr('tmphh=H.Hmod','errcatch');
  if ierr==0
    s=size(tmphh);
    mm=s(1);
    mp=mm+1;
    tmph=(tmphh(:,:,nn)+tmphh(:,:,mp-nn))/2; 
    tmph=PlaneSymmRot4(tmph(:,:,1)); 
    tmph=(tmph+tmph(mm:-1:1,:)+tmph(:,mm:-1:1))/3;
    h=tmph;
    tmph=permute(tmphh(:,nn,:)+tmphh(:,mp-nn,:),[1,3,2])/2; 
    tmph=PlaneSymmRot4(tmph(:,:,1)); 
    tmph=(tmph+tmph(mm:-1:1,:)+tmph(:,mm:-1:1))/3;
    h=h+tmph
    tmph=permute(tmphh(nn,:,:)+tmphh(mp-nn,:,:),[3,2,1]); 
    tmph=PlaneSymmRot4(tmph(:,:,1)); 
    tmph=(tmph+tmph(mm:-1:1,:)+tmph(:,mm:-1:1))/3;
    h=h+tmph
    h=h/3;
    mutat(real(h),2);
    out.Hmod=h;
  end;
  out.nn=nn;
endfunction

 
