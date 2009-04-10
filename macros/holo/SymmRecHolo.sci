// Written by Marton Marko
// marko@szfki.hu
 
function H=SymmRecHolo(H_old,nsym)

  H=H_old;
  H.name=H.name+'Symm'+string(nsym);

// writing history;
  h.history=AddHistory('','SymmRecHolo',H_old,nsym);
  
  s=size(H_old.H);

  c=(s+1)/2;
  select nsym
    case 0 then
       for n=1:s(3)
        n2=s(3)-n+1;
        H.H(:,:,n)=(H_old.H(:,:,n)+H_old.H(s(1):-1:1,s(2):-1:1,n2))/2;
        H.Hmod(:,:,n)=(H_old.Hmod(:,:,n)+H_old.Hmod(s(1):-1:1,s(2):-1:1,n2))/2;
      end;     
    case 4 then
      for n=1:s(3)
        H.H(:,:,n)=(H_old.H(:,:,n)+H_old.H(1:s(1),s(2):-1:1,n)'+H_old.H(s(1):-1:1,1:s(2),n)'+H_old.H(s(1):-1:1,s(2):-1:1,n))/4;
        H.Hmod(:,:,n)=(H_old.Hmod(:,:,n)+H_old.Hmod(1:s(1),s(2):-1:1,n)'+H_old.Hmod(s(1):-1:1,1:s(2),n)'+H_old.Hmod(s(1):-1:1,s(2):-1:1,n))/4;
      end;
    case 6 then
      for n=1:s(1)
        tmph=H_old.H(:,:,n);
        tmph=(tmph+tmph(1:s(1),s(2):-1:1)'+tmph(s(1):-1:1,1:s(2))'+tmph(s(1):-1:1,s(2):-1:1))/16;  
        tmph2=permute(H_old.H(:,n,:),[1,3,2]);
        tmph2=(tmph2+tmph2(1:s(1),s(2):-1:1)'+tmph2(s(1):-1:1,1:s(2))'+tmph2(s(1):-1:1,s(2):-1:1))/16;  
        tmph=tmph+tmph2(:,s(2):-1:1);
        tmph2=permute(H_old.H(:,s(2)+1-n,:),[1,3,2]);
        tmph2=(tmph2+tmph2(1:s(1),s(2):-1:1)'+tmph2(s(1):-1:1,1:s(2))'+tmph2(s(1):-1:1,s(2):-1:1))/16;  
        tmph=tmph+tmph2;
        tmph2=H_old.H(:,:,s(2)+1-n);
        tmph2=(tmph2+tmph2(1:s(1),s(2):-1:1)'+tmph2(s(1):-1:1,1:s(2))'+tmph2(s(1):-1:1,s(2):-1:1))/16;  
        tmph=tmph+tmph2(:,s(2):-1:1);
        H.H(:,:,n)=tmph;
        tmph=H_old.Hmod(:,:,n);
        tmph=(tmph+tmph(1:s(1),s(2):-1:1)'+tmph(s(1):-1:1,1:s(2))'+tmph(s(1):-1:1,s(2):-1:1))/16;  
        tmph2=permute(H_old.Hmod(:,n,:),[1,3,2]);
        tmph2=(tmph2+tmph2(1:s(1),s(2):-1:1)'+tmph2(s(1):-1:1,1:s(2))'+tmph2(s(1):-1:1,s(2):-1:1))/16;  
        tmph=tmph+tmph2(:,s(2):-1:1);
        tmph2=permute(H_old.Hmod(:,s(2)+1-n,:),[1,3,2]);
        tmph2=(tmph2+tmph2(1:s(1),s(2):-1:1)'+tmph2(s(1):-1:1,1:s(2))'+tmph2(s(1):-1:1,s(2):-1:1))/16;  
        tmph=tmph+tmph2;
        tmph2=H_old.Hmod(:,:,s(2)+1-n);
        tmph2=(tmph2+tmph2(1:s(1),s(2):-1:1)'+tmph2(s(1):-1:1,1:s(2))'+tmph2(s(1):-1:1,s(2):-1:1))/16;  
        tmph=tmph+tmph2(:,s(2):-1:1);
        H.Hmod(:,:,n)=tmph;  
      end;
    case 8 then
      for n=1:s(1)
        tmph=H.H(:,:,n);
        tmph=(tmph+tmph(1:s(1),s(2):-1:1)'+tmph(s(1):-1:1,1:s(2))'+tmph(s(1):-1:1,s(2):-1:1))/4;
        H.H(:,:,n)=tmph(:,:,1);
        tmph=H.Hmod(:,:,n);
        tmph=(tmph+tmph(1:s(1),s(2):-1:1)'+tmph(s(1):-1:1,1:s(2))'+tmph(s(1):-1:1,s(2):-1:1))/4;
        H.Hmod(:,:,n)=tmph(:,:,1);
      end;
      for n=1:s(2)
        tmph=permute(H.H(:,n,:),[1,3,2]);
        tmph=(tmph+tmph(1:s(1),s(2):-1:1)'+tmph(s(1):-1:1,1:s(2))'+tmph(s(1):-1:1,s(2):-1:1))/4;
        H.H(:,n,:)=permute(tmph(:,:,1),[1,3,2]);
        tmph=permute(H.Hmod(:,n,:),[1,3,2]);
        tmph=(tmph+tmph(1:s(1),s(2):-1:1)'+tmph(s(1):-1:1,1:s(2))'+tmph(s(1):-1:1,s(2):-1:1))/4;
        H.Hmod(:,n,:)=permute(tmph(:,:,1),[1,3,2]);
      end;
      for n=1:s(3)
        tmph=permute(H.H(n,:,:),[2,3,1]);
        tmph=(tmph+tmph(1:s(1),s(2):-1:1)'+tmph(s(1):-1:1,1:s(2))'+tmph(s(1):-1:1,s(2):-1:1))/4;
        H.H(n,:,:)=permute(tmph(:,:,1),[3,1,2]);
        tmph=permute(H.Hmod(n,:,:),[2,3,1]);
        tmph=(tmph+tmph(1:s(1),s(2):-1:1)'+tmph(s(1):-1:1,1:s(2))'+tmph(s(1):-1:1,s(2):-1:1))/4;
        H.Hmod(n,:,:)=permute(tmph(:,:,1),[3,1,2]);
      end;
  end;
  
 endfunction

    
