function out=PlaneSymmRot4(a);
  
  tmps=size(a);
  s=tmps(1);
  out=(a+a(1:s,s:-1:1)'+a(s:-1:1,1:s)'+a(s:-1:1,s:-1:1))/4;
endfunction

