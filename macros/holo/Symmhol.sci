function h=Symmhol(h_old,n);

  h.history=AddHistory('','Symmhol',h_old,n);
  h.status=string(n)+'symmetry applied';

  h=h_old;
  if n==8
    fi=%pi/2;
    Mxr=[1 0 0; 0 cos(fi) sin(fi); 0 -1*sin(fi) cos(fi)];
    Myr=[cos(fi) 0 sin(fi); 0 1 0; -1*sin(fi) 0 cos(fi)];
    Mzr=[cos(fi) sin(fi) 0; -1*sin(fi) cos(fi) 0; 0 0 1];
    h.q=[h_old.q,h_old.q,h_old.q,h_old.q];
    h.q=[h.q,h.q,h.q]/12;
    h.mon=[h_old.mon,h_old.mon,h_old.mon,h_old.mon];
    h.mon=[h.mon,h.mon,h.mon]/12;
    h.filt=[h_old.filt,h_old.filt,h_old.filt,h_old.filt];
    h.filt=[h.filt,h.filt,h.filt]/12;
    ierr=execstr('tmphh=h_old.hmod','errcatch');
    if ierr==0 then   
      s=size(tmphh);
      ss=s(1)*s(2);
      tmph2=[tmphh,tmphh,tmphh,tmphh];
      tmph2=[tmph2,tmph2,tmph2]/12;
      h.hmod=tmph2;
    end;
    ierr=execstr('tmphh=h_old.h','errcatch');
    if ierr==0 then   
      s=size(tmphh);
      ss=s(1)*s(2);
      tmph2=[tmphh,tmphh,tmphh,tmphh];
      tmph2=[tmph2,tmph2,tmph2]/12;
      h.h=tmph2;
    end;
  
    tmpk=[h.X(1:ss),h.Y(1:ss),h.Z(1:ss)];
    for sn=3:-1:1
      tmpk2=tmpk*Mxr^sn;
      h.X=[h.X,matrix(tmpk2(:,1),s)];
      h.Y=[h.Y,matrix(tmpk2(:,2),s)];
      h.Z=[h.Z,matrix(tmpk2(:,3),s)];
    end;
    for sn=3:-1:0
      tmpk2=tmpk*Myr^sn;
      h.X=[h.X,matrix(tmpk2(:,1),s)];
      h.Y=[h.Y,matrix(tmpk2(:,2),s)];
      h.Z=[h.Z,matrix(tmpk2(:,3),s)];
    end;
    for sn=3:-1:0
      tmpk2=tmpk*Mzr^sn;
      h.X=[h.X,matrix(tmpk2(:,1),s)];
      h.Y=[h.Y,matrix(tmpk2(:,2),s)];
      h.Z=[h.Z,matrix(tmpk2(:,3),s)];
    end;     
  end;
endfunction


    
    
