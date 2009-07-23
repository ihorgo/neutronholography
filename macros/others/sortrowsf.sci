function o=sortrowsf(A,sortnum,d,varargin)
  
  s=size(A);
  tmpa=[round(A*10^d),A];
  if length(varargin)==0  
    tmpa=sortrows(tmpa,sortnum);
  else
    tmpa=sortrows(tmpa,sortnum,varargin(1));
  end;
  
  o=tmpa(:,s(2)+1:$);
endfunction


