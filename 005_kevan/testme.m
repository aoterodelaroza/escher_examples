#! /usr/bin/octave -q

atoms = {"al","p","s","si"};
for i = 1:length(atoms)
  at = atoms{i};
  mol = mol_readcube(sprintf("%s-grad.cube",at));
  rdg = grid_readcube(sprintf("%s-grad.cube",at));
  rep = representation_();
  rep = mol_ball(mol,rep,"O");
  rep = mol_ball(mol,rep,"H");
  rep = mol_stick(mol,rep);
  rep = grid_isosurface(rdg,rep,0.5,[0 255 0],:,"tdefault");
  rep_write_obj(rep,sprintf("%s.obj",at));
  rep = rep_setdefaultscene_view3dscene(rep,[-5.69 6.67 14.68],[0.33 -0.39 -0.86],[0.17 0.92 -0.35]);
  rep_write_pov(rep,sprintf("%s.pov",at));
  run_povray(at);
endfor
