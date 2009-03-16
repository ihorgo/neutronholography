function out=D3(funname,varargin)
  
  s=size(varargin(1));
  s2=[s(1),s(2)*s(3)];
  select length(varargin)
    case 1 then
    tmp21=matrix(varargin(1),s2);
    execstr('out2='+funname+'('+'tmp21'+')');
    
    case 2 then
    tmp21=matrix(varargin(1),s2);
    tmp22=matrix(varargin(2),s2);
    execstr('out2='+funname+'('+'tmp21'+','+'tmp22'+')');

    case 2 then
    tmp21=matrix(varargin(1),s2);
    tmp22=matrix(varargin(2),s2);
    tmp23=matrix(varargin(3),s2);
    execstr('out2='+funname+'('+'tmp21'+','+'tmp22'+'tmp23'+')');
  end;
  out=matrix(out2,s);
endfunction


