#! /usr/bin/octave -q

format long
mdi = 0.60;

function rgb = colorscale(r,m)
  ff = (r/m)^(1/2);
  rgb = [255, 255-round(min(ff,1)*255), 255-round(min(ff,1)*255)];
endfunction

function di = aimall_read_delta(file)
  fid = fopen(file,'r');
  dilist = [];
  while(1)
    line = fgetl(fid);
    if (line == -1)
       break
    endif
    if (strcmp(line,"Diatomic Electron Pair Contributions and Delocalization Data:"))
       fskipl(fid,13);
       while(1)
         line = fgetl(fid);
         if (length(line) <= 1)
           break
         endif
         [dum1 dum2 dum3 dix] = sscanf(line,"%s %s %s %e","C");
         dilist = [dilist; dix];
       endwhile
       break
    endif
  endwhile
  nat = (sqrt(1 + 8*length(dilist)) + 1) / 2;
  di = zeros(nat);
  n = 0;
  for j = 2:nat
    for i = 1:j-1
        n++;
        di(i,j) = di(j,i) = dilist(n);
    endfor
  endfor
  fclose(fid);
endfunction

di = aimall_read_delta("NH3_NIS.sum");
mol = mol_readxyz("NH3_NIS.xyz");

## the molecule with normal colors
rep = representation_();
rep = mol_ball(mol,rep);
rep = mol_stick(mol,rep);
rep = rep_setdefaultscene(rep);
rep_write_pov(rep,"NH3_NIS.pov");
run_povray("NH3_NIS");

## deltas and lambdas
n = mol.nat;
for i = 1:n
  name = sprintf("NH3_NIS_%2.2d",i);
  rep = representation_();
  ## the orange ball
  rep = mol_ball(mol_getfragment(mol,[i]),rep,:,:,:,[255 165 0]);
  ## the rest of the balls
  for j = 1:n
    if (j == i)
       continue
    endif
    rep = mol_ball(mol_getfragment(mol,[j]),rep,:,:,:,colorscale(di(i,j),mdi));
  endfor
  rep = mol_stick(mol,rep);
  rep = rep_setdefaultscene(rep);
  rep_write_pov(rep,sprintf("%s.pov",name));
  run_povray(name);
endfor
