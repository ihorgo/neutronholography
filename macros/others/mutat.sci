function mutat(varargin)
  
  select length(varargin)
    case 1 then
      fid=1;
      f=scf(fid);
      clf;
      i=varargin(1);
      m=2;
    case 2 then
      i=varargin(1);
      m=2;
      fid=varargin(2);
      f=scf(fid);
      clf;
    case 4 then
      i=varargin(4);
      m=3;
      fid=1;
      f=scf(fid);
      clf;
    case 5 then
      i=varargin(4);
      m=3;
      fid=varargin(5);
      f=scf(fid);
      clf;
  end;
  f.visible="off";
  colorbar(min(i),max(i));
  f.auto_resize="off";
  col=zeros(32,3);
  col(1:16,3)=[16:-1:1]';
  col(1:16,2)=[1:16]';
  col(17:32,2)=[16:-1:1]';
  col(17:32,1)=[1:16]';
  col=col/16;

  if m==2
    surf(i);
    f.color_map=col;
    f.children(2).children.color_mode=-2;
    f.children(2).rotation_angles=[0,270];
    f.visible="on"
  else
    x=varargin(1);
    y=varargin(2);
    z=varargin(3);
    s=size(x);
    s1=s(2)+1;
    x(:,s1)=x(:,1);
    y(:,s1)=y(:,1);
    z(:,s1)=z(:,1);
    i(:,s1)=i(:,1);
    surf(x,y,z,i);
    f.color_map=col;
    f.children(2).children.color_mode=-2;
    f.auto_resize="off";
    f.axes_size(1)=f.axes_size(2);
    f.visible="on"
  end;
endfunction

    
    
    
