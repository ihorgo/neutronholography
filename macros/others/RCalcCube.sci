function out=RCalcCube(A,res,rres,C)
  
  s=size(A);
  rp2=([1:s(1)]'-C(1)).^2*ones(1,s(2))+ones(s(1),1)*([1:s(2)]-C(2)).^2;
  mr=max(rp2);
  if max(size(s))==2
    s(3)=1;
    C(3)=1;
  end;
  r2=real(A)*0;
  for z=1:s(3)
 //   disp(z);
// pause;
    zc2=(z-C(3))^2;
    r2(1:s(1),1:s(2),z)=rp2+zc2;
  end;
  mr=max(r2);
//  A=A.*exp(%i*2*%pi/1.18*(r2.^0.5));
  maxch=ceil(mr^0.5/res);
  filt=A*0;
  e=1e-6;
  for nch=1:maxch
    mr=((nch-1)*res)^2+e;
    Mr=(nch*res)^2+e;
    filt=ceil(sign(r2-mr)/2-sign(r2-Mr)/2);
    pnum=sum(filt);
    tmpi=real(A.*filt);
    tmpi2=imag(A.*filt);
    sumint=sum((real(tmpi)))/pnum;
    sumint2=sum((real(tmpi2)))/pnum;
    out(nch,1:6)=[nch*rres,max(tmpi),min(tmpi),sumint,sumint2,pnum];
  end;
endfunction;

