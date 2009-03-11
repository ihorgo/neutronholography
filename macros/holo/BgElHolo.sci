// Written by Marton Marko
// marko@szfki.hu
// BgElHolo function eliminates the background of the normalized hologam
// and multiplies the data with the Jacobi-determinant
 
function h=BgElHolo(h_old)

  h=h_old;
  h.name='BgElHolo';

// writing history;
  h.history=AddHistory('','BgElHolo',h_old);
  
  s=size(h_old.X);
  if max(size(s))==3
    mwl=s(3);
  else
    mwl=1;
  end;
  
  ierr=execstr('tmphh=h_old.h','errcatch');
  if ierr==0 then
    for n=1:mwl
      q=h_old.q.*h_old.filt(:,:,n);
      tmph=tmphh(:,:,n)-mean(tmphh(:,:,n).*q)/mean(q);
      h.h(:,:,n)=tmph.*q/sum(q)*4*%pi;
    end;
  end;

  ierr=execstr('tmphh=h_old.hmod','errcatch');
  if ierr==0 then
    for n=1:mwl
      q=h_old.q.*h_old.filt(:,:,n);
      tmph=tmphh(:,:,n)-mean(tmphh(:,:,n).*q)/mean(q);
      h.hmod(:,:,n)=tmph.*q/sum(q)*4*%pi;
    end;
  end;

  h.status='normalized, without bg';
  s=size(h.operations);
  if s(1)==1
    if h.operations(1)==''
      s(1)=0;
    end;
  end;
  h.operations(s(1)+1)='bg elimination';
  h.operations(s(1)+2)='using Jacobi determinant';
endfunction

    
