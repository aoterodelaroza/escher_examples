#! /usr/bin/octave -q

list={"bag","boat1","boat2","book1","book2","cage","chair","prism"};

for i = 1:length(list)
  mol = mol_readxyz(sprintf("%s.xyz",list{i}),0);
  rep = mol_ball(mol,:,"H",:,:);
  rep = mol_ball(mol,rep,"O",:,:);
  rep = mol_stick(mol,rep,"O","H",[0.8 1.1]);
  rep = mol_stick(mol,rep,"O","H",[1.5 2.3],:,0.01,[0 0 255]);
  rep_write_obj(rep,sprintf("%s.obj",list{i}));
endfor
