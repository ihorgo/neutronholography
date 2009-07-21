// MakeGrid function makes matrices of X,Y,Z coordinates of a grid on a surface
// of the spheres of the k-space with radius of 2*%pi/wl(i), and the weight of 
// each point
// G.X, G.Y, G.Z are the coordinate matrices
// G.q, is the weight matrix
// the 0 point of theta is at the equator (it goes from -90 to 90
// thres and phres are the steps in theta and phi
// G.k is the vector of radiuses of the spheres. in 1/AA

function G=MakeGridUj(wl,thres,phres,twotheta,omega,varargin)
 
  G.name='MakeGridUj';

  k=2*%pi./wl;
  G.k=k;
  if length(varargin)==0 then
// writing history;
    G.history=AddHistory('','MakeGrid',wl,thres,phres);
    maxth=90;
    minth=-90;
  else
    maxth=max(varargin);
    minth=min(varargin);
// writing history;
    G.history=AddHistory('','MakeGrid',wl,thres,phres,minth,maxth);  
  end;
  //disp(varargin);
  
  
  thl=[minth:thres:maxth]'/180*%pi;    //Theta VECTOR
  phl=[0:phres:360-phres]/180*%pi;     //Phi VECTOR
  
  theta=twotheta/2;
  TM=[cos(theta), sin(theta), 0;-sin(theta), cos(theta), 0;0,0,1];
  OM=[cos(omega), sin(omega), 0;-sin(omega), cos(omega), 0;0,0,1];
  
  TMI=inv(TM);
  OMI=inv(OM);
  
  U=eye(3);
  
  for p=1:size(thl)     //Step in Theta
    for q=1:size(phl)    //Step in Phi
      FM=[cos(phl(q)),sin(phl(q)),0; -sin(phl(q)),cos(phl(q)),0; 0,0,1];
      XM=[cos(thl(p)),0,sin(thl(p)); 0,1,0; -sin(thl(p)),0,cos(thl(p))];
      
      FMI=inv(FM);
      XMI=inv(XM);
      
      vc=UI*FMI*XMI*TMI*OMI*[0;k;0];
      
      G.X(p,q)=vc(1);
      G.Y(p,q)=vc(2);
      G.Z(p,q)=vc(3);
    end;
  end;

endfunction
  
