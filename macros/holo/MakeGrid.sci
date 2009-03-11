// MakeGrid function makes matrices of X,Y,Z coordinates of a grid on a surface
// of the spheres of the k-space with radius of 2*%pi/wl(i), and the weight of 
// each point
// G.X, G.Y, G.Z are the coordinate matrices
// G.q, is the weight matrix
// the 0 point of theta is at the equator (it goes from -90 to 90
// thres and phres are the steps in theta and phi
// G.k is the vector of radiuses of the spheres. in 1/AA
//
//Compulsory arguments in order: wavelength, theta res., phi res., omega
//Varargins in preferred order: twotheta, minth, maxth, U (any of them can be excluded)

function G=MakeGrid(wl,thres,phres, om, varargin)
  omega=om/180*%pi;
 
  G.name='MakeGrid';

  k=2*%pi./wl;
  G.k=k;
//START INPUT ARGUMENT PROCESSING 
  select length(varargin)
    case 0      //Detector inside case, default theta
      G.history=AddHistory('','MakeGrid',wl,thres,phres,om);    // writing history;
      maxth=90;
      minth=-90;
      U=eye(3,3);
    
    case 1      
      if type(varargin(1)) == 1 then  //Source inside case, default theta, NO Umatrix
        G.history=AddHistory('','MakeGrid',wl,thres,phres,om,varargin(1));
        omega=omega-varargin(1);
        maxth=90;
        minth=-90;
        U=eye(3,3);
      else                           //Detector inside case, default theta, WITH Umatrix
        G.history=AddHistory('','MakeGrid',wl,thres,phres,om,varargin(1).name);
        maxth=90;
        minth=-90;
        U=varargin(1).U;
      end;
            
    case 2     
      if type(varargin(1))==1 & type(varargin(2))==1 then    //Detector inside case, arbitrary theta, without Umatrix
        maxth=max(varargin);
        minth=min(varargin);
        U=eye(3,3);
        G.history=AddHistory('','MakeGrid',wl,thres,phres,om,minth,maxth);    // writing history
      else                                   //Source inside case, default theta, with Umatrix
        if type(varargin(1))==1 then
          G.history=AddHistory('','Makegrid',wl,thres,phres,om,varargin(1),varargin(2).name);
          omega=omega-varargin(1);
          maxth=90;
          minth=-90;
          U=varargin(2).U;
        else
          G.history=AddHistory('','Makegrid',wl,thres,phres,om,varargin(2),varargin(1).name);
          omega=omega-varargin(2);
          maxth=90;
          minth=-90;
          U=varargin(1).U;
        end;
      end;
          
    case 3     
      if type(varargin(1))==1 & type(varargin(2))==1 & type(varargin(3))==1 then   //Source inside case, arbitrary theta, WITHOUT Umatrix
        omega=omega-varargin(1);
        maxth=max(varargin(2:3));
        minth=min(varargin(2:3));
        U=eye(3,3);
        G.history=AddHistory('','MakeGrid',wl,thres,phres,om,varargin(1),minth,maxth);
      else                                                                           //Detector inside case, arbitrary theta, WITH Umatrix
        if type(varargin(1)) ==1 then
          maxth=max(varargin(1:2));
          minth=min(varargin(1:2));
          U=varargin(3).U;
          G.history=AddHistory('','MakeGrid', wl,thres,phres,om,minth,maxth,varargin(3).name);
        else
          maxth=max(varargin(2:3));
          minth=min(varargin(2:3));
          U=varargin(1).U;
          G.history=AddHistory('','MakeGrid',wl,thres,phres,om,minth,maxth,varargin(1).name);
        end;
      end;
    
    case 4   //Source inside, arbitrary theta, WITH Umatrix
      omega=omega-varargin(1);
      minth=min(varargin(2:3));
      maxth=max(varargin(2:3));
      U=varargin(4).U;
      G.history=AddHistory('','MakeGrid',wl,thres,phres,om,varargin(1),minth,maxth,varargin(4).name);
  end;
// END OF INPUT ARGUMENT PROCESSING    

  thl=[minth:thres:maxth]'/180*%pi;
  phl=[0:phres:360-phres]/180*%pi;
  tsize=size(thl,1);
  psize=size(phl,2);

  cosOmega=cos(omega)*ones(tsize,psize);
  sinOmega=sin(omega)*ones(tsize,psize);
  
  cosPhi=cos( ones(tsize,1)*phl);
  sinPhi=sin( ones(tsize,1)*phl);
  
  cosTheta=cos(thl*ones(1,psize));
  sinTheta=sin(thl*ones(1,psize));
   
  Xmatrix=-1*(sinOmega.*cosTheta.*cosPhi) - sinPhi.*cosOmega;
  Ymatrix=-1*(sinOmega.*cosTheta.*sinPhi) + cosPhi.*cosOmega;
  Zmatrix=-1*(sinTheta.*sinOmega);
  
  UI=inv(U);
  XmatrixUI=UI(1,1)*Xmatrix+UI(1,2)*Ymatrix+UI(1,3)*Zmatrix;
  YmatrixUI=UI(2,1)*Xmatrix+UI(2,2)*Ymatrix+UI(2,3)*Zmatrix;
  ZmatrixUI=UI(3,1)*Xmatrix+UI(3,2)*Ymatrix+UI(3,3)*Zmatrix;
  
  for p=1:max(size(k))
    G.X(1:tsize,1:psize,p)=k(p)*XmatrixUI;
    G.Y(1:tsize,1:psize,p)=k(p)*YmatrixUI;
    G.Z(1:tsize,1:psize,p)=k(p)*ZmatrixUI;
  end;

  theta2=acos(Zmatrix);
  deltateta=theta2;
  deltateta(2:tsize-1,:)=(theta2(3:tsize,:)-theta2(1:tsize-2,:))/2;
  deltateta(1,:)=theta2(2,:)-theta2(1,:);
  deltateta(tsize,:)=theta2(tsize,:)-theta2(tsize-1,:);
  G.q=abs(sin(theta2).*deltateta);
 
  
endfunction
  
