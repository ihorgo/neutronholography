function s=allsize(a)
  
  ss=size(a);
  sss=max(size(ss));
  s=ss(1);
  for n=2:sss
    s=s*ss(n);
  end;
endfunction

