#! /usr/bin/octave -q

mol = mol_readcube("c2h4.cube");
grid = grid_readcube("c2h4.cube");

rep = mol_ball(mol);
rep = mol_stick(mol,rep);
rep = grid_isosurface(grid,rep,0.1,[255 0 0 225],[128 0 0]);

rep_write_obj(rep,"c2h4.obj");
rep = rep_setdefaultscene_view3dscene(rep,[-6.05 1.10 -1.78],[0.94 -0.17 0.28],[0.16 1.0 0.0]);
rep_write_pov(rep,"c2h4.pov");
run_povray("c2h4");

