#! /usr/bin/octave -q

list = {"adenine","bda_trans","benzene","cytosine","furan",...
        "guanine","pyridine","thiophene","thiophenol","thymine"};
r=[
   0 0 45
   0 0 45
   0 0 45
   0 0 45
   0 0 45
   0 0 45
   90 0 45
   0 0 45
   0 0 45
   0 0 45
   ];

for i = 1:length(list)
  mol = mol_readxyz(sprintf("%s.xyz",list{i}));
  rep = mol_ball(mol);
  rep = mol_stick(mol,rep);
  rep = rep_setdefaultscene_tessel(rep,r(i,:));
  name = sprintf("%2.2d_%s",i,list{i});
  rep_write_pov(rep,sprintf("%s.pov",name));
  run_povray(name);
endfor

