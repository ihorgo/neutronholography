// Written by Marton Marko
// marko@szfki.hu
// 
// Function MkRecArray(dim,res,r,[orig,[T]])

function atsarr=MkRecArray(dim,res,r,varargin);
  
  atsarr.name='atsarr';
  select length(varargin)
    case 0 then
      atsarr.history=AddHistory('','MkRecArray',dim,res,r);
      orig=[0 0 0];
      T=eye(3,3);
    case 1 then
      atsarr.history=AddHistory('','MkRecArray',dim,res,r,varargin(1));
      orig=varargin(1);
      T=eye(3,3);
    case 2 then
      atsarr.history=AddHistory('','MkRecArray',dim,res,r,varargin(1),varargin(2));
      orig=varargin(1);
      T=varargin(2);
      for n=1:3
        if norm(T(n,:))>0
          T(n,:)=T(n,:)/norm(T(n,:));
        end;
      end;
      
  end;
  select max(size(r))
    case 1 then
      sizex=round(2*r(1)/res);
      r(2)=r(1);
      r(3)=r(1);
      sizey=sizex;
      sizez=sizex;
    case 2 then
      sizex=round(2*r(1)/res);
      sizey=round(2*r(2)/res);
      r(3)=r(2);
      sizez=sizey;
    case 3 then
      sizex=round(2*r(1)/res);
      sizey=round(2*r(2)/res);
      sizez=round(2*r(3)/res);
  end;
  
  select dim
    case 0 then // Grid on a sphere
      G=MakeGrid(2*pi/sizex,res,res,90);
      X=G.X;
      Y=G.Y;
      Z=G.Z;
    case 1 then
      X=[0:sizex]'*res-r(1);
      Y=X*0;
      Z=X*0;
    case 2 then
      X=[0:sizex]'*res*ones(1,sizey+1)-r(1);
      Y=ones(sizex+1,1)*[0:sizey]*res-r(2);
      Z=X*0;
    case 3 then
      for n=1:sizez+1
        X(1:sizex+1,1:sizey+1,n)=[0:sizex]'*res*ones(1,sizey+1)-r(1);
        Y(1:sizex+1,1:sizey+1,n)=ones(sizex+1,1)*[0:sizey]*res-r(2);
        Z(1:sizex+1,1:sizey+1,n)=(n-1)*res-r(3);
      end;
  end;
 
  atsarr.rec=X*0;
  
// rotation and shifting the origin

  atsarr.X=X*T(1,1)+Y*T(2,1)+Z*T(3,1)+orig(1);
  atsarr.Y=X*T(1,2)+Y*T(2,2)+Z*T(3,2)+orig(2);
  atsarr.Z=X*T(1,3)+Y*T(2,3)+Z*T(3,3)+orig(3);
endfunction

    
