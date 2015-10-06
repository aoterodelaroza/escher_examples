#! /usr/bin/octave -q

list = {"c6h6_c6h6_stack","ch4_ch4","ch4_hf","h2co_h2co","h2o_h2o","phenol_phenol"};

for i = 1:length(list)
  mol = mol_readxyz(sprintf("%s.xyz",list{i}));
  rep = mol_ball(mol);
  rep = mol_stick(mol,rep);
  rep = mol_stick(mol,rep,"O","H",[1.8,2.0],:,0.01,[0 255 0]);
  rep_write_obj(rep,sprintf("%s.obj",list{i}));
endfor
