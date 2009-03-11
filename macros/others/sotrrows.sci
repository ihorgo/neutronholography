function A=sotrrows(a,varargin);
  
  if length(varargin)>0
    indices=varargin;
    ss=size(indices);
    if ss(1)>ss(2) then
      indices=indices';
      ss=size(indices);
    end;
  else
    indices=1;
    ss=[1,1];
  end;
  
  tmpa=[a(:,indices),a];
  if length(varargin)==2 then
    tmpa=gsort(tmpa,'lr',varargin(2));
  else
    tmpa=gsort(tmpa,'lr');
  end;
  a=tmpa(:,ss(2)+1:$);
endfunction;

  
