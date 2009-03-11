function A=sortrows(a,varargin);
  
  if length(varargin)>0
    indices=varargin(1);
    ss=size(indices);
    as=size(a);
    if ss(1)>ss(2) then
      indices=indices';
      ss=size(indices);
    end;
    if ss(2)>as(2) then
      disp('WARNING: the number of indices are larger than the size of a')
    end;
    if max(indices)>as(2) then
      disp('ERROR: there is larger index than the size of a')
      abort;
    end;
  else
    indices=1;
    ss=[1,1];
  end;
  
  tmpa=[a(:,indices),a];
  if length(varargin)==2 then
    tmpa=gsort(tmpa,'lr',varargin(2));
  else
    tmpa=gsort(tmpa,'lr','i');
  end;
  A=tmpa(:,ss(2)+1:$);
endfunction

  
