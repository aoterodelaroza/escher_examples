#! /usr/bin/octave -q

list = [0 30 60 90 120 150 180];

mol = mol_readxyz("adenine_thymine_stack.xyz");
rep0 = mol_ball(mol);
rep0 = mol_stick(mol,rep0);
rep0 = rep_refaxes(rep0,2,0.1);

for i = 1:length(list)
  rep = rep_setdefaultscene_tessel(rep0,[list(i) 75 45]);
  rep_write_pov(rep,sprintf("atstack_phi%3.3d.pov",list(i)));
  run_povray(sprintf("atstack_phi%3.3d",list(i)));
endfor


